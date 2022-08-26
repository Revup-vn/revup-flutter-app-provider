import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/utils/utils_function.dart';
import '../../../models/pending_service_model.dart';
import '../bloc/info_request_bloc.dart';
import '../widgets/action_button.dart';
import '../widgets/widgets.dart';

class InfoRequestView extends StatefulWidget {
  const InfoRequestView({
    super.key,
    required this.consumer,
    required this.distance,
    required this.pendingService,
    required this.pendingAmount,
    required this.userRepos,
    required this.user,
  });
  final AppUser consumer;
  final double distance;
  final IList<PendingServiceModel> pendingService;
  final int pendingAmount;
  final IStore<AppUser> userRepos;
  final AppUser user;

  @override
  State<InfoRequestView> createState() => _InfoRequestViewState();
}

class _InfoRequestViewState extends State<InfoRequestView> {
  bool startMode = false;
  bool fixedMode = false;
  bool movingMode = false;
  // late Timer _timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final blocPage = context.watch<InfoRequestBloc>();
    blocPage.state.whenOrNull(
      initial: () async {
        blocPage.add(const InfoRequestEvent.started());
      },
    );

    final user = getUser(context.read<AuthenticateBloc>().state).getOrElse(
      () => throw NullThrownError(),
    );

    return BlocBuilder<InfoRequestBloc, InfoRequestState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (
            needToVerifyService,
            record,
            len,
          ) =>
              Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                        ContactItem(consumer: widget.consumer),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        BuildRowItem(
                          iconData: Icons.social_distance,
                          text: l10n.distanceLabel,
                          textBold: '${widget.distance.toStringAsFixed(2)} km',
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
                                textBold: '''$len ${l10n.repairItemsLabel}''',
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
                                      pendingService: widget.pendingService,
                                      pendingAmount: widget.pendingAmount,
                                    ),
                                  );
                                },
                                child: !needToVerifyService.isEmpty
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
                LayoutBuilder(
                  builder: (context, _) {
                    if (needToVerifyService.isEmpty) startMode = true;
                    if (startMode) {
                      return ActionButton(
                        text: l10n.startLabel,
                        onPressed: () {
                          startMode = false;
                          movingMode = true;
                          // send message provider start moving to consumer
                          blocPage.add(
                            InfoRequestEvent.confirmDeparted(
                              onRoute: () => context.router.push(
                                MapRouteRoute(
                                  recordId: record.id,
                                  consumerId: record.cid,
                                ),
                              ),
                              sendMessage: (token) => context
                                  .read<NotificationCubit>()
                                  .sendMessageToToken(
                                    SendMessage(
                                      title: 'Revup',
                                      body: l10n.startMovingLabel,
                                      token: token,
                                      icon: kRevupIconApp,
                                      payload: MessageData(
                                        type: NotificationType.NormalMessage,
                                        payload: <String, dynamic>{
                                          'subType': 'ProviderDeparted',
                                          'providerId': record.pid,
                                        },
                                      ),
                                    ),
                                  ),
                            ),
                          );
                        },
                      );
                    } else if (movingMode) {
                      return ActionButton(
                        text: l10n.providerArrivedLabel,
                        onPressed: () {
                          // update record to arrived
                          movingMode = false;
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
                          context.router.replace(HomeRoute(user: user));
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

  @override
  void dispose() {
    super.dispose();
  }
}
