import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_completed_model.freezed.dart';

@freezed
class RepairCompletedModel with _$RepairCompletedModel {
  const factory RepairCompletedModel({
    required int collectMoneyCustomers,
    required String vehicleType,
    required int totalService,
  }) = _RepairCompletedModel;
}
