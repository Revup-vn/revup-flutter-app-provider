part of 'detail_service_request_bloc.u.dart';

@freezed
class DetailServiceRequestState with _$DetailServiceRequestState {
  const factory DetailServiceRequestState.initial() = _Initial;
  const factory DetailServiceRequestState.loading() = _Loading;
  const factory DetailServiceRequestState.failure() = _Failure;
  const factory DetailServiceRequestState.success({
    required RepairRecordModel repairRecordModel,
  }) = _Success;
}
