part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.addImgSuccess({required File img}) =
      _AddImgSuccess;
}
