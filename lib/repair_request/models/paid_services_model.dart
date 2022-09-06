import 'package:freezed_annotation/freezed_annotation.dart';

import '../request.dart';

part 'paid_services_model.freezed.dart';

@freezed
class PaidServicesModel with _$PaidServicesModel {
  const factory PaidServicesModel({
    required String name,
    required int price,
  }) = _PaidServicesModel;

  factory PaidServicesModel.fromDto({
    required PendingServiceModel pendingService,
  }) =>
      PaidServicesModel(name: pendingService.name, price: pendingService.price);
}
