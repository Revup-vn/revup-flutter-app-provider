import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../bloc/select_option_complete_bloc.dart';

class SelectOptionCompleteView extends StatelessWidget {
  const SelectOptionCompleteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

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
              // TODO(namngoc231): next
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
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AutoSizeText(
                          l10n.serviceRequestLabel,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  BlocBuilder<SelectOptionCompleteBloc,
                      SelectOptionCompleteState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const Text('Empty'),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        failure: () => const Text('Failed'),
                        success: (selectOptionCompleteModel) =>
                            ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: selectOptionCompleteModel
                              .requestServiceModel.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AutoSizeText(
                                    selectOptionCompleteModel
                                        .requestServiceModel
                                        .elementAt(index)
                                        .name,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  AutoSizeText(
                                    '''${selectOptionCompleteModel.requestServiceModel.elementAt(index).price}Đ''',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Checkbox(value: false, onChanged: (value) {})
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AutoSizeText(
                          l10n.bonusServicesLabel,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  BlocBuilder<SelectOptionCompleteBloc,
                      SelectOptionCompleteState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const Text('Empty'),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        failure: () => const Text('Failed'),
                        success: (selectOptionCompleteModel) =>
                            ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: selectOptionCompleteModel
                              .bonusServicesModel.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AutoSizeText(
                                    selectOptionCompleteModel.bonusServicesModel
                                        .elementAt(index)
                                        .name,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  AutoSizeText(
                                    '''${selectOptionCompleteModel.bonusServicesModel.elementAt(index).price}Đ''',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  Checkbox(value: false, onChanged: (value) {})
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
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
