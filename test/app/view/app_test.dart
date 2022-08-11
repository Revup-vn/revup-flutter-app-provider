import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:revup_provider/login/bloc/login_bloc.dart';

void main() {
  group('LoginBloc', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = LoginBloc();
    });
    blocTest<LoginBloc, LoginState>(
      'emit Login Ready state when Login Start event is added',
      build: () => loginBloc,
      act: (bloc) =>
          bloc.add(const LoginEvent.start(isLoginButtonEnabled: false)),
      expect: () =>
          <LoginState>[const LoginState.ready(isLoginButtonEnabled: false)],
    );
    blocTest<LoginBloc, LoginState>(
      'emit sucess state when Submit event is added',
      build: () => loginBloc,
      act: (bloc) =>
          bloc.add(const LoginEvent.submit(phoneNumber: '123456789')),
      expect: () =>
          <LoginState>[const LoginState.success(phoneNumber: '123456789')],
    );
  });
}
