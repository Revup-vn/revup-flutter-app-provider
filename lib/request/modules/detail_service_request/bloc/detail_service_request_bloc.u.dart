import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/models.dart';
import '../models/models.dart';

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
    // TODO(tcmhoang): Depressed cannot understand the code flow
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
        final bonusServiceModel = [
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
        for (var i = 0; i < bonusServiceModel.length; i++) {
          temporary += bonusServiceModel.elementAt(i).price;
        }
        temporary = temporary + feeTransport;
        final repairRecordModel = RepairRecordModel(
          requestServiceModel: requestServiceModel,
          bonusServicesModel: bonusServiceModel,
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
