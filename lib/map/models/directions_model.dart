import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'directions_model.freezed.dart';

@freezed
class Directions with _$Directions {
  const factory Directions({
    required LatLngBounds bounds,
    required List<PointLatLng> polylinePoints,
    required int distance,
    required int duration,
  }) = _Directions;

  // factory Directions.getPolylinePointS(Map<String, dynamic> map) =>

  factory Directions.fromMap(Map<String, dynamic> map) {
    final data = Map<String, dynamic>.from(
      (map['routes'] as List)[0] as Map<String, dynamic>,
    );

    // Bounds
    final northeast = (data['bounds'] as Map<String, dynamic>)['northeast']
        as Map<String, dynamic>;
    final southwest = (data['bounds'] as Map<String, dynamic>)['southwest']
        as Map<String, dynamic>;
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'] as double, northeast['lng'] as double),
      southwest: LatLng(southwest['lat'] as double, southwest['lat'] as double),
    );

    // Distance & Duration
    int? distance;
    int? duration;

    if ((data['legs'] as List).isNotEmpty) {
      final leg = (data['legs'] as List)[0] as Map<String, dynamic>;
      distance = (leg['distance'] as Map<String, dynamic>)['value'] as int;
      duration = (leg['duration'] as Map<String, dynamic>)['value'] as int;
    }

    return Directions(
      bounds: bounds,
      polylinePoints: PolylinePoints().decodePolyline(
        (data['overview_polyline'] as Map<String, dynamic>)['points'] as String,
      ),
      distance: distance ?? 0,
      duration: duration ?? 0,
    );
  }
}
