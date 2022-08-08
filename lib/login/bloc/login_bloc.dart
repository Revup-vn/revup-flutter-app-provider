import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial(isLoginButtonEnabled: false)) {
    on<Start>((event, emit) {
      emit(
        LoginState.ready(isLoginButtonEnabled: event.isLoginButtonEnabled),
      );
    });

    on<Submit>((event, emit) {
      emit(
        LoginState.success(phoneNumber: event.phoneNumber),
      );
    }); // TODO(cantgim): implement submit event
  }
}
