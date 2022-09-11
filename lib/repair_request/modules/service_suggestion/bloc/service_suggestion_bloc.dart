import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../models/pending_service_model.dart';
import '../../../models/service_data.dart';

part 'service_suggestion_bloc.freezed.dart';
part 'service_suggestion_event.dart';
part 'service_suggestion_state.dart';

class ServiceSuggestionBloc
    extends Bloc<ServiceSuggestionEvent, ServiceSuggestionState> {
  ServiceSuggestionBloc(this.recordId, this._repairRecord, this.sr)
      : super(const _Initial()) {
    on<ServiceSuggestionEvent>(_onEvent);
    _s = _repairRecord
        .collection()
        .doc(recordId)
        .collection('payment')
        .snapshots()
        .listen((event) {
      add(const ServiceSuggestionEvent.started());
    });
  }
  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _s;
  final String recordId;
  final IStore<RepairRecord> _repairRecord;
  final StoreRepository sr;

  FutureOr<void> _onEvent(
    ServiceSuggestionEvent event,
    Emitter<ServiceSuggestionState> emit,
  ) async {
    emit(const ServiceSuggestionState.loading());
    final maybeRepairRecord = (await _repairRecord.get(recordId))
        .map<Option<RepairRecord>>(
          (r) => r.maybeMap(
            orElse: none,
            started: some,
          ),
        )
        .fold<Option<RepairRecord>>((l) => none(), (r) => r);

    if (maybeRepairRecord.isNone()) {
      emit(const ServiceSuggestionState.failure());
    } else {
      final record = maybeRepairRecord.getOrElse(() => throw NullThrownError());
      // load current payment service
      final paymentList = (await sr
              .repairPaymentRepo(
                record,
              )
              .all())
          .fold<IList<PaymentService>>((l) => nil(), (r) => r)
          .map<PendingServiceModel>(
            (a) => PendingServiceModel.fromDto(paymentService: a),
          );
      // load active service and filter active service not in payment list
      final svProvider = (await sr
              .repairServiceRepo(
                AppUserDummy.dummyProvider(record.pid),
                RepairCategoryDummy.dummy(
                  record.vehicle == 'car' ? 'Oto' : 'Xe máy',
                ),
              )
              .where('active', isEqualTo: true))
          .fold<IList<ServiceData>>(
            (l) => nil(),
            (r) => r.map(ServiceData.fromDtos),
          )
          .toList()
        ..removeWhere((e) => paymentList.any((a) => a.name == e.name));

      emit(ServiceSuggestionState.success(repairService: svProvider));
    }
  }

  @override
  Future<void> close() async {
    await _s?.cancel();
    return super.close();
  }
}
