import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_autocomplete_model.freezed.dart';
part 'place_autocomplete_model.g.dart';

@freezed
class PlaceAutocomplete with _$PlaceAutocomplete {
  const factory PlaceAutocomplete({
    required String description,
    @JsonKey(name: 'place_id') required String placeId,
  }) = _PlaceAutocomplete;
  factory PlaceAutocomplete.fromJson(Map<String, dynamic> json) =>
      _$PlaceAutocompleteFromJson(json);
}
