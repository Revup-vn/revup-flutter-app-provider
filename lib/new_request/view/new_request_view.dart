// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../router/router.dart';
import '../../shared/utils/utils.dart';
import '../../shared/utils/utils_function.dart';
import '../../shared/widgets/custom_dialog.dart';
import '../../shared/widgets/loading.u.dart';
import '../bloc/new_request_bloc.dart';
import '../widgets/request_details_static.dart';
import '../widgets/request_map_static.dart';

class NewRequestView extends StatelessWidget {
  const NewRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocPage = context.watch<NewRequestBloc>();
    final cubitNotify = context.read<NotificationCubit>();
    blocPage.state.whenOrNull(
      initial: () {
        blocPage.add(const NewRequestEvent.started());
      },
    );
    final user = getUser(context.read<AuthenticateBloc>().state)
        .getOrElse(() => throw NullThrownError());

    return BlocBuilder<NewRequestBloc, NewRequestState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (
            directions,
            fromMaker,
            toMarker,
            consumer,
            record,
            pendingService,
            needToVerify,
            pendingAmount,
          ) {
            return Stack(
              children: <Widget>[
                RequestMapStatic(
                  directions: directions,
                  fromMaker: fromMaker,
                  toMarker: toMarker,
                  consumer: consumer,
                ),
                Positioned(
                  top: 56,
                  right: 8,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog<Unit>(
                        context: context,
                        builder: (context) => SimpleDialogCustom(
                          content: [
                            AutoSizeText(
                              context.l10n.repairRequestSkipLabel,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                            ),
                          ],
                          button: [
                            ElevatedButton(
                              onPressed: () {
                                context.router.pop();
                              },
                              child: Text(context.l10n.cancelLabel),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                blocPage.add(
                                  NewRequestEvent.decline(
                                    record: record,
                                    onRoute: () => context.router.replace(
                                      HomeRoute(
                                        user: user,
                                      ),
                                    ),
                                    sendMessage: (token) =>
                                        cubitNotify.sendMessageToToken(
                                      SendMessage(
                                        title: 'Revup',
                                        body: context
                                            .l10n.providerDeclineRequestLabel,
                                        token: token,
                                        icon: kRevupIconApp,
                                        payload: MessageData(
                                          type:
                                              NotificationType.ProviderDecline,
                                          payload: <String, dynamic>{
                                            'recordId': record.id,
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(context.l10n.confirmLabel),
                            )
                          ],
                        ),
                      );
                    },
                    child: const Icon(Icons.close),
                  ),
                ),
                RequestDetailsStatic(
                  consumer: consumer,
                  record: record,
                  distance: directions.distance / 1000,
                  pendingService: ilist(pendingService),
                  needToVerify: needToVerify,
                  pendingAmount: pendingAmount,
                ),
              ],
            );
          },
          orElse: Loading.new,
        );
      },
    );
  }
}
