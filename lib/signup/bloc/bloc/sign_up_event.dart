part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.started() = _Started;
  const factory SignUpEvent.submited({
    required AppUser aUser,
    required List<File> imgFiles,
    required Completer<AppUser> completer,
  }) = _Submited;
}
