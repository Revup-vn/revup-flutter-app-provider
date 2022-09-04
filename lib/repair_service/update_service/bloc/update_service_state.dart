part of 'update_service_bloc.dart';

@freezed
class UpdateServiceState with _$UpdateServiceState {
  const factory UpdateServiceState.initial() = _Initial;
  const factory UpdateServiceState.loadDataSuccess({
    required UpdateServiceModel model,
  }) = _LoadDataSuccess;
  const factory UpdateServiceState.loading() = _Loading;
  const factory UpdateServiceState.failure() = _Failure;
  const factory UpdateServiceState.sumbitSuccess() = _SumbitSuccess;
  const factory UpdateServiceState.deleteSuccess() = _DeleteSuccess;
}
