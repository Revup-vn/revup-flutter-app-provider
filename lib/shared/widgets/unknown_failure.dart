import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';

class UnknownFailure extends StatelessWidget {
  const UnknownFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.screens.sadMood.svg(width: 250, height: 250),
            const SizedBox(
              height: 16,
            ),
            AutoSizeText(
              l10n.unknownFailureLabel,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ) ??
                  const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                context.router.popUntilRouteWithName('HomeRoute');
              },
              child: Text(l10n.backToHomePageLabel),
            )
          ],
        ),
      ),
    );
  }
}
