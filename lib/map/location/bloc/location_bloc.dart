import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../map_api/map_api.dart';
import '../../models/directions_model.dart';
import '../../models/place_details_model.dart';

part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState.loading()) {
    on<LocationEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    LocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    await event.when(
      started: () async {
        final boxLocation = Hive.box<dynamic>('location');
        final currentLat =
            boxLocation.get('currentLat', defaultValue: 0.0) as double;
        final currentLng =
            boxLocation.get('currentLng', defaultValue: 0.0) as double;
        final location = LatLng(currentLat, currentLng);
        emit(LocationState.initial(location: location));
      },
      locationUpdated: (location) async {
        final address =
            await getAddress(LatLng(location.latitude, location.longitude));
        emit(LocationState.addressLoaded(address: address));
      },
      placeSearch: (String placeId) async {
        final placeDetails = await getPlaceDetails(placeId);
        emit(LocationState.placeDetailsLoaded(placeDetails: placeDetails));
        final address = await getAddress(
          LatLng(
            placeDetails.geometry.location.lat,
            placeDetails.geometry.location.lng,
          ),
        );
        emit(LocationState.addressLoaded(address: address));
      },
      savedRepairLoc: (LatLng location) async {
        final boxLocation = Hive.box<dynamic>('location');
        await boxLocation.put('repairLat', location.latitude);
        await boxLocation.put('repairLng', location.longitude);
        final boxRprRecord = await Hive.openBox<dynamic>('repairRecord');
        await boxRprRecord.put('toLat', location.latitude);
        await boxRprRecord.put('toLng', location.longitude);
      },
      mapLoaded: (Directions directions) {
        emit(LocationState.directionsLoaded(directions: directions));
      },
    );
  }
}
