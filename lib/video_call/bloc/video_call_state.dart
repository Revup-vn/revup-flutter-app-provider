part of 'video_call_bloc.dart';

@freezed
class VideoCallState with _$VideoCallState {
  const factory VideoCallState.initial() = _Initial;
  const factory VideoCallState.calling() = _Calling;
  const factory VideoCallState.callEnded() = _CallEnded;
}
