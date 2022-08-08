import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login_bloc.dart';
import 'login_enter_phone_number_view.u.dart';

class LoginEnterPhonePage extends StatelessWidget {
  const LoginEnterPhonePage(
    this.completer,
    this.phoneNumber,
    this.photoURL,
    this.uid,
    this.email, {
    super.key,
  });
  final Completer completer;
  final String phoneNumber;
  final String photoURL;
  final String uid;
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: LoginEnterPhoneView(completer, phoneNumber, photoURL, uid, email),
    );
  }
}
