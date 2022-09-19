import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../router/router.dart';
import '../../shared/widgets/loading.u.dart';
import '../bloc/bloc/sign_up_bloc.dart';
import '../widgets/signup_content.u.dart';

class SignupView extends StatelessWidget {
  const SignupView(
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
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) => state.maybeMap(
        orElse: () => false,
        success: (value) => context.router
            .popUntil((route) => route.settings.name == LoginRoute.name),
      ),
      builder: (context, state) => state.when(
        initial: () => SignUpContent(
          completer: completer,
          phoneNumber: phoneNumber,
          photoURL: photoURL,
          uid: uid,
          email: email,
        ),
        loading: () => const Loading(),
        success: Container.new,
      ),
    );
  }
}
