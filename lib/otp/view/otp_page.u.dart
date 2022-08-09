import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/otp_main_content.u.dart';

class OTPPage extends StatelessWidget {
  const OTPPage(this.phoneNumber, this.completer, {super.key});
  final Completer<String> completer;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return OTPMainContent(phoneNumber, completer);
  }
}
