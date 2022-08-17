// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_autocomplete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaceAutocomplete _$$_PlaceAutocompleteFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_PlaceAutocomplete',
      json,
      ($checkedConvert) {
        final val = _$_PlaceAutocomplete(
          description: $checkedConvert('description', (v) => v as String),
          placeId: $checkedConvert('place_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'placeId': 'place_id'},
    );

Map<String, dynamic> _$$_PlaceAutocompleteToJson(
        _$_PlaceAutocomplete instance) =>
    <String, dynamic>{
      'description': instance.description,
      'place_id': instance.placeId,
    };
