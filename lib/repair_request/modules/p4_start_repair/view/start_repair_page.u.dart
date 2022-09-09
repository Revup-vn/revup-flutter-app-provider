import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../shared/utils/utils_function.dart';
import '../../../models/pending_service_model.dart';
import '../bloc/start_repair_bloc.dart';
import 'start_repair_view.u.dart';

class StartRepairPage extends StatelessWidget {
  const StartRepairPage({
    super.key,
    required this.consumer,
    required this.recordId,
    required this.distance,
    required this.pendingService,
    required this.pendingAmount,
  });
  final AppUser consumer;
  final String recordId;
  final double distance;
  final IList<PendingServiceModel> pendingService;
  final int pendingAmount;

  @override
  Widget build(BuildContext context) {
    final sr = context.read<StoreRepository>();
    final paymentService =
        sr.repairPaymentRepo(RepairRecordDummy.dummyStarted(recordId));
    final user = getUser(context.read<AuthenticateBloc>().state)
        .getOrElse(() => throw NullThrownError());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => StartRepairBloc(
            recordId,
            context.read(),
            context.read(),
            paymentService,
            user,
            context.read(),
          ),
        ),
      ],
      child: InfoRequestView(
        consumer: consumer,
        distance: distance,
        pendingService: pendingService,
        pendingAmount: pendingAmount,
        userRepos: context.read(),
        user: user,
      ),
    );
  }
}
