import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_service_model.freezed.dart';

@freezed
class PendingServiceModel with _$PendingServiceModel {
  const factory PendingServiceModel({
    required String name,
    required int price,
  }) = _PendingServiceModel;
}
