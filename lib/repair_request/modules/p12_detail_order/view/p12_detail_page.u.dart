import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../bloc/p12_detail_bloc.dart';
import '../cubit/quote_price_cubit.dart';
import 'p12_detail_view.u.dart';

class P12DetailPage extends StatelessWidget {
  const P12DetailPage({
    super.key,
    required this.recordId,
  });

  final String recordId;
  @override
  Widget build(BuildContext context) {
    final sr = context.read<StoreRepository>();
    final paymentService =
        sr.repairPaymentRepo(RepairRecordDummy.dummyStarted(recordId));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => P12DetailBloc(
            context
                .read<StoreRepository>()
                .repairPaymentRepo(RepairRecordDummy.dummyStarted(recordId)),
            recordId,
            context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => QuotePriceCubit(paymentService),
        ),
      ],
      child: P12DetailView(id: recordId),
    );
  }
}
