import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';

import 'package:revup_core/core.dart';

import '../bloc/signup_bloc.dart';
import 'signup_view.u.dart';

class SignupPage extends StatelessWidget {
  SignupPage(
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
    return BlocProvider(
      create: (context) => SignupBloc(ImagePicker()),
      child: SignupView(completer, phoneNumber, photoURL, uid, email),
    );
  }
}
