part of 'add_product_bloc.dart';

@freezed
class AddProductState with _$AddProductState {
  const factory AddProductState.initial() = _Initial;
  const factory AddProductState.loading() = _Loading;
  const factory AddProductState.failure() = _Failure;
  const factory AddProductState.addServiceSuccess() = _AddServiceSuccess;
  const factory AddProductState.loadDataSuccess({
    required AddProductModel model,
    required String cate,
    required String providerID,
    required String sName,
  }) = _LoadDataSuccess;
}
