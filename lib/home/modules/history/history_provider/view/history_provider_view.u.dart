import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../router/router.dart';
import '../bloc/history_provider_bloc.dart';
import '../widgets/widgets.dart';

class HistoryProviderView extends StatelessWidget {
  const HistoryProviderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  AutoSizeText(
                    l10n.historyLabel,
                    style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              BlocBuilder<HistoryProviderBloc, HistoryProviderState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Text('Empty'),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    failure: () => const Text('Failed'),
                    success: (histories) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: histories.length,
                      itemBuilder: (context, index) => HistoryItem(
                        data: histories[index],
                        onTap: () => context.router.push(
                          HistoryProviderDetailRoute(
                            rpID: histories[index].orderNumber,
                          ),
                        ),
                        textColor: histories[index].orderStatus == 1
                            ? Theme.of(context).colorScheme.tertiary
                            : Theme.of(context).colorScheme.error,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
