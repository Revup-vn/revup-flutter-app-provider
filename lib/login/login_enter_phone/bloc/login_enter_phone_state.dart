part of 'login_enter_phone_bloc.u.dart';

@freezed
class LoginEnterPhoneState with _$LoginEnterPhoneState {
  const factory LoginEnterPhoneState.initial({
    required bool isLoginButtonEnabled,
  }) = _Initial;
  const factory LoginEnterPhoneState.ready({
    required bool isLoginButtonEnabled,
  }) = _Ready;
  const factory LoginEnterPhoneState.loading() = _Loading;

  const factory LoginEnterPhoneState.failure({required String errorMessage}) =
      _Failure;

  const factory LoginEnterPhoneState.success({required String phoneNumber}) =
      _Success;
}
