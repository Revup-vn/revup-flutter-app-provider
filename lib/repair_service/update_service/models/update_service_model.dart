import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_service_model.freezed.dart';

@freezed
class UpdateServiceModel with _$UpdateServiceModel {
  const factory UpdateServiceModel({
    required String img,
    required String serviceName,
    required int serviceFee,
    required String cate,
  }) = _UpdateServiceModel;
}
