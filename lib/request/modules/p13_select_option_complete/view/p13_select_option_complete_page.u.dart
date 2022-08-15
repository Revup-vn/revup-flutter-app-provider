import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../models/models.dart';
import '../cubit/select_options_cubit.dart';
import 'p13_select_option_complete_view.u.dart';

class P13SelectOptionCompletePage extends StatelessWidget {
  const P13SelectOptionCompletePage({
    super.key,
    required this.id,
    required this.paid,
    required this.vehicle,
  });
  final String id;
  final List<PaidServicesModel> paid;
  final String vehicle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectOptionsCubit(
        context
            .read<StoreRepository>()
            .repairPaymentRepo(RepairRecordDummy.dummyStarted(id)),
      ),
      child: P13SelectOptionCompleteView(
        form: GlobalKey(),
        id: id,
        paid: paid,
        vehicle: vehicle,
      ),
    );
  }
}
