import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../new_request/models/pending_repair_request.dart';
import '../../../../models/pending_service_model.dart';
import '../cubit/p10_quote_price_cubit.dart';
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
    return BlocProvider(
      create: (context) => P10QuotePriceCubit(
        context.read(),
        context.read(),
        paymentService,
        record,
        pendingService,
        pendingAmount,
      )..watch(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () => context
                  .read<P10QuotePriceCubit>()
                  .state
                  .maybeWhen(
                      orElse: () => null,
                      success: (pendingService, needToVerifyService) =>
                          context.read<P10QuotePriceCubit>()
                      // .submit(
                      //       (vehicle) => context.router.push(),
                      //     ),
                      ),
              child: Text(context.l10n.quoteLabel),
            )
          ],
        ),
        body: const P10QuotePriceView(),
      ),
    );
  }
}
