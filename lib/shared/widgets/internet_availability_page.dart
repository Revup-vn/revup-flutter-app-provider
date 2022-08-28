import 'package:flutter/material.dart';

import 'package:dartz/dartz.dart';
import 'package:flash/flash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';

class InternetAvailabilityPage extends StatelessWidget {
  const InternetAvailabilityPage({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final conn = context.read<ConnectivityBloc>();
    conn.state.maybeWhen(
      unknown: () => conn.add(const ConnectivityEvent.checkInternet()),
      orElse: () => unit,
    );

    final l10n = context.l10n;

    return BlocListener<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        state.when(
          disconnected: () => showFlash(
            context: context,
            builder: (context, controller) => Flash<void>(
              controller: controller,
              behavior: FlashBehavior.fixed,
              position: FlashPosition.top,
              child: FlashBar(
                title: const Text('Internet'),
                content: const Text('Loss Connection'),
                showProgressIndicator: true,
                primaryAction: TextButton(
                  onPressed: () => controller.dismiss(),
                  child: Text(l10n.ignoreLabel),
                ),
              ),
            ),
          ),
          connected: () => unit,
          unknown: () => unit,
        );
      },
      listenWhen: (previous, current) => previous != current,
      child: child,
    );
  }
}
