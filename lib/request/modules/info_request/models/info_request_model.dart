import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/shared.dart' show UserModel;

part 'info_request_model.freezed.dart';

@freezed
class InfoRequestModel with _$InfoRequestModel {
  const factory InfoRequestModel({
    required UserModel user,
    required double distance,
    required int feeTransport,
    required String vehicleType,
    required String message,
    required int totalService,
  }) = _InfoRequestModel;
}
