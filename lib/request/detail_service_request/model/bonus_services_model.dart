import 'package:freezed_annotation/freezed_annotation.dart';

part 'bonus_services_model.freezed.dart';

@freezed
class BonusServicesModel with _$BonusServicesModel {
  const factory BonusServicesModel({
    required String name,
    required int price,
  }) = _BonusServicesModel;
}
