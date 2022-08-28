import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'select_option_complete_model.freezed.dart';

@freezed
class SelectOptionCompleteModel with _$SelectOptionCompleteModel {
  const factory SelectOptionCompleteModel({
    required List<PendingServiceModel> unpaidServices,
  }) = _SelectOptionCompleteModel;
}
