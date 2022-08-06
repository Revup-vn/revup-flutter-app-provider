import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/shared.dart';
import 'order_detail_model.dart';

part 'history_detail_model.freezed.dart';

@freezed
class HistoryDetailModel with _$HistoryDetailModel {
  const factory HistoryDetailModel({
    required bool isComplete,
    required String orderNumber,
    required DateTime serviceStartBooking,
    required DateTime serviceEndBooking,
    required OrderDetailModel orderDetailModel,
    required PaymentMethod paymentMethod,
    required int rating,
    required String feedback,
    required UserModel consumer,
  }) = _HistoryDetailModel;
}

enum PaymentMethod {
  Zalo,
  Momo,
}
