part of 'detail_service_bloc.dart';

@freezed
class DetailServiceState with _$DetailServiceState {
  const factory DetailServiceState.initial() = _Initial;
  const factory DetailServiceState.loadDataSuccess({
    required RepairService rpService,
    required IList<RepairProduct> rpProduct,
    required String cate,
  }) = _LoadDataSuccess;
  const factory DetailServiceState.loading() = _Loading;
  const factory DetailServiceState.failure() = _Failure;
}
