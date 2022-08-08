import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../bloc/repair_completed_bloc.dart';
import '../widgets/widgets.dart';

class RepairCompleteView extends StatelessWidget {
  const RepairCompleteView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // TODO(tcmhoang): depressed cannot review this file
    /// someone please help m

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: BlocBuilder<RepairCompletedBloc, RepairCompletedState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const Text('Empty'),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        failure: () => const Text('Failed'),
                        success: (repairCompletedState) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              l10n.completeRepairLabel,
                              style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ) ??
                                  const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            const UploadPhotosItem(),
                            const SizedBox(height: 10),
                            BuildRowRepairCompletedItem(
                              title: l10n.collectMoneyCustomersLabel,
                              content: repairCompletedState
                                  .collectMoneyCustomers
                                  .toString(),
                              textButtonName: l10n.detailLabel,
                            ),
                            const SizedBox(height: 5),
                            BuildRowRepairCompletedItem(
                              title: l10n.vehicleTypeLabel,
                              content: repairCompletedState.vehicleType,
                              textButtonName: '',
                            ),
                            const SizedBox(height: 10),
                            BuildRowRepairCompletedItem(
                              title: l10n.completedItemLabel,
                              content:
                                  '''${l10n.totalLabel} ${repairCompletedState.totalService}${l10n.categoriesLabel}''',
                              textButtonName: l10n.fixAgainLabel,
                            ),
                            const SizedBox(height: 30),
                            AutoSizeText(
                              l10n.messagesCheckInformation,
                              style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ) ??
                                  TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            // bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: ElevatedButton(
                onPressed: () {
                  // TODO(namngoc231): Complete
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: AutoSizeText(
                  l10n.completeLabel,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
