// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Geometry _$$_GeometryFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Geometry',
      json,
      ($checkedConvert) {
        final val = _$_Geometry(
          location: $checkedConvert('location',
              (v) => LocationModel.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_GeometryToJson(_$_Geometry instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
    };
