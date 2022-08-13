import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import 'otp_pincode_main_content.u.dart';

class OTPMainContent extends StatelessWidget {
  const OTPMainContent(this.phoneNumber, this.completer, {super.key});
  final Completer<String> completer;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              context.loaderOverlay.hide();
              context.read<AuthenticateBloc>().add(
                    const AuthenticateEvent.reset(),
                  );
              context.router.pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              AutoSizeText(
                l10n.enterOTPCodeLabel,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              AutoSizeText.rich(
                maxLines: 1,
                TextSpan(
                  text: l10n.sendOTPCodeToLabel,
                  children: [
                    TextSpan(
                      text: '+84 0$phoneNumber',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OTPCode(phoneNumber, completer),
            ],
          ),
        ),
      ),
    );
  }
}
