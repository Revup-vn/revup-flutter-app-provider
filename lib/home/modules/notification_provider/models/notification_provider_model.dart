import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_provider_model.freezed.dart';

@freezed
class NotificationProviderModel with _$NotificationProviderModel {
  const factory NotificationProviderModel({
    required String orderStatusNotification,
    required String orderNumber,
    required DateTime serviceStartBooking,
  }) = _NotificationProviderModel;
}
