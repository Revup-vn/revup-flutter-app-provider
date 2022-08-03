import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/repair_completed_bloc.dart';
import 'repair_completed_view.u.dart';

class RepairCompeletePage extends StatelessWidget {
  const RepairCompeletePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RepairCompletedBloc()
        ..add(
          const RepairCompletedEvent.started(),
        ),
      child: const RepairCompeleteView(),
    );
  }
}
