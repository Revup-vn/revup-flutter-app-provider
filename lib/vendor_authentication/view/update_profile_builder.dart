import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../../shared/widgets/loading.u.dart';
import '../bloc/profile_bloc.dart';
import 'update_profile_view.dart';

class UpdateProfileBuilder extends StatelessWidget {
  const UpdateProfileBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<ProfileBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<ProfileBloc>()
                .add(const ProfileEvent.started());
          },
          orElse: () => false,
        );
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) => state.maybeWhen(
        orElse: () => false,
        success: (user) {
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
            context.router.popUntil(
              (route) => count++ >= 1,
            );
          });
        },
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
                            Icons.cancel_outlined,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          AutoSizeText(
                            context.l10n.updateProfileFail,
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
            context.router.popUntil(
              (route) => count++ >= 2,
            );
          });
        },
      ),
      builder: (context, state) => state.when(
        success: UpdateProfileView.new,
        failure: Container.new,
        initial: Container.new,
        loadDataSuccess: UpdateProfileView.new,
        loading: () => const Loading(),
      ),
    );
  }
}
