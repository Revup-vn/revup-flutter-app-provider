part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.started() = _Started;
  const factory LocationEvent.locationUpdated({required LatLng location}) =
      _PositionUpdated;
  const factory LocationEvent.placeSearch({required String placeId}) =
      _PlaceSearch;
  const factory LocationEvent.savedRepairLoc({required LatLng location}) =
      _LocationSaved;
  const factory LocationEvent.mapLoaded({
    required Directions directions,
  }) = _MapLoaded;
}
