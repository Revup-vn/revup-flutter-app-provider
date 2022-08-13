import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:revup_core/core.dart';

import '../../router/app_router.gr.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({
    super.key,
    required this.type,
  });

  final AuthType type;

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(
      const Duration(seconds: 3),
      () => context.router.pushAndPopUntil(
        // HomeRoute(user: type.user),
        const HomeRoute(),
        predicate: (dynamic _) => false,
      ),
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
                color: Colors.green,
              ),
              Text(
                'Done!',
                style: Theme.of(context).textTheme.headline5,
              ),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ],
    );
  }
}
