import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/common_service_bloc.dart';
import '../cubit/common_service_cubit.dart';
import 'common_service_view.dart';

class CommonServicePage extends StatelessWidget {
  const CommonServicePage(this.providerID, this.sortType, {super.key});
  final String providerID;
  final int sortType;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CommonServiceBloc(
            providerID,
            sortType,
            context.read(),
            context.read(),
            context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => CommonServiceCubit(context.read()),
        ),
      ],
      child: CommonServiceView(),
    );
  }
}
