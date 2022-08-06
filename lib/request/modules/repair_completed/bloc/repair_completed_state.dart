part of 'repair_completed_bloc.dart';

@freezed
class RepairCompletedState with _$RepairCompletedState {
  const factory RepairCompletedState.initial() = _Initial;
  const factory RepairCompletedState.loading() = _Loading;
  const factory RepairCompletedState.failure() = _Failure;
  const factory RepairCompletedState.success({
    required RepairCompletedModel repairCompletedState,
  }) = _Success;
}
