import 'package:flutter/material.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revup_core/core.dart';

import '../../map/models/directions_model.dart';
import '../../map/utils/map_utils.dart';

class RequestMapStatic extends StatefulWidget {
  const RequestMapStatic({
    super.key,
    required this.consumer,
    required this.directions,
    required this.fromMaker,
    required this.toMarker,
  });
  final AppUser consumer;
  final Directions directions;
  final Marker fromMaker;
  final Marker toMarker;

  @override
  State<RequestMapStatic> createState() => _RequestMapStaticState();
}

class _RequestMapStaticState extends State<RequestMapStatic> {
  late CameraPosition _initialLocation;
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  late LatLng _startCoordinate;

  PolylinePoints? polylinePoints;
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    _startCoordinate = LatLng(
      widget.fromMaker.position.latitude,
      widget.fromMaker.position.longitude,
    );
    _initialLocation = CameraPosition(target: _startCoordinate, zoom: 15);
    markers
      ..add(widget.fromMaker)
      ..add(widget.toMarker);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: const EdgeInsets.only(bottom: 320),
      initialCameraPosition: _initialLocation,
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
        fitPolylineToView(widget.directions.polylinePoints, controller);
      },
      markers: Set<Marker>.from(markers),
      polylines: {
        Polyline(
          polylineId: const PolylineId('polyline'),
          color: Theme.of(context).colorScheme.primary,
          width: 5,
          points: widget.directions.polylinePoints
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList(),
        ),
      },
    );
  }
}
