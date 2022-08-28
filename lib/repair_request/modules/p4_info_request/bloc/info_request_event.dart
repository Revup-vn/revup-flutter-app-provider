part of 'info_request_bloc.dart';

@freezed
class InfoRequestEvent with _$InfoRequestEvent {
  const factory InfoRequestEvent.started() = _Started;
  const factory InfoRequestEvent.locationUpdated({required LatLng pos}) =
      _LocationUpdated;
  const factory InfoRequestEvent.confirmStarted({
    required Function0<void> onRoute,
    required Function2<String, String, void> sendMessage,
  }) = _ConfirmStarted;
  const factory InfoRequestEvent.confirmDeparted({
    required Function0<void> onRoute,
    required Function1<String, void> sendMessage,
  }) = _ConfirmDeparted;
  const factory InfoRequestEvent.confirmArrived() = _ConfirmArrived;
}
