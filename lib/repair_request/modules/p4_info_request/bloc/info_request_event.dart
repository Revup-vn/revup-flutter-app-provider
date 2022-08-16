part of 'info_request_bloc.dart';

@freezed
class InfoRequestEvent with _$InfoRequestEvent {
  const factory InfoRequestEvent.started() = _Started;
  const factory InfoRequestEvent.confirmStarted() = _ConfirmStarted;
  const factory InfoRequestEvent.confirmArrived() = _ConfirmArrived;
}
