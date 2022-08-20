import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../cubit/permission_cubit.dart';

class PermissionView extends StatelessWidget {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final cubit = context.watch<PermissionCubit>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            l10n.locationDeniedLabel,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {},
            child: AutoSizeText(
              l10n.enableLocationLabel,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
