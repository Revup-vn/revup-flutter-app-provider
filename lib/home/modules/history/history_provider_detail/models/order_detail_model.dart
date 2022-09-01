import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_model.freezed.dart';

@freezed
class OrderDetailModel with _$OrderDetailModel {
  const factory OrderDetailModel({
    required int vehicleType,
    required List<String> serviceName,
    required String address,
    required int totalServiceFee,
    required int feeTransport,
  }) = _OrderDetailModel;
}
