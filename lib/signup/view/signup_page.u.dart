import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:revup_core/core.dart';

import '../../configs/video_call_config.dart';
import '../../l10n/l10n.dart';
import '../../shared/widgets/avatar.dart';
import '../../shared/widgets/dismiss_keyboard.dart';
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
