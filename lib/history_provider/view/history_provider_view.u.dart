import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../bloc/history_provider_bloc.dart';
import '../widgets/history_item.u.dart';

class HistoryProviderView extends StatelessWidget {
  const HistoryProviderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
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
                            itemBuilder: (BuildContext context, int index) {
                              return histories.elementAt(index).isComplete
                                  ? HistoryItem(
                                      orderNumber: histories
                                          .elementAt(index)
                                          .orderNumber,
                                      vehicleType: histories
                                          .elementAt(index)
                                          .vehicleType,
                                      serviceName: histories
                                          .elementAt(index)
                                          .serviceName,
                                      serviceStartBooking: histories
                                          .elementAt(index)
                                          .serviceStartBooking,
                                      orderStatusNotification: histories
                                          .elementAt(index)
                                          .orderStatusNotification,
                                      textStyleNotification: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                              ) ??
                                          TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                      user: histories.elementAt(index).user,
                                    )
                                  : HistoryItem(
                                      orderNumber: histories
                                          .elementAt(index)
                                          .orderNumber,
                                      vehicleType: histories
                                          .elementAt(index)
                                          .vehicleType,
                                      serviceName: histories
                                          .elementAt(index)
                                          .serviceName,
                                      serviceStartBooking: histories
                                          .elementAt(index)
                                          .serviceStartBooking,
                                      orderStatusNotification: histories
                                          .elementAt(index)
                                          .orderStatusNotification,
                                      textStyleNotification: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                              ) ??
                                          TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                          ),
                                      user: histories.elementAt(index).user,
                                    );
                            },
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
          ),
        ],
      ),
    );
  }
}
