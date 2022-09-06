import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../../shared/shared.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../../../../shared/widgets/unknown_failure.dart';
import '../../../models/models.dart';
import '../cubit/p14_repair_completed_cubit.dart';
import '../widgets/widgets.dart';

class P14RepairCompleteView extends StatefulWidget {
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
  State<P14RepairCompleteView> createState() => _P14RepairCompleteViewState();
}

class _P14RepairCompleteViewState extends State<P14RepairCompleteView> {
  late bool _isEnabled;
  @override
  void initState() {
    super.initState();

    _isEnabled = false;
    context.read<NotificationCubit>().addForegroundListener((p0) {
      final type = p0.payload.type;
      switch (type) {
        case NotificationType.ConsumerBilled:
          if (mounted) {
            setState(() {
              _isEnabled = true;
            });
          }
          break;
        // ignore: no_default_cases
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<P14RepairCompletedCubit, P14RepairCompletedState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return Scaffold(
              appBar: AppBar(),
              body: Column(
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
                                    .read<P14RepairCompletedCubit>()
                                    .setImgs(value),
                              ), // Set Imgs
                            ),
                            const SizedBox(height: 10),
                            BuildRowRepairCompletedItem(
                              title: l10n.collectMoneyCustomersLabel,
                              content: context.formatMoney(
                                widget.finished.map((e) => e.price).reduce(
                                      (value, element) => value + element,
                                    ),
                              ),
                              textButtonName: l10n.detailLabel,
                              onPressed: () => context.router.push(
                                P16FinishedOrderDetailRoute(
                                  services: widget.finished,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            BuildRowRepairCompletedItem(
                              title: l10n.vehicleTypeLabel,
                              content: widget.vehicle == 'motorbike'
                                  ? l10n.motorcycleLabel
                                  : l10n.carLabel,
                              textButtonName: '',
                            ),
                            const SizedBox(height: 10),
                            BuildRowRepairCompletedItem(
                              title: l10n.completedItemLabel,
                              content:
                                  '''${l10n.totalLabel} ${widget.finished.length} ${l10n.repairItemsLabel}''',
                              textButtonName: '',
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
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          BoxDecoration(color: Theme.of(context).cardColor),
                      child: ElevatedButton(
                        onPressed: _isEnabled
                            ? () async {
                                await context
                                    .read<P14RepairCompletedCubit>()
                                    .submit(
                                  widget.finished,
                                  widget.paid,
                                  (a, b, c, d) async {
                                    await context
                                        .read<NotificationCubit>()
                                        .sendMessageToToken(
                                          SendMessage(
                                            title: 'Revup',
                                            body: 'body',
                                            token: a,
                                            icon: kRevupIconApp,
                                            payload: MessageData(
                                              type: NotificationType
                                                  .NormalMessage,
                                              payload: <String, dynamic>{
                                                'providerId': b,
                                                'subType': c,
                                                'recordId': d,
                                              },
                                            ),
                                          ),
                                        );
                                  },
                                  () => context.router.popUntil(
                                    (route) =>
                                        route.settings.name == HomeRoute.name,
                                  ),
                                );
                              }
                            : null,
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
          },
          failed: UnknownFailure.new,
          uploading: Loading.new,
          succeeded: Container.new,
        );
      },
    );
  }
}
