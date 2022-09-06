import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../shared/widgets/custom_dialog.dart';
import '../bloc/home_bloc.dart';
import '../cubit/home_primary_cubit.dart';
import 'home_primary_view.u.dart';

class HomePrimaryPage extends StatelessWidget {
  const HomePrimaryPage(this.user, {super.key});
  final AppUser user;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final maybeUser = await _getUser(user.uuid, context.read());
      if (maybeUser.maybeMap(
        orElse: () => false,
        provider: (value) => value.needToUpdateInfo,
      )) {
        unawaited(_showdialog(context));
      }
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(
            context.read(),
            user,
          ),
        ),
        BlocProvider(
          create: (context) => HomePrimaryCubit(
            context.read(),
            user.uuid,
            context.read(),
            context.read(),
          ),
          child: Container(),
        )
      ],
      child: HomePrimaryView(
        user: user,
      ),
    );
  }

  Future<AppUser> _getUser(String uID, IStore<AppUser> userRepos) async {
    return (await userRepos.get(uID)).getOrElse(() => throw NullThrownError());
  }

  Future<void> _showdialog(BuildContext context) async {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (context) => SimpleDialogCustom(
        height: 250,
        content: [
          AutoSizeText(
            context.l10n.needToUpdateInfoLabel,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          AutoSizeText(
            context.l10n.needToUpdateInfoDesLabel,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
        button: [
          TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: AutoSizeText(
              context.l10n.understoodLabel,
            ),
          ),
        ],
      ),
    );
  }
}
