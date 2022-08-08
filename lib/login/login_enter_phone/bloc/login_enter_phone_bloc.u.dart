import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_enter_phone_event.dart';
part 'login_enter_phone_state.dart';
part 'login_enter_phone_bloc.u.freezed.dart';

class LoginEnterPhoneBloc
    extends Bloc<LoginEnterPhoneEvent, LoginEnterPhoneState> {
  LoginEnterPhoneBloc() : super(const _Initial(isLoginButtonEnabled: false)) {
    on<Start>((event, emit) {
      emit(
        LoginEnterPhoneState.ready(
          isLoginButtonEnabled: event.isLoginButtonEnabled,
        ),
      );
    });

    on<Submit>((event, emit) {
      emit(
        LoginEnterPhoneState.success(phoneNumber: event.phoneNumber),
      );
    }); // TODO(cantgim): implement submit event
  }
}
