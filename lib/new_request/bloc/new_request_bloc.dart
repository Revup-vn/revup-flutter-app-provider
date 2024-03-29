import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revup_core/core.dart';

import '../../map/map_api/map_api.dart';
import '../../map/models/directions_model.dart';
import '../../repair_request/models/need_to_verify_model.dart';
import '../../repair_request/models/pending_service_model.dart';
import '../models/pending_repair_request.dart';

part 'new_request_bloc.freezed.dart';
part 'new_request_event.dart';
part 'new_request_state.dart';

class NewRequestBloc extends Bloc<NewRequestEvent, NewRequestState> {
  NewRequestBloc(
    this._repairRecord,
    this._userStore,
    this.storeRepository,
    this.recordId,
    this.userId,
  ) : super(const _Initial()) {
    on<NewRequestEvent>(_onEvent);
  }
  final IStore<AppUser> _userStore;
  final IStore<RepairRecord> _repairRecord;
  final StoreRepository storeRepository;
  final String recordId;
  final String userId;

  FutureOr<void> _onEvent(
    NewRequestEvent event,
    Emitter<NewRequestState> emit,
  ) async {
    await event.when(
      started: () async {
        final repairRecord = (await _repairRecord.get(recordId))
            .map<Option<RepairRecord>>(
              (r) => r.maybeMap(
                pending: some,
                orElse: none,
              ),
            )
            .fold<Option<RepairRecord>>(
              (l) => none(),
              (r) => r,
            )
            .getOrElse(() => throw NullThrownError());
        final pendingRequest =
            PendingRepairRequest.fromDto(repairRecord: repairRecord);
        final consumer = (await _userStore.get(repairRecord.cid))
            .fold<Option<AppUser>>(
              (l) => none(),
              some,
            )
            .getOrElse(() => throw NullThrownError());

        final fromLoc = LatLng(repairRecord.from.lat, repairRecord.from.long);
        final toLoc = LatLng(repairRecord.to.lat, repairRecord.to.long);
        final directions = await getDirections(fromLoc, toLoc);
        final toMarker =
            Marker(markerId: const MarkerId('_to'), position: toLoc);
        final fromMarker = Marker(
          markerId: const MarkerId('_from'),
          position: fromLoc,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        );

        final pendingService =
            (await storeRepository.repairPaymentRepo(repairRecord).all())
                .map(
                  (r) => r.map<Option<PendingServiceModel>>(
                    (a) => a.maybeMap(
                      pending: (v) =>
                          some(PendingServiceModel.fromDto(paymentService: v)),
                      paid: (v) =>
                          some(PendingServiceModel.fromDto(paymentService: v)),
                      orElse: none,
                    ),
                  ),
                )
                .fold((l) => ilist(<Option<PendingServiceModel>>[]), (r) => r)
                .filter(
                  (a) => a.isSome(),
                )
                .map(
                  (a) => a.getOrElse(() => throw NullThrownError()),
                );
        final transFee = pendingService.toList().firstWhere(
              (a) => a.name == 'transFee',
            );
        final pendingAmount = pendingService
                .toList()
                .where((element) => element.name != 'transFee')
                .fold(
                  0,
                  (p, e) =>
                      p +
                      ((e.price == -1 ? 0 : e.price) +
                          (e.products.isEmpty
                              ? 0
                              : e.products.first.unitPrice *
                                  e.products.first.quantity)),
                ) +
            (transFee.status == 'pending' ? transFee.price : -transFee.price);

        final len = (await (storeRepository.repairPaymentRepo(
          RepairRecordDummy.dummyPending(recordId),
        )).all())
            .map(
              (r) => r.filter(
                (a) => a.map(
                  pending: (v) => v.serviceName != 'transFee',
                  paid: (v) => false,
                  needToVerify: (v) => true,
                ),
              ),
            )
            .fold((l) => ilist(<Option<PendingServiceModel>>[]), (r) => r)
            .length();

        (await storeRepository.repairPaymentRepo(repairRecord).all())
            .map<IList<PaymentService>>(
              (r) => r.filter(
                (a) => a.maybeMap(
                  paid: (_) => false,
                  orElse: () => true,
                ),
              ),
            )
            .map(
              (r) => r
                  .map(
                    (a) => a.map(
                      pending: (v) => PendingServiceModel(
                        name: v.serviceName,
                        price: v.moneyAmount +
                            (v.products.isEmpty
                                ? 0
                                : v.products
                                    .map((e) => e.quantity * e.unitPrice)
                                    .reduce(
                                      (value, element) => value + element,
                                    )),
                        isOptional: v.isOptional,
                        products: v.products,
                      ),
                      paid: (v) => throw NullThrownError(),
                      needToVerify: (v) => NeedToVerifyModel(
                        serviceName: v.serviceName,
                        desc: v.desc,
                      ),
                    ),
                  )
                  .partition((a) => a is NeedToVerifyModel)
                  .apply(
                (a, b) {
                  emit(
                    NewRequestState.success(
                      directions: directions,
                      fromMarker: fromMarker,
                      toMarker: toMarker,
                      consumer: consumer,
                      record: pendingRequest,
                      pendingService: b.toList().cast<PendingServiceModel>(),
                      needToVerifyService: a.toList().cast<NeedToVerifyModel>(),
                      pendingAmount: pendingAmount,
                      len: len,
                      transFee: transFee,
                    ),
                  );
                },
              ),
            );
      },
      accepted: (record, onRoute, sendMessage) async {
        // update repair record with accepted type
        await _repairRecord.update(
          RepairRecord.accepted(
            id: record.id,
            cid: record.cid,
            pid: record.pid,
            created: record.created,
            desc: record.desc,
            vehicle: record.vehicle,
            money: record.money,
            moving: DateTime.now(),
            from: record.from,
            to: record.to,
          ),
        );
        // create `need to verify` service from optional service
        final _paymentServiceStore = storeRepository.repairPaymentRepo(
          RepairRecordDummy.dummyStarted(record.id),
        );

        record.optionalServices?.map(
          (e) => _paymentServiceStore.create(
            PaymentService.needToVerify(serviceName: e.name, desc: e.desc),
          ),
        );

        // get latest consumer fcm token
        final consumer = (await _userStore.get(record.cid))
            .fold<Option<AppUser>>(
              (l) => none(),
              some,
            )
            .getOrElse(() => throw NullThrownError());
        final tokens =
            (await storeRepository.userNotificationTokenRepo(consumer).all())
                .map(
                  (r) => r.toList()
                    ..sort(
                      (a, b) => b.created.millisecondsSinceEpoch
                          .compareTo(a.created.millisecondsSinceEpoch),
                    ),
                )
                .fold((l) => throw NullThrownError(), (r) => r);
        log('TOKEN:${tokens[0].token}');

        // send notification to consumer
        sendMessage(tokens[0].token);
        // route to info request
        onRoute();
      },
      decline: (record, onRoute, sendMessage) async {
        // update record to decline status
        await _repairRecord.update(
          RepairRecord.aborted(
            id: record.id,
            cid: record.cid,
            pid: record.pid,
            created: record.created,
            desc: record.desc,
            vehicle: record.vehicle,
            money: record.money,
            from: record.from,
            to: record.to,
          ),
        );
        // get consumer fcm token
        final consumer = (await _userStore.get(record.cid))
            .fold<Option<AppUser>>(
              (l) => none(),
              some,
            )
            .getOrElse(() => throw NullThrownError());
        final tokens =
            (await storeRepository.userNotificationTokenRepo(consumer).all())
                .map(
                  (r) => r.sort(
                    orderBy(StringOrder.reverse(), (a) => a.created.toString()),
                  ),
                )
                .fold((l) => throw NullThrownError(), (r) => r.toList());

        log('TOKEN:${tokens.first.token}');
        // send notification to consumer
        sendMessage(tokens.first.token);

        // set provider to online status
        _userStore.updateFields(
          AppUserDummy.dummyProvider(
            userId,
          ).maybeMap(
            orElse: () => throw NullThrownError(),
            provider: (p) => p.copyWith(
              online: true,
            ),
          ),
          cons(AppUserDummy.field(AppUserFields.Online), nil()),
        );

        // route to home page
        onRoute();
      },
    );
  }
}
