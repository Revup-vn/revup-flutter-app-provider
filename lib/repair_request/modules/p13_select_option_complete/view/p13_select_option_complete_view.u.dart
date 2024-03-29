import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../../shared/shared.dart';
import '../../../../shared/widgets/custom_dialog.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../../../models/models.dart';
import '../cubit/select_options_cubit.dart';
import '../widgets/select_service_request_form.u.dart';

class P13SelectOptionCompleteView extends StatelessWidget {
  const P13SelectOptionCompleteView({
    super.key,
    required this.form,
    required this.services,
    required this.vehicle,
    required this.id,
  });

  final GlobalKey<FormBuilderState> form;
  final List<PendingServiceModel> services;
  final String vehicle;
  final String id;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.watch<SelectOptionsCubit>();
    cubit.state.maybeWhen(
      initial: () => cubit.fetchUnpaidServices(() => context.router.pop()),
      orElse: () => false,
    );
    return BlocBuilder<SelectOptionsCubit, SelectOptionsState>(
      builder: (context, state) {
        return state.when(
          initial: Container.new,
          loading: Loading.new,
          populated: (data) {
            return Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      form.currentState?.save();
                      final completedLst = form.currentState?.value['data']
                          as List<PendingServiceModel>;
                      if (completedLst.isEmpty) {
                        showDialog<void>(
                          barrierDismissible: false,
                          context: context,
                          builder: (bcontext) => SimpleDialogCustom(
                            height: 250,
                            content: [
                              AutoSizeText(
                                context.l10n.chooseNoService,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AutoSizeText(
                                context.l10n.sureLabel,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                            button: [
                              TextButton(
                                onPressed: () {
                                  bcontext.router.pop();
                                  context
                                      .read<SelectOptionsCubit>()
                                      .submitCompleted(
                                    id,
                                    (token, providerId, recordId) {
                                      context
                                          .read<NotificationCubit>()
                                          .sendMessageToToken(
                                            SendMessage(
                                              title: 'Revup',
                                              body: 'Done',
                                              token: token,
                                              icon: kRevupIconApp,
                                              payload: MessageData(
                                                type: NotificationType
                                                    .ProviderRepaired,
                                                payload: <String, dynamic>{
                                                  'providerId': providerId,
                                                  'recordId': recordId,
                                                },
                                              ),
                                            ),
                                          );
                                    },
                                    completedLst,
                                  );
                                  context.router.push(
                                    P14RepairCompleteRoute(
                                      finished: (form.currentState?.value ??
                                              <String, dynamic>{
                                                'data': <dynamic>[]
                                              })['data']
                                          as List<PendingServiceModel>,
                                      paid: services
                                          .where((e) => e.status == 'paid')
                                          .map(
                                            (v) => PaidServicesModel.fromDto(
                                              pendingService: v,
                                            ),
                                          )
                                          .toList(),
                                      vehicle: vehicle,
                                      recordId: id,
                                      transFee: services.firstWhere(
                                        (e) =>
                                            e.name == 'transFee' &&
                                            e.status != 'paid',
                                      ),
                                    ),
                                  );
                                },
                                child: AutoSizeText(
                                  context.l10n.confirmLabel,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  bcontext.router.pop();
                                },
                                child: AutoSizeText(
                                  context.l10n.cancelLabel,
                                ),
                              ),
                            ],
                          ),
                        );
                        return;
                      } else {
                        context.read<SelectOptionsCubit>().submitCompleted(
                          id,
                          (token, providerId, recordId) {
                            context
                                .read<NotificationCubit>()
                                .sendMessageToToken(
                                  SendMessage(
                                    title: 'Revup',
                                    body: 'Done',
                                    token: token,
                                    icon: kRevupIconApp,
                                    payload: MessageData(
                                      type: NotificationType.ProviderRepaired,
                                      payload: <String, dynamic>{
                                        'providerId': providerId,
                                        'recordId': recordId,
                                      },
                                    ),
                                  ),
                                );
                          },
                          completedLst,
                        );
                      }

                      context.router.push(
                        P14RepairCompleteRoute(
                          finished: (form.currentState?.value ??
                              <String, dynamic>{
                                'data': <dynamic>[]
                              })['data'] as List<PendingServiceModel>,
                          paid: services
                              .where((e) => e.status == 'paid')
                              .map(
                                (v) => PaidServicesModel.fromDto(
                                  pendingService: v,
                                ),
                              )
                              .toList(),
                          vehicle: vehicle,
                          recordId: id,
                          transFee: services.firstWhere(
                            (e) => e.name == 'transFee' && e.status != 'paid',
                          ),
                        ),
                      );
                    },
                    child: Text(l10n.nextLabel),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            child: Row(
                              children: <Widget>[
                                AutoSizeText(
                                  l10n.selectCompletedItemLabel,
                                  style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold) ??
                                      const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          SizedBox(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: AutoSizeText(
                                    l10n.messagesSelectItemLabel,
                                    style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurfaceVariant,
                                            ) ??
                                        TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          SelectServiceRequestForm(
                            services: data,
                            formKey: form,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
