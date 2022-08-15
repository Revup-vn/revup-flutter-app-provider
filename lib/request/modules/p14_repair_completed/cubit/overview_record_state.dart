part of 'overview_record_cubit.dart';

@freezed
class OverviewRecordState with _$OverviewRecordState {
  const factory OverviewRecordState.initial() = _Initial;
  const factory OverviewRecordState.failed() = _failed;
  const factory OverviewRecordState.uploading() = _uploading;
  const factory OverviewRecordState.succeeded() = _succeeded;
}
