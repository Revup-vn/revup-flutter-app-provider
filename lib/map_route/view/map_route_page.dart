import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../map/location/bloc/location_bloc.dart';
import '../../repair_request/modules/p4_info_request/cubit/realtime_location_cubit.dart';
import '../../shared/utils/utils_function.dart';
import '../bloc/map_route_bloc.dart';
import 'map_route_view.dart';

class MapRoutePage extends StatelessWidget {
  const MapRoutePage({
    super.key,
    required this.recordId,
    required this.consumerId,
  });
  final String recordId;
  final String consumerId;
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
          create: (context) => MapRouteBloc(
            context.read(),
            context.read(),
            context.read(),
            recordId,
            consumerId,
          ),
        ),
      ],
      child: const MapRouteView(),
    );
  }
}
