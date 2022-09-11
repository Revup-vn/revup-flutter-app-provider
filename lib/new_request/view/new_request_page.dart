import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../map/location/bloc/location_bloc.dart';
import '../../repair_request/modules/p4_info_request/cubit/realtime_location_cubit.dart';
import '../../shared/utils/utils_function.dart';
import '../bloc/new_request_bloc.dart';
import 'new_request_view.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({
    super.key,
    required this.recordId,
  });
  final String recordId;

  @override
  Widget build(BuildContext context) {
    final user = getUser(context.read<AuthenticateBloc>().state)
        .getOrElse(() => throw NullThrownError());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => RealtimeLocationCubit(
            context.read(),
            user,
          ),
        ),
        BlocProvider(
          create: (context) => NewRequestBloc(
            context.read(),
            context.read(),
            context.read(),
            recordId,
            user.uuid,
          ),
        ),
      ],
      child: const NewRequestView(),
    );
  }
}
