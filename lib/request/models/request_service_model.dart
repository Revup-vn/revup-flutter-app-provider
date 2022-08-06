import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_service_model.freezed.dart';

@freezed
class RequestServiceModel with _$RequestServiceModel {
  const factory RequestServiceModel({
    required String name,
    required int price,
  }) = _RequestServiceModel;
}
