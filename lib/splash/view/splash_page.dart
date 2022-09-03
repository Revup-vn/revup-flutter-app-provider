import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:revup_core/core.dart';

import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';
import '../../router/router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().addForegroundListener((p0) {
      final type = p0.payload.type;
      switch (type) {
        case NotificationType.ConsumerRequestRepair:
          final recordId = p0.payload.payload['recordId'] as String;
          context.router.push(
            NewRequestRoute(
              recordId: recordId,
            ),
          );
          break;

        case NotificationType.NormalMessage:
          final subType = p0.payload.payload['subType'] as String;
          if (subType == 'accepted') {
            final recordId = p0.payload.payload['recordId'] as String;
            context.router.push(
              P12DetailRoute(recordId: recordId),
            );
          } else if (subType == 'ConsumerCanceled') {
            showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(context.l10n.consumerAbortLabel),
                actions: [
                  TextButton(
                    onPressed: () => context.router.pop(),
                    child: Text(context.l10n.confirmLabel),
                  ),
                ],
              ),
            ).then((_) => context.router
                .popUntil((route) => route.settings.name == HomeRoute.name));
          } else {
            break;
          }
          break;
        case NotificationType.ProviderDecline:
          context
              .showToast<void>(context.l10n.userDismissed)
              .then(
                (_) => context.read<IStore<AppUser>>().updateFields(
                      AppUserDummy.dummyProvider(
                        context.read<AuthenticateBloc>().state.maybeMap(
                              orElse: () => throw NullThrownError(),
                              authenticated: (value) =>
                                  value.authType.user.uuid,
                            ),
                      ).maybeMap(
                        orElse: () => throw NullThrownError(),
                        provider: (p) => p.copyWith(
                          online: true,
                        ),
                      ),
                      cons(AppUserDummy.field(AppUserFields.Online), nil()),
                    ),
              )
              .then((value) => context.router.popUntilRoot());
          break;

        // ignore: no_default_cases
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(
      const Duration(seconds: 5),
      () {
        final authBloc = context.read<AuthenticateBloc>();
        authBloc.state.maybeMap(
          failure: (_) {
            authBloc.add(const AuthenticateEvent.reset());

            return unit;
          },
          loading: (_) {
            authBloc.add(const AuthenticateEvent.reset());

            return unit;
          },
          orElse: () => unit,
        );
        final notifyCubit = context.read<NotificationCubit>();
        final sr = context.read<StoreRepository>();
        authBloc.state.maybeWhen(
          authenticated: (authType) async {
            await notifyCubit.requirePermission();
            await notifyCubit.registerDevice();

            final token = notifyCubit.state.maybeWhen(
              registered: (token) => token,
              failToRegister: () => '',
              orElse: () => throw NullThrownError(),
            );
            final _iuntr = sr.userNotificationTokenRepo(
              AppUserDummy.dummyConsumer(authType.user.uuid),
            );
            await _iuntr.create(
              Token(
                created: DateTime.now(),
                platform: Platform.operatingSystem,
                token: token,
              ),
            );
          },
          orElse: () => false,
        );
        context.router.pushAndPopUntil(
          authBloc.state.maybeWhen(
            empty: (isFirstTime) => const LoginRoute(),
            authenticated: (type) {
              Hive.openBox<dynamic>('authType').then(
                (value) {
                  value.put(
                    'auth',
                    type.map(
                      google: (value) =>
                          AuthType.google(user: value.user).toJson(),
                      phone: (value) =>
                          AuthType.phone(user: value.user).toJson(),
                      email: (value) =>
                          AuthType.email(user: value.user).toJson(),
                    ),
                  );
                },
              );

              return HomeRoute(user: type.user);
            },
            orElse: LoginRoute.new,
          ),
          predicate: (_) => true,
        );
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 3, child: Assets.screens.welcome.svg()),
            const Flexible(
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
