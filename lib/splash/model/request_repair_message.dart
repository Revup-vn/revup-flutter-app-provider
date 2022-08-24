import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_repair_message.freezed.dart';
part 'request_repair_message.g.dart';

@freezed
class RequestRepairMessage with _$RequestRepairMessage {
  const factory RequestRepairMessage({
    required String recordId,
  }) = _RequestRepairMessage;
  factory RequestRepairMessage.fromJson(Map<String, dynamic> json) =>
      _$RequestRepairMessageFromJson(json);
}
