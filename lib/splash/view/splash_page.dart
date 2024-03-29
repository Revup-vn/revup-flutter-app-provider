import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart' hide NotificationType;
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:revup_core/core.dart';

import '../../configs/video_call_config.dart' as config;
import '../../configs/video_call_config.dart';
import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';
import '../../main_development.dart';
import '../../router/router.dart';
import '../../shared/widgets/custom_dialog.dart';
import '../../video_call/video_call_manager/call_mange.u.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    context.read<NotificationCubit>().addForegroundListener((p0) async {
      final type = p0.payload.type;
      switch (type) {
        case NotificationType.ConsumerRequestRepair:
          final recordId = p0.payload.payload['recordId'] as String;
          await appRouter.push(
            NewRequestRoute(
              recordId: recordId,
            ),
          );

          break;

        case NotificationType.NormalMessage:
          final subType = p0.payload.payload['subType'] as String;
          if (subType == 'accepted') {
            final recordId = p0.payload.payload['recordId'] as String;
            await appRouter.push(
              P12DetailRoute(recordId: recordId),
            );
          } else if (subType == 'ConsumerCanceled') {
            final providerId = p0.payload.payload['providerId'] as String;
            if (providerId.isEmpty) {
              await updateActive(
                context.read<AuthenticateBloc>().state.maybeWhen(
                      orElse: () => '',
                      authenticated: (value) => value.user.uuid,
                    ),
              );
            } else {
              await updateActive(providerId);
            }
            appRouter
                .popUntil((route) => route.settings.name == HomeRoute.name);
            await showDialog<void>(
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
          } else if (subType == 'Canceled') {
            await updateActive(
              context.read<AuthenticateBloc>().state.maybeWhen(
                    orElse: () => '',
                    authenticated: (value) => value.user.uuid,
                  ),
            );
            await showDialog<void>(
              barrierDismissible: false,
              context: context,
              builder: (bcontext) => SimpleDialogCustom(
                height: 200,
                content: [
                  AutoSizeText(
                    context.l10n.cancelByUserLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  AutoSizeText(
                    context.l10n.sorryLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
                button: [
                  TextButton(
                    onPressed: () {
                      if (mounted) {
                        context.router.popUntil(
                          (route) => route.settings.name == HomeRoute.name,
                        );
                      }
                    },
                    child: AutoSizeText(
                      context.l10n.understoodLabel,
                    ),
                  ),
                ],
              ),
            );
          }
          break;
        case NotificationType.ProviderDecline:
          await updateActive(
            context.read<AuthenticateBloc>().state.maybeWhen(
                  orElse: () => '',
                  authenticated: (value) => value.user.uuid,
                ),
          );
          await showDialog<void>(
            context: context,
            builder: (context) => SimpleDialogCustom(
              height: 150,
              content: [Text(context.l10n.userDismissedNoTransFeeLabel)],
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
        init(
          config.APP_ID,
          config.AUTH_KEY,
          config.AUTH_SECRET,
        );
        CallManager.instance.init(context);
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
            await context.router.push(
              const LoginRoute(),
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
                  context.read<GoogleSignIn>().disconnect();
                  context.read<GoogleSignIn>().signOut();
                  context
                      .read<AuthenticateBloc>()
                      .add(AuthenticateEvent.signOut(authType: type));
                  context.router.push(
                    const LoginRoute(),
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
              final userr = CubeUser(
                login: type.user
                    .mapOrNull(
                      provider: (value) => value.vac,
                    )
                    ?.username,
                password: DEFAULT_PASS,
              );
              await createSession(userr).then((suser) async {
                await Hive.openBox<dynamic>('vacID')
                    .then((box) => box.put('id', userr.id));
                final sUser = CubeUser(
                  id: suser.id,
                  login: type.user
                      .mapOrNull(
                        provider: (value) => value.vac,
                      )
                      ?.username,
                  password: DEFAULT_PASS,
                );
                await _loginToCubeChat(context, sUser);
              });
              await context.router.push(
                HomeRoute(user: type.user),
              );
            }
          },
          orElse: () async {
            await context.router.push(
              const LoginRoute(),
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

  Future<void> updateActive(String id) async {
    context.read<IStore<AppUser>>().updateFields(
          AppUserDummy.dummyProvider(id),
          ilist([AppUserDummy.field(AppUserFields.Online)]),
        );
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

  Future<void> _loginToCubeChat(
    BuildContext context,
    CubeUser user,
  ) async {
    await CubeChatConnection.instance.login(user).then(
      (cubeUser) {
        CallManager.instance.init(context);
      },
    ).catchError((dynamic error) async {});
  }
}
