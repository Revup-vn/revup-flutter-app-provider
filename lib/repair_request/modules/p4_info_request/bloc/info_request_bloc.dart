import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revup_core/core.dart';

import '../../../../new_request/models/pending_repair_request.dart';

part 'info_request_bloc.freezed.dart';
part 'info_request_event.dart';
part 'info_request_state.dart';

class InfoRequestBloc extends Bloc<InfoRequestEvent, InfoRequestState> {
  InfoRequestBloc(
    this.recordId,
    this._repairRecord,
    this._userRepos,
    this._paymentService,
    this.user,
    this.storeRepository,
  ) : super(const _Initial()) {
    on<InfoRequestEvent>(_onEvent);
    _s = _paymentService.collection().snapshots().listen((event) {
      add(const InfoRequestEvent.started());
    });
  }
  final String recordId;
  final IStore<RepairRecord> _repairRecord;
  final IStore<AppUser> _userRepos;
  final IStore<PaymentService> _paymentService;
  final StoreRepository storeRepository;
  final AppUser user;
  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _s;

  Future<void> _onEvent(
    InfoRequestEvent event,
    Emitter<InfoRequestState> emit,
  ) async {
    await event.when(
      cancel: (onRoute, sendMessage) async {
        emit(const InfoRequestState.loading());
        final record = (await _repairRecord.get(recordId)).getOrElse(
          () => throw NullThrownError(),
        );
        await _repairRecord.update(
          RepairRecord.aborted(
            id: recordId,
            cid: record.cid,
            pid: record.pid,
            created: record.created,
            desc: record.desc,
            vehicle: record.vehicle,
            money: record.money,
            from: record.from,
            to: record.to,
          ),
          record,
        );
        await _userRepos.updateFields(
          AppUserDummy.dummyProvider(record.pid),
          ilist(
            [AppUserDummy.field(AppUserFields.Online)],
          ),
        );
        final tokens = (await storeRepository
                .userNotificationTokenRepo(
                  AppUserDummy.dummyConsumer(record.cid),
                )
                .all())
            .map(
              (r) => r.toList()
                ..sort(
                  (a, b) => b.created.millisecondsSinceEpoch
                      .compareTo(a.created.millisecondsSinceEpoch),
                ),
            )
            .fold((l) => throw NullThrownError(), (r) => r);
        sendMessage(tokens[0].token, recordId);
        onRoute();
      },
      started: () async {
        emit(const InfoRequestState.loading());

        final maybeRecord = (await _repairRecord.get(recordId))
            .map(
              (r) => r.maybeMap<Option<PendingRepairRequest>>(
                accepted: (v) =>
                    some(PendingRepairRequest.fromDto(repairRecord: v)),
                arrived: (v) =>
                    some(PendingRepairRequest.fromDto(repairRecord: v)),
                orElse: none,
              ),
            )
            .fold<Option<PendingRepairRequest>>((l) => none(), (r) => r);

        if (maybeRecord.isNone()) {
          emit(const InfoRequestState.failure());
        } else {
          final record = maybeRecord.getOrElse(() => throw NullThrownError());

          final needToVerifyService = (await _paymentService.all())
              .map<IList<PaymentService>>(
                (r) => r.filter(
                  (a) => a.maybeMap(
                    needToVerify: (_) => true,
                    orElse: () => false,
                  ),
                ),
              )
              .fold((l) => ilist(<PaymentService>[]), (r) => r);
          await emit.forEach<QuerySnapshot<Map<String, dynamic>>>(
            _paymentService.collection().snapshots(),
            onData: (data) {
              final lst = data.docs
                  .map(_paymentService.parseRawData)
                  .fold<IList<PaymentService>>(
                    nil(),
                    (p, e) => e.fold(
                      (l) => p,
                      (r) => cons(r, p),
                    ),
                  );

              return InfoRequestState.success(
                needToVerifyService: needToVerifyService,
                record: record,
                len: lst
                    .filter(
                      (a) => a.map(
                        pending: (v) => v.serviceName != 'transFee',
                        paid: (v) => false,
                        needToVerify: (v) => true,
                      ),
                    )
                    .length(),
                isReady: record.recordType != 'arrived',
              );
            },
          );
        }
      },
      confirmArrived: () async {
        final maybeRecord = (await _repairRecord.get(recordId))
            .map<PendingRepairRequest>(
              (r) => r.maybeMap(
                accepted: (v) => PendingRepairRequest.fromDto(repairRecord: v),
                arrived: (v) => PendingRepairRequest.fromDto(repairRecord: v),
                orElse: () => throw NullThrownError(),
              ),
            )
            .getOrElse(() => throw NullThrownError());
        await _repairRecord.update(
          RepairRecord.arrived(
            id: maybeRecord.id,
            cid: maybeRecord.cid,
            pid: maybeRecord.pid,
            created: maybeRecord.created,
            desc: maybeRecord.desc,
            vehicle: maybeRecord.vehicle,
            money: maybeRecord.money,
            moving: DateTime.now(), // temp
            arrived: DateTime.now(),
            from: maybeRecord.from,
            to: maybeRecord.to,
          ),
        );
      },
      confirmStarted: (onRoute, sendMessage) async {
        final maybeRecord = (await _repairRecord.get(recordId))
            .map<PendingRepairRequest>(
              (r) => r.maybeMap(
                accepted: (v) => PendingRepairRequest.fromDto(repairRecord: v),
                arrived: (v) => PendingRepairRequest.fromDto(repairRecord: v),
                orElse: () => throw NullThrownError(),
              ),
            )
            .getOrElse(() => throw NullThrownError());
        // update record to started
        await _repairRecord.update(
          RepairRecord.started(
            id: maybeRecord.id,
            cid: maybeRecord.cid,
            pid: maybeRecord.pid,
            created: maybeRecord.created,
            desc: maybeRecord.desc,
            vehicle: maybeRecord.vehicle,
            money: maybeRecord.money,
            moving: DateTime.now(), // temp
            from: maybeRecord.from,
            to: maybeRecord.to, started: DateTime.now(),
          ),
        );

        // get latest consumer fcm token
        final consumer = (await _userRepos.get(maybeRecord.cid))
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
        // send message to consumer
        sendMessage(tokens.first.token, recordId);

        onRoute();
      },
      confirmDeparted: (onRoute, sendMessage) async {
        final maybeRecord = (await _repairRecord.get(recordId))
            .map<PendingRepairRequest>(
              (r) => r.maybeMap(
                accepted: (v) => PendingRepairRequest.fromDto(repairRecord: v),
                arrived: (v) => PendingRepairRequest.fromDto(repairRecord: v),
                orElse: () => throw NullThrownError(),
              ),
            )
            .getOrElse(() => throw NullThrownError());
        // get latest consumer fcm token
        final consumer = (await _userRepos.get(maybeRecord.cid))
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
        // send message to consumer
        sendMessage(tokens.first.token);
        // route to map route page
        onRoute();
      },
      locationUpdated: (pos) async {
        final point = GeoFlutterFire()
            .point(latitude: pos.latitude, longitude: pos.longitude);
        final curLocation = {AppUserFields.GeoPointLocation.toString(): point};
        await _userRepos.collection().doc(user.uuid).update(curLocation);
      },
    );
  }

  @override
  Future<void> close() async {
    await _s.cancel();
    return super.close();
  }
}
