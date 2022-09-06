import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'pending_service_model.freezed.dart';
part 'pending_service_model.g.dart';

@freezed
class PendingServiceModel with _$PendingServiceModel {
  const factory PendingServiceModel({
    required String name,
    String? imageUrl,
    required int price,
    required bool isOptional,
    required List<PaymentProduct> products,
    String? status,
  }) = _PendingServiceModel;

  factory PendingServiceModel.fromDto({
    required PaymentService paymentService,
  }) =>
      paymentService.map(
        pending: (v) => PendingServiceModel(
          name: v.serviceName,
          price: v.moneyAmount,
          isOptional: v.isOptional,
          products: v.products,
          status: 'pending',
        ),
        needToVerify: (v) => PendingServiceModel(
          name: v.serviceName,
          price: -1,
          isOptional: true,
          products: [],
          status: 'waiting',
        ),
        paid: (v) => PendingServiceModel(
          name: v.serviceName,
          price: v.moneyAmount,
          isOptional: false,
          products: v.products,
          status: 'paid',
        ),
      );
  factory PendingServiceModel.fromJson(Map<String, dynamic> json) =>
      _$PendingServiceModelFromJson(json);
}
