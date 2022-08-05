import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/select_option_complete_bloc.dart';
import 'select_option_complete_view.u.dart';

class SelectOptionCompletePage extends StatelessWidget {
  const SelectOptionCompletePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectOptionCompleteBloc()
        ..add(
          const SelectOptionCompleteEvent.started(),
        ),
      child: const SelectOptionCompleteView(),
    );
  }
}
