import 'package:freezed_annotation/freezed_annotation.dart';

part 'need_to_verify_model.freezed.dart';

@freezed
class NeedToVerifyModel with _$NeedToVerifyModel {
  const factory NeedToVerifyModel({
    required String serviceName,
    required String desc,
    int? quotePrice,
  }) = _NeedToVerifyModel;
}
