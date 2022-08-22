part of 'p14_repair_completed_cubit.dart';

@freezed
class P14RepairCompletedState with _$P14RepairCompletedState {
  const factory P14RepairCompletedState.initial() = _Initial;
  const factory P14RepairCompletedState.failed() = _Failed;
  const factory P14RepairCompletedState.uploading() = _Uploading;
  const factory P14RepairCompletedState.succeeded() = _Succeeded;
}
