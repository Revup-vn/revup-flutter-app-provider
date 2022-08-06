import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_service_bloc.dart';
import 'add_service_view.u.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddServiceBloc()
        ..add(
          const AddServiceEvent.started(),
        ),
      child: const AddServiceView(),
    );
  }
}
