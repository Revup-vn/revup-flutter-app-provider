import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/models.dart';

part 'repair_record_model.freezed.dart';

@freezed
class RepairRecordModel with _$RepairRecordModel {
  const factory RepairRecordModel({
    required List<PendingServiceModel> requestServiceModel,
    required List<PaidServicesModel> bonusServicesModel,
    required int feeTransport,
  }) = _RepairRecordModel;
}
