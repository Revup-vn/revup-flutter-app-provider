part of 'video_call_bloc.dart';

@freezed
class VideoCallEvent with _$VideoCallEvent {
  const factory VideoCallEvent.started() = _Started;
  const factory VideoCallEvent.callStarted() = _CallStarted;
}
