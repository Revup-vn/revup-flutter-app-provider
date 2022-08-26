part of 'map_route_bloc.dart';

@freezed
class MapRouteEvent with _$MapRouteEvent {
  const factory MapRouteEvent.started() = _Started;
  const factory MapRouteEvent.providerStarted({
    required Function0<void> onRoute,
    required Function1<String, void> sendMessage,
  }) = _ProviderStarted;
}
