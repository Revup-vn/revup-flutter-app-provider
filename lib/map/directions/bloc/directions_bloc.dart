import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../map_api/map_api.dart';
import '../../models/directions_model.dart';

part 'directions_bloc.freezed.dart';
part 'directions_event.dart';
part 'directions_state.dart';

class DirectionsBloc extends Bloc<DirectionsEvent, DirectionsState> {
  DirectionsBloc() : super(const _Initial()) {
    on<DirectionsEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    DirectionsEvent event,
    Emitter<DirectionsState> emit,
  ) async {
    await event.when(
      started: () {
        // TODO(cantgim): implement sthg
      },
      directions: (LatLng origin, LatLng destination) async {
        final directions = await getDirections(origin, destination);
        emit(DirectionsState.directionsLoaded(directions: directions));
      },
    );
  }
}
