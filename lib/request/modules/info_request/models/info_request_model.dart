import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/user_model.dart';

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
