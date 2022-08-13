// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaceDetails _$$_PlaceDetailsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_PlaceDetails',
      json,
      ($checkedConvert) {
        final val = _$_PlaceDetails(
          placeId: $checkedConvert('place_id', (v) => v as String),
          name: $checkedConvert('formatted_address', (v) => v as String),
          geometry: $checkedConvert(
              'geometry', (v) => Geometry.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'placeId': 'place_id', 'name': 'formatted_address'},
    );

Map<String, dynamic> _$$_PlaceDetailsToJson(_$_PlaceDetails instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'formatted_address': instance.name,
      'geometry': instance.geometry.toJson(),
    };
