import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_model.freezed.dart';

@freezed
class OrderDetailModel with _$OrderDetailModel {
  const factory OrderDetailModel({
    required String vehicleType,
    required String serviceName,
    required String address,
    required String nameVehicleType,
    required int totalServiceFee,
    required int feeTransport,
    required int intoMoney,
  }) = _OrderDetailModel;
}
