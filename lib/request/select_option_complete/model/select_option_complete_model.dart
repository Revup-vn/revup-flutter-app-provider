import 'package:freezed_annotation/freezed_annotation.dart';

import 'bonus_services_model.dart';
import 'request_service_model.dart';

part 'select_option_complete_model.freezed.dart';

@freezed
class SelectOptionCompleteModel with _$SelectOptionCompleteModel {
  const factory SelectOptionCompleteModel({
    required List<RequestServiceModel> requestServiceModel,
    required List<BonusServicesModel> bonusServicesModel,
  }) = _SelectOptionCompleteModel;
}
