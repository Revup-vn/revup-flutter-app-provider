import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revup_core/core.dart';

import '../../../home.dart';
import 'account_view.u.dart';

class AccountPage extends StatelessWidget {
  const AccountPage(this.user, {super.key});
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(
        user.uuid,
        context.read(),
        context.read(),
        context.read(),
        ImagePicker(),
        context.read(),
      ),
      child: const AccountView(),
    );
  }
}
