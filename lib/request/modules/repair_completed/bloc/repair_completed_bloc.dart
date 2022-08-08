import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/models.dart';

part 'repair_completed_bloc.freezed.dart';
part 'repair_completed_event.dart';
part 'repair_completed_state.dart';

class RepairCompletedBloc
    extends Bloc<RepairCompletedEvent, RepairCompletedState> {
  RepairCompletedBloc() : super(const _Initial()) {
    on<RepairCompletedEvent>(_onEvent);
  }

  Future<void> _onEvent(
    RepairCompletedEvent event,
    Emitter<RepairCompletedState> emit,
  ) async {
    // TODO(tcmhoang): depressed cannot review this file
    /// someone please help m
    await event.when(
      started: () async {
        emit(const RepairCompletedState.loading());

        const repairCompletedState = RepairCompletedModel(
          collectMoneyCustomers: 257000,
          vehicleType: 'Wave RSX',
          totalService: 4,
        );

        emit(
          const RepairCompletedState.success(
            repairCompletedState: repairCompletedState,
          ),
        );
      },
    );
  }
}