part of 'info_request_bloc.dart';

@freezed
class InfoRequestEvent with _$InfoRequestEvent {
  const factory InfoRequestEvent.started() = _Started;
}
