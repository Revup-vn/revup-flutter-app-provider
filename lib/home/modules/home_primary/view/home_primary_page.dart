import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/models/models.dart';
import '../bloc/home_bloc.dart';
import 'home_primary_view.u.dart';

class HomePrimaryPage extends StatelessWidget {
  const HomePrimaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc()..add(const HomeEvent.started()),
        ),
      ],
      child: HomePrimaryView(
        user: UserModel(
          name: 'name',
          email: 'email',
          phone: 'phone',
          date: DateTime.now(),
          address: 'address',
          urlImage: 'urlImage',
          onlineStatus: true,
        ),
      ),
    );
  }
}
