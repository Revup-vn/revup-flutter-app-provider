import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:revup_core/core.dart';

import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';
import '../../router/router.dart';
import '../bloc/login_bloc.dart';
import 'login_sso_item.u.dart';

class LoginView extends StatelessWidget {
  LoginView({
    super.key,
  });
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (context.loaderOverlay.visible) {
      context.loaderOverlay.hide();
    }

    return LoaderOverlay(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 350,
                child: Assets.screens.logoTrans.svg(),
              ),
              AutoSizeText(
                l10n.loginPageTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              AutoSizeText(
                l10n.loginPageLabel,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FormBuilderTextField(
                      name: 'phone',
                      decoration: InputDecoration(
                        prefixIcon: Ink(
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Assets.screens.flagVietNam.svg(),
                                const SizedBox(width: 8),
                                const FittedBox(
                                  child: AutoSizeText('+84'),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                        hintText: l10n.phoneFieldLabel,
                      ),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: l10n.phoneRequiredErrorLabel,
                        ),
                        FormBuilderValidators.match(
                          r'^0?(3|5|7|8|9){1}([0-9]{8})$',
                          errorText: l10n.invalidPhoneNumberLabel,
                        ),
                      ]),
                      onChanged: (phoneNumber) {
                        if (phoneNumber?.isEmpty ?? true) return;
                        final isValid =
                            _formKey.currentState?.validate() ?? false;
                        context.read<LoginBloc>().add(
                              LoginEvent.start(
                                isLoginButtonEnabled: isValid,
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.caption,
                        children: [
                          TextSpan(
                            text: l10n.acceptPolicyLabel,
                          ),
                          TextSpan(
                            text: l10n.privacyLabel,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            // TODO(cantgim): implement regconizer
                          ),
                          TextSpan(
                            text: l10n.andLabel,
                          ),
                          TextSpan(
                            text: l10n.termLabel,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            // TODO(cantgim): implement regconizer
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    BlocSelector<LoginBloc, LoginState, bool>(
                      selector: (state) => state.maybeMap(
                        initial: (value) => value.isLoginButtonEnabled,
                        ready: (value) => value.isLoginButtonEnabled,
                        orElse: () => false,
                      ),
                      builder: (bloccontext, state) => ElevatedButton(
                        onPressed: state
                            ? () {
                                context.loaderOverlay.show();
                                _formKey.currentState?.saveAndValidate();
                                var phoneNumber = _formKey
                                        .currentState?.value['phone']
                                        .toString() ??
                                    '';
                                if (phoneNumber.substring(0, 3) == '+84') {
                                  phoneNumber = phoneNumber.substring(
                                    3,
                                    phoneNumber.length,
                                  );
                                }
                                if (phoneNumber.substring(0, 1) == '0') {
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
                                          final completer =
                                              Completer<AppUser>();
                                          await context.router.push(
                                            SignupRoute(
                                              completer: completer,
                                              phoneNumber:
                                                  user.phoneNumber ?? '',
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
                            : null,
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: AutoSizeText(l10n.continueLabel),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  AutoSizeText(l10n.loginBySSOLabel),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginSsoItem(
                    ssoIcon: Assets.screens.facebookOriginal.svg(),
                    // TODO(wamynobe): display toast
                  ),
                  const SizedBox(width: 56),
                  LoginSsoItem(
                    ssoIcon: Assets.screens.googleOriginal.svg(),
                    onPressed: () {
                      context.loaderOverlay.show();
                      context.read<AuthenticateBloc>().add(
                        AuthenticateEvent.loginWithGoogle(
                          onCompleteSignUp: (user) async {
                            final completer = Completer<AppUser>();
                            if (user.phoneNumber == null ||
                                user.phoneNumber == '') {
                              await context.router.push(
                                LoginEnterPhoneRoute(
                                  completer: completer,
                                  email: user.email ?? '',
                                  phoneNumber: user.phoneNumber ?? '',
                                  photoURL: user.photoURL ?? '',
                                  uid: user.uid,
                                ),
                              );
                            } else {
                              completer.complete(
                                AppUser.consumer(
                                  uuid: user.uid,
                                  firstName: '',
                                  lastName: '',
                                  phone: user.phoneNumber ?? '',
                                  dob: DateTime.now(),
                                  addr: '',
                                  email: user.email ?? '',
                                  active: true,
                                  avatarUrl: user.photoURL ?? '',
                                  createdTime: DateTime.now(),
                                  lastUpdatedTime: DateTime.now(),
                                  vac: VideoCallAccount(
                                    email: user.email ?? '',
                                    id: user.uid,
                                    username: user.phoneNumber ?? '',
                                    pwd: 'DEFAULT_PASS',
                                  ),
                                ),
                              );
                            }

                            return completer.future;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
