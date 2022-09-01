import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/shared.dart';

part 'history_provider_model.freezed.dart';

@freezed
class HistoryProviderModel with _$HistoryProviderModel {
  const factory HistoryProviderModel({
    required String recordId,
    required bool isComplete,
    required String vehicleType,
    required String serviceName, // Senior huy cuu kohai tuan
    required DateTime serviceStartBooking,
    required String orderStatusNotification, // Senior huy cuu kohai tuan
    required String cName,
    required String cAvatar,
  }) = _HistoryProviderModel;
}
