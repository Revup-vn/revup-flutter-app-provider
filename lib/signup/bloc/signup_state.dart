part of 'signup_bloc.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.choosePhotoSuccess({required List<File> file}) =
      _ChoosePhotoSuccess;
}
