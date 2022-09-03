import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../bloc/history_provider_bloc.dart';
import 'history_provider_view.u.dart';

class HistoryProviderPage extends StatelessWidget {
  const HistoryProviderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryProviderBloc(
        context.read(),
        context.read(),
        context.read<AuthenticateBloc>().state.maybeWhen(
              orElse: () => throw NullThrownError(),
              authenticated: (authType) => authType.user.uuid,
            ),
      )..add(
          const HistoryProviderEvent.started(),
        ),
      child: const HistoryProviderView(),
    );
  }
}
