import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../models/models.dart';
import '../cubit/overview_record_cubit.dart';
import '../widgets/widgets.dart';

class P14RepairCompleteView extends StatelessWidget {
  const P14RepairCompleteView({
    super.key,
    required this.finished,
    required this.paid,
    required this.vehicle,
  });

  final List<PendingServiceModel> finished;
  final List<PaidServicesModel> paid;
  final String vehicle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<OverviewRecordCubit, OverviewRecordState>(
        listener: (context, state) => state.maybeMap(
          failed: (value) => context.router.pop(),
          succeeded: (value) => context.router.push(
            P16FinishedOrderDetailRoute(data: tuple2(finished, paid)),
          ),
          orElse: () => unit,
        ),
        builder: (context, state) => state.maybeWhen(
          orElse: Container.new,
          uploading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          initial: () => Column(
            children: [
              Expanded(
                flex: 8,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
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
                        UploadPhotosItem(
                          onUpdatedImageTile: (fs) => fs.then(
                            (value) => context
                                .read<OverviewRecordCubit>()
                                .setImgs(value),
                          ), // Set Imgs
                        ),
                        const SizedBox(height: 10),
                        BuildRowRepairCompletedItem(
                          title: l10n.collectMoneyCustomersLabel,
                          content: context.formatMoney(
                            finished
                                .map((e) => e.price)
                                .reduce((value, element) => value + element),
                          ),
                          textButtonName: l10n.detailLabel,
                        ),
                        const SizedBox(height: 5),
                        BuildRowRepairCompletedItem(
                          title: l10n.vehicleTypeLabel,
                          content: vehicle,
                          textButtonName: '',
                        ),
                        const SizedBox(height: 10),
                        BuildRowRepairCompletedItem(
                          title: l10n.completedItemLabel,
                          content:
                              '''${l10n.totalLabel} ${finished.length}${l10n.repairItemsLabel}''',
                          textButtonName: '',
                        ),
                        const SizedBox(height: 30),
                        AutoSizeText(
                          l10n.messagesCheckInformation,
                          style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ) ??
                              TextStyle(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<OverviewRecordCubit>()
                          .submit(finished, paid);
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
        ),
      ),
    );
  }
}
