import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void fitPolylineToView(
  List<PointLatLng> p,
  GoogleMapController controller,
) {
  var minLat = p.first.latitude;
  var minLng = p.first.longitude;
  var maxLat = p.first.latitude;
  var maxLng = p.first.longitude;
  for (final e in p) {
    if (e.latitude < minLat) minLat = e.latitude;
    if (e.latitude > maxLat) maxLat = e.latitude;
    if (e.longitude < minLng) minLng = e.longitude;
    if (e.longitude > maxLng) maxLng = e.longitude;
  }
  controller.animateCamera(
    CameraUpdate.newLatLngBounds(
      LatLngBounds(
        southwest: LatLng(minLat, minLng),
        northeast: LatLng(maxLat, maxLng),
      ),
      100,
    ),
  );
}
