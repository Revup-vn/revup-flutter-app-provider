import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revup_core/core.dart';

import '../../map/map_api/map_api.dart';
import '../../map/models/directions_model.dart';

part 'map_route_bloc.freezed.dart';
part 'map_route_event.dart';
part 'map_route_state.dart';

class MapRouteBloc extends Bloc<MapRouteEvent, MapRouteState> {
  MapRouteBloc(
    this._userStore,
    this._repairRecord,
    this.storeRepository,
    this.recordId,
    this.consumerId,
  ) : super(_Initial()) {
    on<MapRouteEvent>(_onEvent);
  }
  final IStore<AppUser> _userStore;
  final IStore<RepairRecord> _repairRecord;
  final StoreRepository storeRepository;
  final String recordId;
  final String consumerId;
  FutureOr<void> _onEvent(
    MapRouteEvent event,
    Emitter<MapRouteState> emit,
  ) async {
    await event.when(
      started: () async {
        final repairRecord = (await _repairRecord.get(recordId))
            .map<Option<RepairRecord>>(
              (r) => r.maybeMap(
                accepted: some,
                orElse: none,
              ),
            )
            .fold<Option<RepairRecord>>(
              (l) => none(),
              (r) => r,
            )
            .getOrElse(() => throw NullThrownError());

        final fromLoc = LatLng(repairRecord.from.lat, repairRecord.from.long);
        final toLoc = LatLng(repairRecord.to.lat, repairRecord.to.long);
        final directions = await getDirections(fromLoc, toLoc);
        final toMarker =
            Marker(markerId: const MarkerId('_to'), position: toLoc);
        final fromMarker = Marker(
          markerId: const MarkerId('_from'),
          position: fromLoc,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        );
        emit(
          MapRouteState.success(
            directions: directions,
            fromMarker: fromMarker,
            toMarker: toMarker,
            recordId: recordId,
          ),
        );
      },
      providerStarted: (onRoute, sendMessage) async {
        // get latest consumer fcm token
        final consumer = (await _userStore.get(consumerId))
            .fold<Option<AppUser>>(
              (l) => none(),
              some,
            )
            .getOrElse(() => throw NullThrownError());
        final tokens =
            (await storeRepository.userNotificationTokenRepo(consumer).all())
                .map(
                  (r) => r.sort(
                    orderBy(StringOrder.reverse(), (a) => a.created.toString()),
                  ),
                )
                .fold((l) => throw NullThrownError(), (r) => r.toList());
        sendMessage(tokens.first.token);
        onRoute();
      },
    );
  }
}
