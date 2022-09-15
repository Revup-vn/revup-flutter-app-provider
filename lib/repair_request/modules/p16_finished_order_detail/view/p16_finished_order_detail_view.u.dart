import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../l10n/l10n.dart';
import '../../widgets/record_detail.dart';
import '../bloc/p16_finished_order_detail_bloc.dart';

class P16FinishedOrderDetail extends StatelessWidget {
  const P16FinishedOrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    context
        .read<P16FinishedOrderDetailBloc>()
        .add(const P16FinishedOrderDetailEvent.populateData());

    return Scaffold(
      appBar: AppBar(),
      body: context.watch<P16FinishedOrderDetailBloc>().state.when(
            loadSuccess: (services, transFee) {
              return RecordDetail(
                title: l10n.orderDetailLabel,
                serviceList: services,
              );
            },
            initial: Container.new,
          ),
    );
  }
}
