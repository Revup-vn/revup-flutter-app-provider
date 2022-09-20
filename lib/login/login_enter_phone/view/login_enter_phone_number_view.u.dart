import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:revup_core/core.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../bloc/login_bloc.dart';

class LoginEnterPhoneView extends StatelessWidget {
  const LoginEnterPhoneView(
    this.completer,
    this.phoneNumber,
    this.photoURL,
    this.uid,
    this.email, {
    super.key,
  });
  final String phoneNumber;
  final String photoURL;
  final String uid;
  final String email;
  final Completer<AppUser> completer;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.loaderOverlay.hide();
            context.router.pop();
            context.read<GoogleSignIn>().disconnect();
            context.read<GoogleSignIn>().signOut();
            context.read<AuthenticateBloc>().add(
                  const AuthenticateEvent.reset(),
                );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              l10n.loginPageTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            AutoSizeText.rich(
              maxLines: 1,
              TextSpan(
                text: l10n.enterPhoneNumberLabel,
                children: [
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
                              var myPhone = _formKey
                                  .currentState?.value['phone']
                                  .toString();
                              if (myPhone?.substring(0, 3) == '+84') {
                                myPhone = myPhone?.substring(
                                  3,
                                  myPhone.length,
                                );
                              }
                              if (myPhone?.substring(0, 1) == '0') {
                                myPhone = myPhone?.substring(
                                  1,
                                  myPhone.length,
                                );
                              }
                              completer.complete(
                                AppUser.consumer(
                                  uuid: uid,
                                  firstName: '',
                                  lastName: '',
                                  phone: myPhone ?? '',
                                  dob: DateTime.now(),
                                  addr: '',
                                  email: email,
                                  active: true,
                                  avatarUrl: photoURL,
                                  createdTime: DateTime.now(),
                                  lastUpdatedTime: DateTime.now(),
                                  vac: VideoCallAccount(
                                    email: email,
                                    id: uid,
                                    username: phoneNumber,
                                  ),
                                  violatedTimes: 0,
                                ),
                              );
                              context.router.pop();
                            }
                          : null,
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: AutoSizeText(l10n.continueLabel),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
