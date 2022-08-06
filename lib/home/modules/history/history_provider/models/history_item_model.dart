import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/shared.dart';
import 'models.dart';

part 'history_item_model.freezed.dart';

@freezed
class HistoryItemModel with _$HistoryItemModel {
  const factory HistoryItemModel({
    required String orderNumber,
    required String vehicleType,
    required String serviceName,
    required DateTime serviceStartBooking,
    required String orderStatusNotification,
    required UserModel user,
  }) = _HistoryItemModel;

  factory HistoryItemModel.fromProviderModel(HistoryProviderModel model) =>
      HistoryItemModel(
        orderNumber: model.orderNumber,
        vehicleType: model.vehicleType,
        serviceName: model.serviceName,
        serviceStartBooking: model.serviceStartBooking,
        orderStatusNotification: model.orderStatusNotification,
        user: model.user,
      );
}
