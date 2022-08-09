import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../bloc/signup_bloc.dart';
import '../widgets/signup_content.u.dart';

class SignupView extends StatelessWidget {
  SignupView(
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
  final List<File> defaultList = <File>[
    File(''),
    File(''),
    File(''),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) => state.when(
        initial: () => SignUpContent(
          completer: completer,
          phoneNumber: phoneNumber,
          photoURL: photoURL,
          uid: uid,
          email: email,
          list: defaultList,
        ),
        choosePhotoSuccess: (file) => SignUpContent(
          completer: completer,
          phoneNumber: phoneNumber,
          photoURL: photoURL,
          uid: uid,
          email: email,
          list: file,
        ),
      ),
    );
  }
}
