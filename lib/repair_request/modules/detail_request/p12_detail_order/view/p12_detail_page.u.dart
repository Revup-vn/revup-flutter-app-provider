import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../bloc/p12_detail_bloc.dart';
import 'p12_detail_view.u.dart';

class P12DetailPage extends StatelessWidget {
  const P12DetailPage({
    super.key,
    // required this.recordId,
  });

  final String recordId = '101f54f8-994c-4610-a68e-747e5e9916d2';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => P12DetailBloc(
        context
            .read<StoreRepository>()
            .repairPaymentRepo(RepairRecordDummy.dummyStarted(recordId)),
        recordId,
        context.read(),
      ),
      child: P12DetailView(id: recordId),
    );
  }
}
