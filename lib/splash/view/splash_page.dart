import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:revup_core/core.dart';

import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';
import '../../main_development.dart';
import '../../router/router.dart';
import '../../shared/widgets/custom_dialog.dart';

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
          appRouter.push(
            NewRequestRoute(
              recordId: recordId,
            ),
          );

          break;

        case NotificationType.NormalMessage:
          final subType = p0.payload.payload['subType'] as String;
          if (subType == 'accepted') {
            final recordId = p0.payload.payload['recordId'] as String;
            appRouter.push(
              P12DetailRoute(recordId: recordId),
            );
          } else if (subType == 'ConsumerCanceled') {
            appRouter
                .popUntil((route) => route.settings.name == HomeRoute.name);
            showDialog<void>(
              context: context,
              builder: (bcontext) => SimpleDialogCustom(
                height: 150,
                content: [Text(context.l10n.userDismissed)],
                button: [
                  TextButton(
                    onPressed: () {
                      bcontext.router.pop();
                    },
                    child: Text(context.l10n.confirmLabel),
                  ),
                ],
              ),
            );
          } else {
            break;
          }
          break;
        case NotificationType.ProviderDecline:
          showDialog<void>(
            context: context,
            builder: (context) => SimpleDialogCustom(
              height: 150,
              content: [Text(context.l10n.userDismissed)],
              button: [
                TextButton(
                  onPressed: () => context.router.pop(),
                  child: Text(context.l10n.confirmLabel),
                ),
              ],
            ),
          )
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
              .then(
                (value) => appRouter
                    .popUntil((route) => route.settings.name == HomeRoute.name),
              );
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
          empty: (isFirstTime) async {
            await context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (_) => false,
            );
          },
          authenticated: (type) async {
            await Hive.openBox<dynamic>('authType').then(
              (value) {
                value.put(
                  'auth',
                  type.map(
                    google: (value) =>
                        AuthType.google(user: value.user).toJson(),
                    phone: (value) => AuthType.phone(user: value.user).toJson(),
                    email: (value) => AuthType.email(user: value.user).toJson(),
                  ),
                );
              },
            );
            if (await _isBanned(type.user.uuid)) {
              final bannedDate = await getBannedDate(type.user.uuid);
              unawaited(
                showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (bcontext) {
                    final formatterDate = DateFormat('dd/MM/yyyy HH:mm');
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                            width: double.infinity,
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  ),
                                  AutoSizeText(
                                    '''
${context.l10n.bannedNotiLabel} ${formatterDate.format(bannedDate)} ${context.l10n.bannedNoti2Label}''',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                    maxLines: 2,
                                  ),
                                  AutoSizeText(
                                    context.l10n.loginFailDescLabel,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
              Future.delayed(
                const Duration(seconds: 5),
                () {
                  context
                      .read<AuthenticateBloc>()
                      .add(AuthenticateEvent.signOut(authType: type));
                  context.router.pushAndPopUntil(
                    const LoginRoute(),
                    predicate: (_) => false,
                  );
                },
              );
            } else {
              await notifyCubit.requirePermission();
              await notifyCubit.registerDevice();

              final token = notifyCubit.state.maybeWhen(
                registered: (token) => token,
                failToRegister: () => '',
                orElse: () => throw NullThrownError(),
              );
              final _iuntr = sr.userNotificationTokenRepo(
                AppUserDummy.dummyConsumer(type.user.uuid),
              );
              await _iuntr.create(
                Token(
                  created: DateTime.now(),
                  platform: Platform.operatingSystem,
                  token: token,
                ),
              );
              await context.router.push(
                HomeRoute(user: type.user),
              );
            }
          },
          orElse: () async {
            await context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (_) => false,
            );
          },
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

  Future<bool> _isBanned(String id) async {
    final value = (await context.read<IStore<AppUser>>().get(id))
        .getOrElse(() => throw NullThrownError())
        .mapOrNull(
          provider: (value) => value,
        );

    if ((value!.inactiveTo != null &&
            (value.inactiveTo!.compareTo(DateTime.now()) < 0 == true)) ||
        (value.inactiveTo == null)) {
      return false;
    } else {
      return true;
    }
  }

  Future<DateTime> getBannedDate(String id) async {
    final value = (await context.read<IStore<AppUser>>().get(id))
        .getOrElse(() => throw NullThrownError())
        .mapOrNull(
          provider: (value) => value,
        );

    if ((value!.inactiveTo != null &&
            (value.inactiveTo!.compareTo(DateTime.now()) < 0 == true)) ||
        (value.inactiveTo == null)) {
      return DateTime.now();
    } else {
      return value.inactiveTo!;
    }
  }
}
