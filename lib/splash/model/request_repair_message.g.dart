// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_repair_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestRepairMessage _$$_RequestRepairMessageFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_RequestRepairMessage',
      json,
      ($checkedConvert) {
        final val = _$_RequestRepairMessage(
          recordId: $checkedConvert('record_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'recordId': 'record_id'},
    );

Map<String, dynamic> _$$_RequestRepairMessageToJson(
        _$_RequestRepairMessage instance) =>
    <String, dynamic>{
      'record_id': instance.recordId,
    };
