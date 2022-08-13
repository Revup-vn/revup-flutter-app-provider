part of 'directions_bloc.dart';

@freezed
class DirectionsEvent with _$DirectionsEvent {
  const factory DirectionsEvent.started() = _Started;
  const factory DirectionsEvent.directions({
    required LatLng origin,
    required LatLng destination,
  }) = _Directions;
}
