import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../shared/utils/fallbacks.dart';
import 'pending_service_model.dart';

part 'service_data.freezed.dart';

@freezed
class ServiceData with _$ServiceData {
  factory ServiceData({
    required String name,
    required int serviceFee,
    required String imageURL,
    required List<PaymentProduct> products,
    required bool isOptional,
  }) = _ServiceData;

  factory ServiceData.fromDtos(RepairService service) => ServiceData(
        imageURL: service.img ?? kFallbackImage,
        name: service.name,
        serviceFee: service.fee,
        isOptional: false,
        products: [],
      );

  factory ServiceData.fromPendingService(PendingServiceModel service) =>
      ServiceData(
        imageURL: service.imageUrl ?? kFallbackServiceImg,
        name: service.name,
        serviceFee: service.price,
        isOptional: service.isOptional,
        products: service.products,
      );
}
