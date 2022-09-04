part of 'add_product_cubit.dart';

@freezed
class AddProductCubitState with _$AddProductCubitState {
  const factory AddProductCubitState.initial() = _Initial;
  const factory AddProductCubitState.changeActiveStatusSuccess({
    required bool status,
  }) = _Success;
}
