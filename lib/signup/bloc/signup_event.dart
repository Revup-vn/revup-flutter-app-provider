part of 'signup_bloc.u.dart';

@freezed
class SignupEvent with _$SignupEvent {
  const factory SignupEvent.started() = _Started;
  const factory SignupEvent.imageUploadSelected({
    required ImageSource source,
    required List<File> currentListStorage,
    required int typeUpload,
  }) = _ImageUploadSelected;
}
