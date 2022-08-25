import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../map/location/bloc/location_bloc.dart';
import '../bloc/new_request_bloc.dart';
import 'new_request_view.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({super.key, required this.recordId});
  final String recordId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => NewRequestBloc(
            context.read(),
            context.read(),
            context.read(),
            recordId,
          ),
        ),
      ],
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: NewRequestView(),
      ),
    );
  }
}
