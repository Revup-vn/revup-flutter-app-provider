import 'package:freezed_annotation/freezed_annotation.dart';

part 'servicerawdata.freezed.dart';

@freezed
class ServiceRawData with _$ServiceRawData {
  @FreezedUnionValue('1')
  factory ServiceRawData.service({
    required String name,
    required String imgUrl,
    required String feeRange,
    required int cate,
  }) = _service;

  @FreezedUnionValue('2')
  factory ServiceRawData.product({
    required String name,
    required String imgUrl,
    required int fee,
    required String sName,
    required int cate,
  }) = _product;
}
