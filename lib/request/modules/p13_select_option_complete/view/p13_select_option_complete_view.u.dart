import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../models/models.dart';
import '../cubit/select_options_cubit.dart';
import '../widgets/widgets.dart';

class P13SelectOptionCompleteView extends StatelessWidget {
  const P13SelectOptionCompleteView({
    super.key,
    required this.form,
    required this.paid,
    required this.vehicle,
    required this.id,
  });

  final GlobalKey<FormBuilderState> form;
  final List<PaidServicesModel> paid;
  final String vehicle;
  final String id;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    context.read<SelectOptionsCubit>().fetchUnpaidServices(
          () => context.router.pop(),
        );
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
              context.router.push(
                P14RepairCompleteRoute(
                    finished: (form.currentState?.value ??
                            <String, dynamic>{'data': <dynamic>[]})['data']
                        as List<PendingServiceModel>,
                    paid: paid,
                    vehicle: vehicle,
                    recordId: id),
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
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
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
                  context.watch<SelectOptionsCubit>().state.when(
                        initial: Container.new,
                        loading: () =>
                            const CircularProgressIndicator.adaptive(),
                        populated: (data) => SelectServiceRequestForm(
                          services: data,
                          formKey: form,
                        ),
                      ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
