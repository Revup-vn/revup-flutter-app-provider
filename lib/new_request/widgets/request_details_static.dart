import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../repair_request/models/need_to_verify_model.dart';
import '../../repair_request/models/pending_service_model.dart';
import '../../router/router.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widgets/app_avatar.dart';
import '../bloc/new_request_bloc.dart';
import '../models/pending_repair_request.dart';

class RequestDetailsStatic extends StatelessWidget {
  const RequestDetailsStatic({
    super.key,
    required this.consumer,
    required this.record,
    required this.distance,
    required this.pendingService,
    required this.needToVerify,
    required this.pendingAmount,
    required this.len,
    required this.transFee,
  });
  final AppUser consumer;
  final PendingRepairRequest record;
  final double distance;
  final IList<PendingServiceModel> pendingService;
  final List<NeedToVerifyModel> needToVerify;
  final int pendingAmount;
  final int len;
  final PendingServiceModel transFee;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubitNotify = context.read<NotificationCubit>();

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 320,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 8,
              ),
              Center(
                child: AutoSizeText(
                  l10n.newRequestLabel,
                  style: Theme.of(context).textTheme.titleLarge ??
                      const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Divider(),
              Center(
                child: AppAvatar(
                  imageUrl: consumer.avatarUrl.isEmpty
                      ? kFallbackImage
                      : consumer.avatarUrl,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.social_distance_rounded),
                  const SizedBox(
                    width: 4,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: l10n.distanceLabel),
                        TextSpan(
                          text: ' ${distance.toStringAsFixed(1)} km',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.directions_run),
                  const SizedBox(
                    width: 4,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: l10n.feeOfTransportLabel),
                        TextSpan(
                          text: ' ${context.formatMoney(record.money)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.directions_bike_rounded),
                  const SizedBox(
                    width: 4,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '${l10n.vehicleTypeLabel} '),
                        TextSpan(
                          text: record.vehicle == 'motorbike'
                              ? l10n.motorcycleLabel
                              : l10n.carLabel,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Icons.build_rounded),
                        const SizedBox(
                          width: 4,
                        ),
                        AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: l10n.serviceLabel),
                              TextSpan(
                                text: '''$len ${l10n.repairItemsLabel}''',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.push(
                        P3RequestDetailRoute(
                          record: record,
                          pendingService: pendingService,
                          needToVerify: needToVerify,
                          pendingAmount: pendingAmount,
                          transFee: transFee,
                        ),
                      );
                    },
                    child: Text(
                      l10n.detailLabel,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ) ??
                          const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<NewRequestBloc>().add(
                        NewRequestEvent.accepted(
                          record: record,
                          onRoute: () => context.router.pushAndPopUntil(
                            InfoRequestRoute(
                              consumer: consumer,
                              recordId: record.id,
                              distance: distance,
                              pendingService: pendingService,
                              pendingAmount: pendingAmount,
                            ),
                            predicate: (route) =>
                                route.settings.name == HomeRoute.name,
                          ),
                          sendMessage: (token) =>
                              cubitNotify.sendMessageToToken(
                            SendMessage(
                              title: 'Revup',
                              body: l10n.providerAcceptRequestLabel,
                              token: token,
                              icon: kRevupIconApp,
                              payload: MessageData(
                                type: NotificationType.ProviderAccept,
                                payload: <String, dynamic>{
                                  'providerId': record.pid,
                                  'recordId': record.id,
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                },
                child: AutoSizeText(l10n.acceptLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
