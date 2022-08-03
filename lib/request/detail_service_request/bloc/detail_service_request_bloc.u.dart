import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/bonus_services_model.dart';
import '../model/repair_record_model.dart';
import '../model/request_service_model.dart';

part 'detail_service_request_bloc.u.freezed.dart';
part 'detail_service_request_event.u.dart';
part 'detail_service_request_state.u.dart';

class DetailServiceRequestBloc
    extends Bloc<DetailServiceRequestEvent, DetailServiceRequestState> {
  DetailServiceRequestBloc() : super(const _Initial()) {
    on<DetailServiceRequestEvent>(_onEvent);
  }
  int feeTransport = 25000;
  int temporary = 0;
  Future<void> _onEvent(
    DetailServiceRequestEvent event,
    Emitter<DetailServiceRequestState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const DetailServiceRequestState.loading());
        final requestServiceModel = [
          const RequestServiceModel(
            name: 'Thay săm',
            price: 170000,
          ),
          const RequestServiceModel(
            name: 'Thay săm',
            price: 170000,
          ),
          const RequestServiceModel(
            name: 'Thay săm',
            price: 170000,
          ),
          const RequestServiceModel(
            name: 'Thay săm',
            price: 170000,
          ),
          const RequestServiceModel(
            name: 'Thay săm',
            price: 170000,
          ),
          const RequestServiceModel(
            name: 'Thay săm',
            price: 170000,
          ),
          const RequestServiceModel(
            name: 'Thay săm',
            price: 170000,
          ),
          const RequestServiceModel(
            name: 'Thay săm',
            price: 170000,
          ),
        ];
        final bonustServiceModel = [
          const BonusServicesModel(
            name: 'Bọc yên xe',
            price: 170000,
          ),
          const BonusServicesModel(
            name: 'Bọc yên xe',
            price: 170000,
          ),
        ];

        for (var i = 0; i < requestServiceModel.length; i++) {
          temporary += requestServiceModel.elementAt(i).price;
        }
        for (var i = 0; i < bonustServiceModel.length; i++) {
          temporary += bonustServiceModel.elementAt(i).price;
        }
        temporary = temporary + feeTransport;
        final repairRecordModel = RepairRecordModel(
          requestServiceModel: requestServiceModel,
          bonusServicesModel: bonustServiceModel,
          feeTransport: feeTransport,
          temporary: temporary,
        );

        emit(
          DetailServiceRequestState.success(
            repairRecordModel: repairRecordModel,
          ),
        );
      },
    );
  }
}
