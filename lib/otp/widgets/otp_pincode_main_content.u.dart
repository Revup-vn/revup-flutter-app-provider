import 'dart:async';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPCode extends StatelessWidget {
  const OTPCode(this.phoneNumber, this.completer, {super.key});
  final String phoneNumber;
  final Completer<String> completer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PinCodeTextField(
          key: const Key('pincodeTextField'),
          appContext: context,
          length: 6,
          obscureText: true,
          animationType: AnimationType.scale,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            inactiveColor: Theme.of(context).colorScheme.onSurfaceVariant,
            selectedColor: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          cursorColor: Theme.of(context).shadowColor,
          keyboardType: TextInputType.number,
          onCompleted: (v) async {
            context.loaderOverlay.show();
            completer.complete(v);
            await context.router.pop();
          },
          onChanged: (String value) {
            // TODO(wamynob): implement
          },
        ),
      ],
    );
  }
}
