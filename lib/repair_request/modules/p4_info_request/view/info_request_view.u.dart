import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../new_request/models/pending_repair_request.dart';
import '../../../../router/router.dart';
import '../../../../shared/utils/utils_function.dart';
import '../bloc/info_request_bloc.dart';
import '../widgets/action_button.dart';
import '../widgets/widgets.dart';

class InfoRequestView extends StatefulWidget {
  const InfoRequestView({super.key});

  @override
  State<InfoRequestView> createState() => _InfoRequestViewState();
}

class _InfoRequestViewState extends State<InfoRequestView> {
  bool startMode = true;
  bool fixedMode = false;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final blocPage = context.watch<InfoRequestBloc>();
    blocPage.state.whenOrNull(
      initial: () => blocPage.add(const InfoRequestEvent.started()),
    );
    // TODO (cantgim): listen for event choose product from consumer

    final user = getUser(context.read<AuthenticateBloc>().state).getOrElse(
      () => throw NullThrownError(),
    );

    return BlocBuilder<InfoRequestBloc, InfoRequestState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (
            consumer,
            distance,
            pendingService,
            pendingAmount,
            needToVerifyService,
            record,
          ) =>
              Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        l10n.requestInformationReceivedLabel,
                        style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold) ??
                            const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 20),
                      // CONTACT
                      ContactItem(consumer: consumer),
                      const SizedBox(height: 10),
                      const Divider(thickness: 1),
                      const SizedBox(height: 10),
                      BuildRowItem(
                        iconData: Icons.social_distance,
                        text: l10n.distanceLabel,
                        textBold: '${distance.toStringAsFixed(2)} km',
                      ),
                      BuildRowItem(
                        iconData: Icons.directions_run,
                        text: l10n.feeTransportLabel,
                        textBold: context.formatMoney(record.money),
                      ),
                      BuildRowItem(
                        iconData: Icons.directions_bike,
                        text: l10n.vehicleTypeLabel,
                        textBold: record.vehicle,
                      ),
                      if (record.desc.isNotEmpty)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.description_outlined, size: 16),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                record.desc,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                style: Theme.of(context).textTheme.bodyLarge,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      Row(
                        children: [
                          Expanded(
                            child: BuildRowItem(
                              iconData: Icons.build,
                              text: l10n.serviceLabel,
                              textBold:
                                  '''${pendingService.length()} ${l10n.repairItemsLabel}''',
                            ),
                          ),
                          GestureDetector(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              onPressed: () {
                                context.router.push(
                                  P10QuotePriceRoute(
                                    record: record,
                                    pendingService: pendingService,
                                    pendingAmount: pendingAmount,
                                  ),
                                );
                              },
                              child: needToVerifyService.isEmpty
                                  ? Text(l10n.quoteLabel)
                                  : Text(l10n.detailLabel),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 1),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        l10n.messagesCallForCustomersLabel,
                        style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ) ??
                            TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ],
                  ),
                ),
                LayoutBuilder(
                  builder: (context, _) {
                    if (startMode && needToVerifyService.isEmpty) {
                      return ActionButton(
                        text: l10n.startLabel,
                        onPressed: () {
                          startMode = false;
                          _openMapsFor(record);
                        },
                      );
                    } else if (!startMode) {
                      return ActionButton(
                        text: l10n.providerArrivedLabel,
                        onPressed: () {
                          // update record to arrived
                          fixedMode = true;
                          blocPage.add(const InfoRequestEvent.confirmArrived());
                        },
                      );
                    } else if (fixedMode) {
                      return ActionButton(
                        text: l10n.startRepairLabel,
                        onPressed: () {
                          // update record to started
                          blocPage.add(const InfoRequestEvent.confirmStarted());
                          context.router.replaceAll([HomeRoute(user: user)]);
                        },
                      );
                    }
                    return ActionButton(text: l10n.startLabel);
                  },
                ),
              ],
            ),
          ),
          orElse: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }

  Future<void> _openMapsFor(PendingRepairRequest record) async {
    final isGoogle = await MapLauncher.isMapAvailable(MapType.google);

    final isApple = await MapLauncher.isMapAvailable(MapType.apple);
    if (isGoogle ?? false) {
      await MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(record.to.lat, record.to.long),
        origin: Coords(record.from.lat, record.from.long),
        destinationTitle: 'Điểm sửa chữa',
        originTitle: 'Vị trí hiện tại',
      );
    } else if (isApple ?? false) {
      await MapLauncher.showDirections(
        mapType: MapType.apple,
        destination: Coords(record.to.lat, record.to.long),
        origin: Coords(record.from.lat, record.from.long),
        destinationTitle: 'Điểm sửa chữa',
        originTitle: 'Vị trí hiện tại',
      );
    }
  }
}
