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
    this.record,
    this._repairRecord,
    this._userRepos,
    this._paymentService,
    this.user,
    this.storeRepository,
  ) : super(const _Initial()) {
    on<InfoRequestEvent>(_onEvent);
  }
  final PendingRepairRequest record;
  final IStore<RepairRecord> _repairRecord;
  final IStore<AppUser> _userRepos;
  final IStore<PaymentService> _paymentService;
  final StoreRepository storeRepository;
  final AppUser user;
  // final StreamSubscription<Position> _sPosition;

  Future<void> _onEvent(
    InfoRequestEvent event,
    Emitter<InfoRequestState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const InfoRequestState.loading());
        final needToVerifyService = (await _paymentService.all())
            .map<IList<PaymentService>>(
              (r) => r.filter(
                (a) =>
                    a.maybeMap(needToVerify: (_) => true, orElse: () => false),
              ),
            )
            .fold((l) => ilist(<PaymentService>[]), (r) => r);
        await emit.forEach<QuerySnapshot<Map<String, dynamic>>>(
          _paymentService.collection().snapshots(),
          onData: (data) {
            final len = data.docs
                .map(_paymentService.parseRawData)
                .fold<IList<PaymentService>>(
                  nil(),
                  (p, e) => e.fold(
                    (l) => p,
                    (r) => cons(r, p),
                  ),
                )
                .length();
            return InfoRequestState.success(
              needToVerifyService: needToVerifyService,
              record: record,
              len: len,
            );
          },
        );
      },
      confirmArrived: () async {
        await _repairRecord.update(
          RepairRecord.arrived(
            id: record.id,
            cid: record.cid,
            pid: record.pid,
            created: record.created,
            desc: record.desc,
            vehicle: record.vehicle,
            money: record.money,
            moving: DateTime.now(), // temp
            arrived: DateTime.now(),
            from: record.from,
            to: record.to,
          ),
        );
      },
      confirmStarted: () async {
        // update record to started
        await _repairRecord.update(
          RepairRecord.started(
            id: record.id,
            cid: record.cid,
            pid: record.pid,
            created: record.created,
            desc: record.desc,
            vehicle: record.vehicle,
            money: record.money,
            moving: DateTime.now(), // temp
            from: record.from,
            to: record.to, started: DateTime.now(),
          ),
        );
      },
      confirmDeparted: (onRoute, sendMessage) async {
        // get latest consumer fcm token
        final consumer = (await _userRepos.get(record.cid))
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
}
