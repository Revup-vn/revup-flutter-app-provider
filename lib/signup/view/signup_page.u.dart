import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revup_core/core.dart';

import '../bloc/signup_bloc.dart';
import '../cubit/signup_cubit.dart';
import 'signup_view.u.dart';

class SignupPage extends StatelessWidget {
  const SignupPage(
    this.completer,
    this.phoneNumber,
    this.photoURL,
    this.uid,
    this.email, {
    super.key,
  });
  final Completer<AppUser> completer;
  final String phoneNumber;
  final String photoURL;
  final String uid;
  final String email;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(ImagePicker()),
        ),
        BlocProvider(
          create: (context) => SignupCubit(context.read()),
        ),
      ],
      child: SignupView(completer, phoneNumber, photoURL, uid, email),
    );
  }
}
