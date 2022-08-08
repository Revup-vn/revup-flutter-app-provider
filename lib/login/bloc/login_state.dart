part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({required bool isLoginButtonEnabled}) =
      _Initial;
  const factory LoginState.ready({required bool isLoginButtonEnabled}) = _Ready;
  const factory LoginState.loading() = _Loading;

  const factory LoginState.failure({required String errorMessage}) = _Failure;

  const factory LoginState.success({required String phoneNumber}) = _Success;
}
