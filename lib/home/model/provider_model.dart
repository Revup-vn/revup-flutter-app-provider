import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_model.freezed.dart';

@freezed
class ProviderModel with _$ProviderModel {
  const factory ProviderModel({
    required double rating,
  }) = _ProviderModel;
}
