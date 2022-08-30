import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../l10n/l10n.dart';
import '../../shared/shared.dart';
import '../../shared/widgets/loading.u.dart';
import '../bloc/common_service_bloc.dart';
import '../models/commonservice.dart';
import '../widgets/service_checkbox_group.dart';

class CommonServiceView extends StatelessWidget {
  CommonServiceView({super.key});
  final form = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    context.watch<CommonServiceBloc>().state.whenOrNull(
          initial: () => context
              .read<CommonServiceBloc>()
              .add(const CommonServiceEvent.started()),
        );
    final l10n = context.l10n;

    return BlocBuilder<CommonServiceBloc, CommonServiceState>(
      builder: (context, state) {
        return DismissKeyboard(
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              body: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        state.when(
                          initial: Container.new,
                          loading: Loading.new,
                          failure: () => Center(
                            child: AutoSizeText(l10n.failLabel),
                          ),
                          success: (list, providerID) => FormBuilder(
                            key: form,
                            child: ServiceCheckboxGroup(
                              serviceList: list,
                              providerId: providerID,
                              formKey: form,
                            ),
                          ),
                          submitSuccess: Container.new,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          BoxDecoration(color: Theme.of(context).cardColor),
                      child: ElevatedButton(
                        onPressed: () {
                          // get value from form
                          form.currentState?.save();
                          final saveLst =
                              form.currentState?.value['data'] != null
                                  ? form.currentState?.value['data']
                                      as List<CommonService>
                                  : nil<CommonService>().toList();

                          if (saveLst.isEmpty) {
                            showDialog<String>(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(10),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            AutoSizeText(
                                              'khong chon dich vu',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                            ),
                                            AutoSizeText(
                                              context.l10n.sureLabel,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                var count = 0;
                                                context.router.popUntil(
                                                  (route) => count++ == 2,
                                                );
                                              },
                                              child: Text(l10n.confirmLabel),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context.router.pop();
                                              },
                                              child: Text(l10n.cancelLabel),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                            return;
                          }
                          log(saveLst.toString());
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: AutoSizeText(l10n.confirmLabel),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
