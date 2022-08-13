import 'package:freezed_annotation/freezed_annotation.dart';

import 'geometry_model.dart';

part 'place_details_model.freezed.dart';
part 'place_details_model.g.dart';

@freezed
class PlaceDetails with _$PlaceDetails {
  const factory PlaceDetails({
    @JsonKey(name: 'place_id') required String placeId,
    @JsonKey(name: 'formatted_address') required String name,
    required Geometry geometry,
  }) = _PlaceDetails;

  factory PlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsFromJson(json);
}
