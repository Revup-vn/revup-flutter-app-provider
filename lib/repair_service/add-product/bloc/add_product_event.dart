part of 'add_product_bloc.dart';

@freezed
class AddProductEvent with _$AddProductEvent {
  const factory AddProductEvent.started({required int type}) = _Started;
  const factory AddProductEvent.deleteProduct() = _Delete;
  const factory AddProductEvent.submitted({
    required AddProductModel data,
    required int type,
  }) = _Submitted;
}
