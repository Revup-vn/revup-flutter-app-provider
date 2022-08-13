import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../../../home.dart';

class HomePrimaryView extends StatelessWidget {
  const HomePrimaryView({
    super.key,
    required this.user,
  });
  final AppUser user;

  @override
  Widget build(BuildContext context) {
    // TODO(tcmhoang): Intl this page
    final l10n = context.l10n;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                '${l10n.hiLabel}, ${user.firstName}${user.lastName}',
                style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold) ??
                    const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                    child: Icon(
                      const IconData(
                        0xe3ab,
                        fontFamily: 'MaterialIcons',
                      ),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  AutoSizeText(
                    user.addr,
                    style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  AutoSizeText(
                    l10n.operationStatusLabel,
                    style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: 10),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) => state.map(
                      initial: (_) => FlutterSwitch(
                        value: user.maybeMap(
                          provider: (value) {
                            final tmp = value.online;
                            log(tmp.toString());
                            return tmp;
                          },
                          orElse: () => false,
                        ),
                        width: 45,
                        height: 25,
                        activeColor: Theme.of(context).colorScheme.primary,
                        inactiveColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        onToggle: (value) {
                          context.read<HomeBloc>().add(
                                HomeEvent.changeActiveStatus(
                                  status: value,
                                  providerID: user.uuid,
                                ),
                              );
                        },
                      ),
                      loading: (_) => const Loading(),
                      changeActiveStatusSuccess: (data) => FlutterSwitch(
                        value: data.status,
                        width: 45,
                        height: 25,
                        activeColor: Theme.of(context).colorScheme.primary,
                        inactiveColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        onToggle: (value) {
                          context.read<HomeBloc>().add(
                                HomeEvent.changeActiveStatus(
                                  status: value,
                                  providerID: data.user.uuid,
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              AutoSizeText(
                l10n.recentOrdersLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                height: 140,
                color: Theme.of(context).colorScheme.inverseSurface,
                alignment: Alignment.center, // where to position the child
              ),
              const SizedBox(height: 32),
              AutoSizeText(
                l10n.weatherLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                height: 140,
                color: Theme.of(context).colorScheme.tertiary,
                alignment: Alignment.center, // where to position the child
              ),
              const SizedBox(height: 32),
              AutoSizeText(
                l10n.serviceAccountLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                height: 140,
                color: Theme.of(context).colorScheme.outline,
                alignment: Alignment.center, // where to position the child
              ),
            ],
          ),
        ),
      ),
    );
  }
}
