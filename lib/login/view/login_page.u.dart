import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../router/app_router.gr.dart';
import '../../shared/widgets/internet_availability_page.dart';
import '../bloc/login_bloc.dart';
import '../widgets/login_failure.u.dart';
import 'login_view.u.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthenticateBloc>().state.maybeWhen(
          partial: (appUser) => _onPartialAuth(appUser, context),
          orElse: () => unit,
        );
    log(context.read<ConnectivityBloc>().state.toString());

    return InternetAvailabilityPage(
      child: BlocProvider(
        create: (BuildContext context) => LoginBloc(),
        child: BlocConsumer<AuthenticateBloc, AuthenticateState>(
          listener: (context, state) => state.maybeWhen(
            partial: (au) => _onPartialAuth(au, context),
            failure: (failure) => failure.maybeWhen(
              expiredOTP: (phoneNumber) => _onReverifyOTP(
                phoneNumber,
                context,
                context.l10n.otpCodeExpiredLabel,
              ),
              invalidOTP: (phoneNumber) => _onReverifyOTP(
                phoneNumber,
                context,
                context.l10n.invalidOTPLabel,
              ),
              server: (message) => unit,
              orElse: () => false,
            ),
            authenticated: (authType) {
              authType.user.maybeMap(
                orElse: () {
                  context.loaderOverlay.hide();
                  showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                              ),
                              width: double.infinity,
                              height: 70,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.cancel_outlined,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                  AutoSizeText(
                                    context.l10n.loginFailLabel,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                    maxLines: 1,
                                  ),
                                  AutoSizeText(
                                    context.l10n.loginFailDescLabel,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  Future.delayed(
                    const Duration(seconds: 5),
                    () {
                      context
                          .read<AuthenticateBloc>()
                          .add(AuthenticateEvent.signOut(authType: authType));
                      context.router.pop();
                    },
                  );
                },
                provider: (value) {
                  if (value.active == true) {
                    context.loaderOverlay.hide();
                    showDialog<String>(
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary,
                                    ),
                                    AutoSizeText(
                                      context.l10n.loginSuccessLabel,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onTertiary,
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

                    return Future.delayed(
                      const Duration(seconds: 3),
                      () async {
                        final boxAuthType =
                            await Hive.openBox<dynamic>('authType');
                        await boxAuthType.put(
                          'auth',
                          authType.map(
                            google: (value) =>
                                AuthType.google(user: value.user).toJson(),
                            phone: (value) =>
                                AuthType.phone(user: value.user).toJson(),
                            email: (value) =>
                                AuthType.email(user: value.user).toJson(),
                          ),
                        );

                        await context.router.pushAndPopUntil(
                          HomeRoute(user: authType.user),
                          predicate: (_) => true,
                        );
                      },
                    );
                  } else {
                    context.loaderOverlay.hide();
                    showDialog<String>(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                                width: double.infinity,
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Icon(
                                        Icons.warning,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      ),
                                    ),
                                    AutoSizeText(
                                      context.l10n.accountNotActiveLabel,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                    AutoSizeText(
                                      context.l10n.canLoginLabel,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                    AutoSizeText(
                                      context.l10n.loginFailDescLabel,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: TextButton(
                                  onPressed: () async {
                                    final boxAuthType =
                                        await Hive.openBox<dynamic>('authType');
                                    await boxAuthType.put(
                                      'auth',
                                      authType.map(
                                        google: (value) =>
                                            AuthType.google(user: value.user)
                                                .toJson(),
                                        phone: (value) =>
                                            AuthType.phone(user: value.user)
                                                .toJson(),
                                        email: (value) =>
                                            AuthType.email(user: value.user)
                                                .toJson(),
                                      ),
                                    );

                                    await context.router.pushAndPopUntil(
                                      HomeRoute(user: authType.user),
                                      predicate: (_) => true,
                                    );
                                  },
                                  child: const AutoSizeText('Ok'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              );
            },
            orElse: () => false,
          ),
          builder: (context, state) => state.maybeWhen(
            //authenticated: (authType) => LoginSuccess(type: authType),
            loading: LoginView.new,

            failure: (authFailure) {
              return authFailure.maybeWhen(
                invalidData: (message) => LoginFailure(
                  errorMessage: message ?? context.l10n.unknowIssuesLabel,
                ),
                expiredOTP: (phoneNumber) => const LoginPage(),
                invalidOTP: (phone) => const LoginPage(),
                server: (message) => LoginFailure(
                  errorMessage: message ?? context.l10n.unknowIssuesLabel,
                ),
                orElse: () =>
                    LoginFailure(errorMessage: context.l10n.unknowIssuesLabel),
              );
              // TODO(wamynobe): change general error message
            },
            orElse: LoginView.new,
          ),
        ),
      ),
    );
  }

  Unit _onPartialAuth(AppUser appUser, BuildContext context) {
    var phoneNumber = appUser.phone;
    if (phoneNumber.substring(0, 3) == '+84') {
      phoneNumber = phoneNumber.substring(
        3,
        phoneNumber.length,
      );
    } else if (phoneNumber.substring(0, 1) == '0') {
      phoneNumber = phoneNumber.substring(
        1,
        phoneNumber.length,
      );
    }

    context.read<AuthenticateBloc>().add(
          AuthenticateEvent.loginWithPhone(
            phoneNumber: '+84$phoneNumber',
            onSubmitOTP: () async {
              final completer = Completer<String>();
              await context.router.push(
                OTPRoute(
                  phoneNumber: phoneNumber,
                  completer: completer,
                ),
              );

              return completer.future;
            },
            onSignUpSubmit: (user) async {
              context.loaderOverlay.show();
              final completer = Completer<AppUser>();
              await context.router.push(
                SignupRoute(
                  completer: completer,
                  phoneNumber: user.phoneNumber ?? '',
                  photoURL: user.photoURL ?? '',
                  uid: user.uid,
                  email: user.email ?? '',
                ),
              );

              return completer.future;
            },
          ),
        );

    return unit;
  }

  void _onReverifyOTP(
    String phoneNumber,
    BuildContext context,
    String message,
  ) {
    var phone = phoneNumber;
    if (phone.substring(0, 3) == '+84') {
      phone = phone.substring(
        3,
        phone.length,
      );
    } else if (phone.substring(0, 1) == '0') {
      phone = phone.substring(
        1,
        phone.length,
      );
    }
    context.loaderOverlay.hide();
    showDialog<String>(
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
                      message,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Theme.of(context).colorScheme.inversePrimary,
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    context.read<AuthenticateBloc>().add(
          AuthenticateEvent.loginWithPhone(
            phoneNumber: '+84$phone',
            onSubmitOTP: () async {
              final completer = Completer<String>();

              await context.router.push(
                OTPRoute(
                  phoneNumber: phone,
                  completer: completer,
                ),
              );

              return completer.future;
            },
            onSignUpSubmit: (user) async {
              context.loaderOverlay.show();
              final completer = Completer<AppUser>();
              await context.router.push(
                SignupRoute(
                  completer: completer,
                  phoneNumber: user.phoneNumber ?? '',
                  photoURL: user.photoURL ?? '',
                  uid: user.uid,
                  email: user.email ?? '',
                ),
              );

              return completer.future;
            },
          ),
        );
  }
}
