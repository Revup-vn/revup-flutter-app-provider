part of 'login_enter_phone_bloc.u.dart';

@freezed
class LoginEnterPhoneEvent with _$LoginEnterPhoneEvent {
  const factory LoginEnterPhoneEvent.start({
    required bool isLoginButtonEnabled,
  }) = Start;
  const factory LoginEnterPhoneEvent.submit({required String phoneNumber}) =
      Submit;
}
