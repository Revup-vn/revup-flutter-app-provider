import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../../shared/utils/utils_function.dart';
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
    final l10n = context.l10n;
    final blocPage = context.watch<HomeBloc>();
    blocPage.state.maybeWhen(
      initial: () async {
        final isGranted = await requestUserLocation();
        if (!isGranted) {
          await context.router.push(const PermissionRoute());
        } else {
          final pos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          blocPage
              .add(HomeEvent.started(lat: pos.latitude, lng: pos.longitude));
        }
      },
      orElse: () => false,
    );
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
                  Expanded(
                    flex: 2,
                    child: AutoSizeText(
                      user.addr,
                      style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold) ??
                          const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      l10n.operationStatusLabel,
                      style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold) ??
                          const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                      minFontSize: 5,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) => state.map(
                      initial: (_) => FlutterSwitch(
                        value: user.maybeMap(
                          provider: (value) {
                            return value.online;
                          },
                          orElse: () => false,
                        ),
                        width: 45,
                        height: 25,
                        activeColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        inactiveColor: Theme.of(context).colorScheme.outline,
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
                        activeColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        inactiveColor: Theme.of(context).colorScheme.outline,
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
