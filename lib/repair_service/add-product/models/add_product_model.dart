import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_model.freezed.dart';

@freezed
class AddProductModel with _$AddProductModel {
  factory AddProductModel({
    required String imageUrl,
    required String productName,
    required int productFee,
    required String des,
  }) = _AddProductModel;
}
