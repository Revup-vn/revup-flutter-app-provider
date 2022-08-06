import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/shared.dart';

part 'history_provider_model.freezed.dart';

@freezed
class HistoryProviderModel with _$HistoryProviderModel {
  const factory HistoryProviderModel({
    required bool isComplete,
    required String orderNumber,
    required String vehicleType,
    required String serviceName,
    required DateTime serviceStartBooking,
    required String orderStatusNotification,
    required UserModel user,
  }) = _HistoryProviderModel;
}
