import 'dart:math' hide log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revup_core/core.dart';

import '../../map/map_api/map_api.dart';
import '../../map/models/directions_model.dart';

class RequestMapLive extends StatefulWidget {
  const RequestMapLive({
    super.key,
    required this.directions,
    required this.fromMaker,
    required this.toMarker,
    required this.userStore,
    required this.user,
  });
  final Directions directions;
  final Marker fromMaker;
  final Marker toMarker;
  final IStore<AppUser> userStore;
  final AppUser user;
  @override
  State<RequestMapLive> createState() => _RequestMapLiveState();
}

class _RequestMapLiveState extends State<RequestMapLive> {
  late CameraPosition _initialLocation;
  late GoogleMapController mapController;
  // ignore: unused_field
  late String _distance;
  Set<Marker> markers = {};
  late LatLng _startCoordinate;
  Map<PolylineId, Polyline> initialPolylines = {};

  PolylinePoints? polylinePoints;
  List<LatLng> polylineCoordinates = [];
  double _coordinateDistance(
    double lat1,
    double lng1,
    double lat2,
    double lng2,
  ) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lng2 - lng1) * p)) / 2;

    return 12742 * asin(sqrt(a));
  }

  Future<Tuple2<Map<PolylineId, Polyline>, List<LatLng>>> _createPolylines(
    double fromLat,
    double fromLng,
    double toLat,
    double toLng,
  ) async {
    polylinePoints = PolylinePoints();
    final directions =
        await getDirections(LatLng(fromLat, fromLng), LatLng(toLat, toLng));
    final polylineCoordinates = <LatLng>[];
    for (final point in directions.polylinePoints) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }
    const id = PolylineId('polyline');
    final polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    return Tuple2({id: polyline}, polylineCoordinates);
  }

  Future<Map<PolylineId, Polyline>> _calculateDurationAndDistance({
    required double fromLat,
    required double fromLng,
    required double toLat,
    required double toLng,
  }) async {
    if (markers.isNotEmpty) markers.clear();
    final fromCoorString = '($fromLat, $fromLng)';
    final toCoorString = '($toLat, $toLng)';
    // Start Location Marker
    final fromMarker = Marker(
      markerId: MarkerId(fromCoorString),
      position: LatLng(fromLat, fromLng),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    );

    final toMarker = Marker(
      markerId: MarkerId(toCoorString),
      position: LatLng(toLat, toLng),
    );
    markers
      ..add(fromMarker)
      ..add(toMarker);

    final minLat = (fromLat <= toLat) ? fromLat : toLat;
    final minLng = (fromLng <= toLng) ? fromLng : toLng;
    final maxLat = (fromLat <= toLat) ? toLat : fromLat;
    final maxLng = (fromLng <= toLng) ? toLng : fromLng;

    final southWestLatitude = minLat;
    final southWestLongitude = minLng;

    final northEastLatitude = maxLat;
    final northEastLongitude = maxLng;

    await mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(northEastLatitude, northEastLongitude),
          southwest: LatLng(southWestLatitude, southWestLongitude),
        ),
        70,
      ),
    );

    final result = await _createPolylines(
      fromLat,
      fromLng,
      toLat,
      toLng,
    );

    final polylines = result.value1;
    final polylineCoordinates = result.value2;

    var totalDistance = 0.0;

    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    _distance = totalDistance.toStringAsFixed(1);

    return polylines;
  }

  Future<void> initPolylines() async {
    final fromLat = widget.fromMaker.position.latitude;
    final fromLng = widget.fromMaker.position.longitude;

    final toLat = widget.toMarker.position.latitude;
    final toLng = widget.toMarker.position.longitude;
    initialPolylines = await _calculateDurationAndDistance(
      fromLat: fromLat,
      fromLng: fromLng,
      toLat: toLat,
      toLng: toLng,
    );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    setState(() {});
    // });
  }

  @override
  void initState() {
    _startCoordinate = LatLng(
      widget.fromMaker.position.latitude,
      widget.fromMaker.position.longitude,
    );
    _initialLocation = CameraPosition(target: _startCoordinate, zoom: 15);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: widget.userStore.collection().doc(widget.user.uuid).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return GoogleMap(
            padding: const EdgeInsets.only(bottom: 200),
            initialCameraPosition: _initialLocation,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                initPolylines();
              });
            },
            myLocationEnabled: true,
            markers: Set<Marker>.from(markers),
            polylines: {
              Polyline(
                polylineId: const PolylineId('polyline'),
                color: Colors.red,
                width: 5,
                points: widget.directions.polylinePoints
                    .map((e) => LatLng(e.latitude, e.longitude))
                    .toList(),
              ),
            },
          );
        }
        final maybeProviderData = snapshot.data!.data()!;
        final providerLoc = (maybeProviderData['cur_location']
            as Map<String, dynamic>)['geopoint'] as GeoPoint;
        return FutureBuilder<Map<PolylineId, Polyline>>(
          future: _calculateDurationAndDistance(
            fromLat: providerLoc.latitude,
            fromLng: providerLoc.longitude,
            toLat: widget.toMarker.position.latitude,
            toLng: widget.toMarker.position.longitude,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return GoogleMap(
                padding: const EdgeInsets.only(bottom: 100),
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    providerLoc.latitude,
                    providerLoc.longitude,
                  ),
                ),
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    initPolylines();
                  });
                },
                zoomControlsEnabled: false,
                markers: Set<Marker>.from(markers),
                polylines: {
                  Polyline(
                    polylineId: const PolylineId('polyline'),
                    color: Colors.red,
                    width: 5,
                    points: widget.directions.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
                },
              );
            }

            return GoogleMap(
              padding: const EdgeInsets.only(bottom: 100),
              markers: Set<Marker>.from(markers),
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  providerLoc.latitude,
                  providerLoc.longitude,
                ),
              ),
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              polylines: Set<Polyline>.of(snapshot.data!.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            );
          },
        );
      },
    );
  }
}
