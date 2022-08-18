import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../../new_request/models/pending_repair_request.dart';

part 'info_request_bloc.freezed.dart';
part 'info_request_event.dart';
part 'info_request_state.dart';

class InfoRequestBloc extends Bloc<InfoRequestEvent, InfoRequestState> {
  InfoRequestBloc(
    this.record,
    this._userStore,
    this._repairRecord,
    this._paymentService,
  ) : super(const _Initial()) {
    on<InfoRequestEvent>(_onEvent);
  }
  final PendingRepairRequest record;
  final IStore<AppUser> _userStore;
  final IStore<RepairRecord> _repairRecord;
  final IStore<PaymentService> _paymentService;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _s;

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
    );
  }
}
