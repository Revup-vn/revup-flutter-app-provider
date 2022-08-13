import 'package:freezed_annotation/freezed_annotation.dart';

import 'location_model.dart';

part 'geometry_model.freezed.dart';
part 'geometry_model.g.dart';

@freezed
class Geometry with _$Geometry {
  const factory Geometry({
    required LocationModel location,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}
