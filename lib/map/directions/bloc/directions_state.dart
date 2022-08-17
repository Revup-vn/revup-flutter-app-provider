part of 'directions_bloc.dart';

@freezed
class DirectionsState with _$DirectionsState {
  const factory DirectionsState.initial() = _Initial;
  const factory DirectionsState.directionsLoaded({
    required Directions directions,
  }) = _DirectionsLoaded;
}
