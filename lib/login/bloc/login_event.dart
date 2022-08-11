part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.start({required bool isLoginButtonEnabled}) = Start;
  const factory LoginEvent.submit({required String phoneNumber}) = Submit;
}
