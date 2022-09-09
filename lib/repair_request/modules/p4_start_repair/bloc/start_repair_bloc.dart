import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revup_core/core.dart';

import '../../../../new_request/models/pending_repair_request.dart';

part 'start_repair_bloc.freezed.dart';
part 'start_repair_event.dart';
part 'start_repair_state.dart';

class StartRepairBloc extends Bloc<StartRepairEvent, StartRepairState> {
  StartRepairBloc(
    this.recordId,
    this._repairRecord,
    this._userRepos,
    this._paymentService,
    this.user,
    this.storeRepository,
  ) : super(const _Initial()) {
    on<StartRepairEvent>(_onEvent);
    _sPosition = _repairRecord
        .collection()
        .where('id', isEqualTo: recordId)
        .snapshots()
        .listen((event) {
      add(const StartRepairEvent.started());
    });
  }
  final String recordId;
  final IStore<RepairRecord> _repairRecord;
  final IStore<AppUser> _userRepos;
  final IStore<PaymentService> _paymentService;
  final StoreRepository storeRepository;
  final AppUser user;
  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _sPosition;

  Future<void> _onEvent(
    StartRepairEvent event,
    Emitter<StartRepairState> emit,
  ) async {
    await event.when(
      cancel: (onRoute, sendMessage) async {
        emit(const StartRepairState.loading());
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
        emit(const StartRepairState.loading());
        (await _repairRecord.get(recordId)).map(
          (r) => r.maybeMap(
            orElse: () => emit(const StartRepairState.failure()),
            started: (value) => value,
            accepted: (value) => value,
          ),
        );

        final maybeRecord = (await _repairRecord.get(recordId))
            .map(
              (r) => r.maybeMap<Option<PendingRepairRequest>>(
                started: (v) =>
                    some(PendingRepairRequest.fromDto(repairRecord: v)),
                arrived: (v) =>
                    some(PendingRepairRequest.fromDto(repairRecord: v)),
                orElse: none,
              ),
            )
            .fold<Option<PendingRepairRequest>>((l) => none(), (r) => r);

        if (maybeRecord.isNone()) {
          emit(const StartRepairState.failure());
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

              return StartRepairState.success(
                needToVerifyService: needToVerifyService,
                record: record,
                len: lst.length(),
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
    await _sPosition.cancel();
    return super.close();
  }
}
