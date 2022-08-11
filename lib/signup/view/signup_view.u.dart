import 'dart:async';

import 'package:flutter/material.dart';

import 'package:revup_core/core.dart';

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
    return SignUpContent(
      completer: completer,
      phoneNumber: phoneNumber,
      photoURL: photoURL,
      uid: uid,
      email: email,
    );
  }
}
