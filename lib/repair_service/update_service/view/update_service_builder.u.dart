import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/widgets/loading.u.dart';
import '../bloc/update_service_bloc.dart';
import 'update_service_view.u.dart';

class UpdateServiceBuilder extends StatelessWidget {
  const UpdateServiceBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<UpdateServiceBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<UpdateServiceBloc>()
                .add(const UpdateServiceEvent.started());
          },
          orElse: () => false,
        );
    return BlocConsumer<UpdateServiceBloc, UpdateServiceState>(
      builder: (context, state) => state.maybeWhen(
        orElse: Container.new,
        loadDataSuccess: UpdateServiceView.new,
        loading: Loading.new,
      ),
      listener: (context, state) => state.maybeWhen(
        failure: () {
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
                          Icon(
                            Icons.cancel_presentation,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          AutoSizeText(
                            context.l10n.failLabel,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.error,
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
        sumbitSuccess: () {
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
        deleteSuccess: () {
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
            context.router.popUntil((_) => count++ == 3);
          });
        },
        orElse: () => false,
      ),
    );
  }
}
