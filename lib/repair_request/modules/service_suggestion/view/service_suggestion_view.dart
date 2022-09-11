import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../../../../shared/widgets/unknown_failure.dart';
import '../../../models/service_data.dart';
import '../../widgets/service_checkbox_group.dart';
import '../bloc/service_suggestion_bloc.dart';

class ServiceSuggestionView extends StatelessWidget {
  const ServiceSuggestionView({
    super.key,
    required this.form,
    required this.recordId,
  });
  final GlobalKey<FormBuilderState> form;
  final String recordId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final blocPage = context.read<ServiceSuggestionBloc>();
    return BlocBuilder<ServiceSuggestionBloc, ServiceSuggestionState>(
      builder: (context, state) {
        return state.when(
            initial: Container.new,
            loading: Loading.new,
            failure: UnknownFailure.new,
            success: (repairService) {
              return Scaffold(
                appBar: AppBar(
                  title: AutoSizeText(l10n.addServiceAppBarTitle),
                  centerTitle: false,
                ),
                body: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 50),
                      child: Column(
                        children: [
                          Expanded(
                            child: FormBuilder(
                              key: form,
                              child: ServiceCheckboxGroup(
                                serviceList: repairService,
                                recordId: recordId,
                                form: form,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: repairService.isEmpty
                              ? null
                              : () {
                                  // get value from form
                                  form.currentState?.save();
                                  final completedLst = form.currentState
                                      ?.value['data'] as List<ServiceData>;

                                  if (completedLst.isEmpty) {
                                    context.router.pop();
                                  } else {
                                    context.read<ServiceSuggestionBloc>().add(
                                          ServiceSuggestionEvent
                                              .selectProductCompleted(
                                            onRoute: () => context.router.pop(),
                                            saveLst: completedLst,
                                            recordId: recordId,
                                          ),
                                        );
                                  }
                                },
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: AutoSizeText(l10n.confirmLabel),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
