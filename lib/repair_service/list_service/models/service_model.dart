import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';

@freezed
class ServiceModel with _$ServiceModel {
  factory ServiceModel({
    required String providerID,
    required String serviceName,
    required int sortType,
    required String price,
    required String imageUrl,
  }) = _ServiceModel;
}
