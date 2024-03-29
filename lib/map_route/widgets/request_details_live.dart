import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../repair_request/models/models.dart';
import '../../repair_request/modules/p4_info_request/cubit/realtime_location_cubit.dart';
import '../../router/router.dart';
import '../../shared/utils/utils.dart';
import '../bloc/map_route_bloc.dart';

class RequestDetailsLive extends StatelessWidget {
  const RequestDetailsLive(
    this.recordId,
    this.consumer,
    this.distance,
    this.pendingService,
    this.pendingAmount, {
    super.key,
  });

  final String recordId;
  final AppUser consumer;
  final double distance;
  final IList<PendingServiceModel> pendingService;
  final int pendingAmount;
  @override
  Widget build(BuildContext context) {
    final cubitNotify = context.read<NotificationCubit>();

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // send message provider arrival
                context.read<RealtimeLocationCubit>().close();
                context.read<MapRouteBloc>().add(
                      MapRouteEvent.providerStarted(
                        onRoute: () {
                          Future<dynamic>.delayed(
                            const Duration(milliseconds: 100),
                          );
                          context.router.popAndPush(
                            StartRepairRoute(
                              consumer: consumer,
                              recordId: recordId,
                              distance: distance,
                              pendingService: pendingService,
                              pendingAmount: pendingAmount,
                            ),
                          );
                          context.router.removeWhere(
                            (route) => route.name == MapRouteRoute.name,
                          );
                        }, // route to doing repair page
                        sendMessage: (token) => cubitNotify.sendMessageToToken(
                          SendMessage(
                            title: 'Revup',
                            body: context.l10n.startMovingLabel,
                            token: token,
                            icon: kRevupIconApp,
                            payload: MessageData(
                              type: NotificationType.VerifiedArrival,
                              payload: <String, dynamic>{},
                            ),
                          ),
                        ),
                      ),
                    );
              },
              child: Text(context.l10n.providerArrivedLabel),
            ),
          ],
        ),
      ),
    );
  }
}
