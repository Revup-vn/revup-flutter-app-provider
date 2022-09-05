part of 'start_repair_bloc.dart';

@freezed
class StartRepairEvent with _$StartRepairEvent {
  const factory StartRepairEvent.started() = _Started;
  const factory StartRepairEvent.locationUpdated({required LatLng pos}) =
      _LocationUpdated;
  const factory StartRepairEvent.confirmStarted({
    required Function0<void> onRoute,
    required Function2<String, String, void> sendMessage,
  }) = _ConfirmStarted;
  const factory StartRepairEvent.confirmDeparted({
    required Function0<void> onRoute,
    required Function1<String, void> sendMessage,
  }) = _ConfirmDeparted;
  const factory StartRepairEvent.confirmArrived() = _ConfirmArrived;
}
