import 'package:flutter/cupertino.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_service_model.freezed.dart';

@freezed
class AddServiceModel with _$AddServiceModel {
  const factory AddServiceModel({
    required Image img,
    required String serviceName,
    required int serviceFee,
    required String priceUnit,
    required String shortDescription,
  }) = _AddServiceModel;
}
