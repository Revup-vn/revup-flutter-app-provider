import 'package:flutter/material.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../../new_request/models/pending_repair_request.dart';
import '../../../models/pending_service_model.dart';
import '../cubit/p10_quote_price_cubit.dart';
import '../cubit/total_amount_cubit.dart';
import 'p10_quote_price_view.dart';

class P10QuotePricePage extends StatelessWidget {
  const P10QuotePricePage({
    super.key,
    required this.record,
    required this.pendingService,
    required this.pendingAmount,
  });
  final PendingRepairRequest record;
  final IList<PendingServiceModel> pendingService;
  final int pendingAmount;
  @override
  Widget build(BuildContext context) {
    final sr = context.read<StoreRepository>();
    final paymentService =
        sr.repairPaymentRepo(RepairRecordDummy.dummyStarted(record.id));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => P10QuotePriceCubit(
            paymentService,
            record,
            pendingService,
            pendingAmount,
          )..watch(),
        ),
        BlocProvider(
          create: (_) => TotalAmountCubit(
            pendingService.isEmpty
                ? 0
                : pendingService.map((e) => e.price).toList().reduce(
                      (value, element) => value + element,
                    ),
          ),
        ),
      ],
      child: const Scaffold(
        body: P10QuotePriceView(),
      ),
    );
  }
}
