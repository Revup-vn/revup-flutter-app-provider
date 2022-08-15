part of 'list_service_bloc.dart';

@freezed
class ListServiceState with _$ListServiceState {
  const factory ListServiceState.initial() = _Initial;
  const factory ListServiceState.loading() = _Loading;
  const factory ListServiceState.failure() = _Failure;
  const factory ListServiceState.loadDataSuccess({
    required IList<ServiceModel> data,
    required int sortType,
  }) = _LoadDataSuccess;
}
