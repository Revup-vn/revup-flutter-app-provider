import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../../new_request/models/pending_repair_request.dart';
import '../../../models/pending_service_model.dart';

part 'info_request_bloc.freezed.dart';
part 'info_request_event.dart';
part 'info_request_state.dart';

class InfoRequestBloc extends Bloc<InfoRequestEvent, InfoRequestState> {
  InfoRequestBloc(
    this.consumer,
    this.record,
    this.distance,
    this.pendingService,
    this.pendingAmount,
    this._userStore,
    this._repairRecord,
    this.storeRepository,
  ) : super(const _Initial()) {
    on<InfoRequestEvent>(_onEvent);
  }
  final AppUser consumer;
  final PendingRepairRequest record;
  final double distance;
  final IList<PendingServiceModel> pendingService;
  final int pendingAmount;
  final IStore<AppUser> _userStore;
  final IStore<RepairRecord> _repairRecord;
  final StoreRepository storeRepository;

  Future<void> _onEvent(
    InfoRequestEvent event,
    Emitter<InfoRequestState> emit,
  ) async {
    await event.when(
      started: () async {
        print('in here');
        emit(const InfoRequestState.loading());
        // get `need to verify` service list
        final needToVerifyService = (await storeRepository
                .repairPaymentRepo(
                  RepairRecordDummy.dummyStarted(record.id),
                )
                .all())
            .map<IList<PaymentService>>(
              (r) => r.filter(
                (a) =>
                    a.maybeMap(needToVerify: (_) => true, orElse: () => false),
              ),
            )
            .fold((l) => ilist(<PaymentService>[]), (r) => r);

        emit(
          InfoRequestState.success(
            consumer: consumer,
            distance: distance,
            pendingService: pendingService,
            pendingAmount: pendingAmount,
            needToVerifyService: needToVerifyService,
            record: record,
          ),
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
