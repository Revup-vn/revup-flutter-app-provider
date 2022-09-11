part of 'map_route_bloc.dart';

@freezed
class MapRouteState with _$MapRouteState {
  const factory MapRouteState.initial() = _Initial;
  const factory MapRouteState.loading() = _Loading;
  const factory MapRouteState.failure() = _Failure;
  const factory MapRouteState.success({
    required Directions directions,
    required Marker fromMarker,
    required Marker toMarker,
    required String recordId,
  }) = _Success;
}
