import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../shared/shared.dart';
import '../../shared/widgets/custom_dialog.dart';
import '../../shared/widgets/loading.u.dart';
import '../bloc/common_service_bloc.dart';
import '../models/commonservice.dart';
import '../widgets/service_checkbox_group.dart';

class CommonServiceView extends StatelessWidget {
  CommonServiceView({super.key});
  final form = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    context.watch<CommonServiceBloc>().state.maybeWhen(
          initial: () => context
              .read<CommonServiceBloc>()
              .add(const CommonServiceEvent.started()),
          orElse: () => null,
        );
    final l10n = context.l10n;

    return BlocConsumer<CommonServiceBloc, CommonServiceState>(
      listener: (context, state) => state.whenOrNull(
        submitSuccess: () {
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
                      height: 150,
                      child: Column(
                        children: [
                          Icon(
                            Icons.done,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                          AutoSizeText(
                            context.l10n.doneLabel,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          return Future.delayed(const Duration(seconds: 3), () {
            var count = 0;
            context.router.popUntil((_) => count++ == 2);
          });
        },
        failure: (errorMessage) {
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
                      height: 150,
                      child: Column(
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          AutoSizeText(
                            errorMessage == 'duplicate'
                                ? context.l10n.duplicateNameSvLabel
                                : context.l10n.failLabel,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
          return Future.delayed(const Duration(seconds: 3), () {
            var count = 0;
            context.router.popUntil((_) => count++ == 2);
          });
        },
      ),
      builder: (context, state) {
        return DismissKeyboard(
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: AutoSizeText(
                  l10n.addCommonLabel,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              body: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      children: [
                        state.when(
                          initial: Container.new,
                          loading: Loading.new,
                          failure: (message) => Container(),
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
                        onPressed: () async {
                          final bloc = context.read<CommonServiceBloc>();
                          form.currentState?.save();
                          final saveLst =
                              form.currentState?.value['data'] != null
                                  ? form.currentState?.value['data'] as List<
                                      Tuple3<
                                          CommonService,
                                          List<Tuple2<RepairProduct, File>>,
                                          File>>
                                  : nil<
                                          Tuple3<
                                              CommonService,
                                              List<Tuple2<RepairProduct, File>>,
                                              File>>()
                                      .toList();

                          if (saveLst.isEmpty) {
                            await showDialog<String>(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return SimpleDialogCustom(
                                  height: 150,
                                  content: [
                                    AutoSizeText(
                                      l10n.chooseNoService,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    AutoSizeText(
                                      context.l10n.sureLabel,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                  button: [
                                    TextButton(
                                      onPressed: () {
                                        var count = 0;
                                        context.router.popUntil(
                                          (route) => count++ == 2,
                                        );
                                      },
                                      child: Text(l10n.yesLabel),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.router.pop();
                                      },
                                      child: Text(l10n.cancelLabel),
                                    )
                                  ],
                                );
                              },
                            );
                            return;
                          }

                          bloc.add(
                            CommonServiceEvent.submited(
                              saveList: saveLst,
                            ),
                          );
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
