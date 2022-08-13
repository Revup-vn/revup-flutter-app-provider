import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../shared/models/models.dart';
import '../bloc/home_bloc.dart';
import 'home_primary_view.u.dart';

class HomePrimaryPage extends StatelessWidget {
  const HomePrimaryPage(this.user, {super.key});
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(
            context.read(),
          ),
        ),
      ],
      child: HomePrimaryView(
        user: user,
      ),
    );
  }
}
