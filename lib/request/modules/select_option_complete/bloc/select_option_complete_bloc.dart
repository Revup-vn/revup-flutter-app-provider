import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/models.dart';
import '../models/models.dart';

part 'select_option_complete_bloc.freezed.dart';
part 'select_option_complete_event.dart';
part 'select_option_complete_state.dart';

class SelectOptionCompleteBloc
    extends Bloc<SelectOptionCompleteEvent, SelectOptionCompleteState> {
  SelectOptionCompleteBloc() : super(const _Initial()) {
    on<SelectOptionCompleteEvent>(_onEvent);
  }
  Future<void> _onEvent(
    SelectOptionCompleteEvent event,
    Emitter<SelectOptionCompleteState> emit,
  ) async {
    // TODO(tcmhoang): depressed cannot review this file
    /// someone please help m
    await event.when(
      started: () async {
        emit(const SelectOptionCompleteState.loading());
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

        final selectOptionCompleteModel = SelectOptionCompleteModel(
          requestServiceModel: requestServiceModel,
          bonusServicesModel: bonustServiceModel,
        );

        emit(
          SelectOptionCompleteState.success(
            selectOptionCompleteModel: selectOptionCompleteModel,
          ),
        );
      },
    );
  }
}
