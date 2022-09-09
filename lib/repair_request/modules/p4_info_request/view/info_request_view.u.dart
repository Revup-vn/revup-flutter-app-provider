import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../shared/utils/utils.dart';
import '../../../../shared/widgets/custom_dialog.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../../../../shared/widgets/unknown_failure.dart';
import '../../../models/pending_service_model.dart';
import '../../../request.dart';
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
  bool ready = false;
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().addForegroundListener((p0) {
      final type = p0.payload.type;
      switch (type) {
        case NotificationType.NormalMessage:
          final subType = p0.payload.payload['subType'] as String;
          if (subType == 'ConsumerSelected') {
            showDialog<void>(
              barrierDismissible: false,
              context: context,
              builder: (bcontext) => SimpleDialogCustom(
                height: 150,
                content: [
                  AutoSizeText(
                    context.l10n.selectedProductLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
                button: [
                  TextButton(
                    onPressed: () {
                      bcontext.router.pop();
                      if (mounted) {
                        setState(() {
                          ready = true;
                        });
                      }
                    },
                    child: AutoSizeText(
                      context.l10n.understoodLabel,
                    ),
                  ),
                ],
              ),
            );
          }
          if (subType == 'Canceled') {
            showDialog<void>(
              barrierDismissible: false,
              context: context,
              builder: (bcontext) => SimpleDialogCustom(
                height: 200,
                content: [
                  AutoSizeText(
                    context.l10n.cancelByUserLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  AutoSizeText(
                    context.l10n.sorryLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
                button: [
                  TextButton(
                    onPressed: () {
                      if (mounted) {
                        context.router.popUntil(
                          (route) => route.settings.name == HomeRoute.name,
                        );
                      }
                    },
                    child: AutoSizeText(
                      context.l10n.understoodLabel,
                    ),
                  ),
                ],
              ),
            );
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
    final cubit = context.read<NotificationCubit>();
    final routerFake = context.router;
    final l10n = context.l10n;
    final blocPage = context.watch<InfoRequestBloc>();
    var willPop = true;
    blocPage.state.whenOrNull(
      initial: () async {
        blocPage.add(const InfoRequestEvent.started());
      },
    );

    return WillPopScope(
      onWillPop: () async {
        if (willPop) {
          return true;
        } else {
          final completer = Completer<bool>();
          await showDialog<String>(
            barrierDismissible: false,
            context: context,
            builder: (bcontext) {
              return SimpleDialogCustom(
                height: 150,
                content: [
                  AutoSizeText(
                    l10n.sureLabel,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  AutoSizeText(
                    context.l10n.cancelThisLabel,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
                button: [
                  TextButton(
                    onPressed: () {
                      context.read<InfoRequestBloc>().add(
                            InfoRequestEvent.cancel(
                              onRoute: () => routerFake.popUntil(
                                (route) =>
                                    route.settings.name == HomeRoute.name,
                              ),
                              sendMessage: (token, recordId) =>
                                  cubit.sendMessageToToken(
                                SendMessage(
                                  title: 'Revup',
                                  body: l10n.canceledLabel,
                                  token: token,
                                  icon: kRevupIconApp,
                                  payload: MessageData(
                                    type: NotificationType.NormalMessage,
                                    payload: <String, dynamic>{
                                      'subType': 'Canceled',
                                      'providerId': recordId,
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                      completer.complete(true);
                      bcontext.router.pop();
                    },
                    child: Text(l10n.yesLabel),
                  ),
                  TextButton(
                    onPressed: () {
                      completer.complete(false);
                      bcontext.router.pop();
                    },
                    child: Text(l10n.cancelLabel),
                  )
                ],
              );
            },
          );
          final res = await completer.future;
          return res;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              willPop = false;
              context.router.pop();
            },
          ),
        ),
        body: BlocBuilder<InfoRequestBloc, InfoRequestState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (
                needToVerifyService,
                record,
                len,
                isReady,
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
                              textBold:
                                  '${widget.distance.toStringAsFixed(1)} km',
                            ),
                            BuildRowItem(
                              iconData: Icons.directions_run,
                              text: l10n.feeTransportLabel,
                              textBold: context.formatMoney(record.money),
                            ),
                            BuildRowItem(
                              iconData: Icons.directions_bike,
                              text: l10n.vehicleTypeLabel,
                              textBold: record.vehicle == 'car'
                                  ? l10n.carLabel
                                  : l10n.motorcycleLabel,
                            ),
                            if (record.desc.isNotEmpty)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.description_outlined,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: AutoSizeText(
                                      record.desc,
                                      textAlign: TextAlign.start,
                                      softWrap: true,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
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
                                        '''$len ${l10n.repairItemsLabel}''',
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
                    LayoutBuilder(
                      builder: (context, _) {
                        return ActionButton(
                          text: l10n.startLabel,
                          onPressed: !ready
                              ? null
                              : () {
                                  willPop = false;
                                  blocPage.add(
                                    InfoRequestEvent.confirmDeparted(
                                      onRoute: () =>
                                          context.router.pushAndPopUntil(
                                        MapRouteRoute(
                                          recordId: record.id,
                                          consumerId: record.cid,
                                          consumer: widget.consumer,
                                          distance: widget.distance,
                                          pendingAmount: widget.pendingAmount,
                                          pendingService: widget.pendingService,
                                        ),
                                        predicate: (route) =>
                                            route.settings.name ==
                                            HomeRoute.name,
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
                                                type: NotificationType
                                                    .NormalMessage,
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
                      },
                    ),
                  ],
                ),
              ),
              failure: UnknownFailure.new,
              orElse: Loading.new,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
