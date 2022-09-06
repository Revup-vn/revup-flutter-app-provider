import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../../../router/router.dart';
import '../../../shared/widgets/custom_dialog.dart';
import '../../../shared/widgets/loading.u.dart';
import '../bloc/list_service_bloc.dart';
import 'list_service_view.u.dart';

class ListServiceBuilder extends StatelessWidget {
  const ListServiceBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<ListServiceBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<ListServiceBloc>()
                .add(const ListServiceEvent.started());
          },
          orElse: () => false,
        );

    return BlocConsumer<ListServiceBloc, ListServiceState>(
      listener: (context, state) => state.maybeWhen(
        empty: (data, sortType, providerID) {
          showDialog<String>(
            context: context,
            builder: (context) {
              return SimpleDialogCustom(
                height: 150,
                content: [
                  Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  AutoSizeText(
                    context.l10n.noServiceLabel,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    context.l10n.addCommonServiceQuestionLabel,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                    maxLines: 1,
                  ),
                ],
                button: [
                  TextButton(
                    onPressed: () async {
                      await context.router.pop();
                      await context.router.push(
                        CommonServiceRoute(
                          providerID: providerID,
                          sortType: sortType,
                        ),
                      );
                    },
                    child: AutoSizeText(
                      context.l10n.yesLabel,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: AutoSizeText(
                      context.l10n.cancelLabel,
                    ),
                  ),
                ],
              );
            },
          );
          return true;
        },
        orElse: () => false,
      ),
      builder: (context, state) => state.when(
        empty: (data, sortType, providerID) => ListServiceView(
          data: data,
          sortType: sortType,
          providerID: providerID,
        ),
        failure: Loading.new,
        loading: Loading.new,
        initial: Container.new,
        loadDataSuccess: (data, sortType, providerID) => ListServiceView(
          data: data,
          sortType: sortType,
          providerID: providerID,
        ),
      ),
    );
  }
}
