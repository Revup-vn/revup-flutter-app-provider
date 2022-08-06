import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/models.dart';

part 'repair_record_model.freezed.dart';

@freezed
class RepairRecordModel with _$RepairRecordModel {
  const factory RepairRecordModel({
    required List<RequestServiceModel> requestServiceModel,
    required List<BonusServicesModel> bonusServicesModel,
    required int feeTransport,
    required int temporary,
  }) = _RepairRecordModel;
}
