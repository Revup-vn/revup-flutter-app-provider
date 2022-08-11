import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';

class LoginFailure extends StatelessWidget {
  const LoginFailure({
    super.key,
    required this.errorMessage,
  });
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(
      const Duration(seconds: 3),
      () async {
        context.read<AuthenticateBloc>().add(const AuthenticateEvent.reset());
      },
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.red,
              ),
              AutoSizeText(
                errorMessage == 'too-many-requests'
                    ? context.l10n.toomanyReqLabel
                    : errorMessage,
                style: Theme.of(context).textTheme.headline5,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
