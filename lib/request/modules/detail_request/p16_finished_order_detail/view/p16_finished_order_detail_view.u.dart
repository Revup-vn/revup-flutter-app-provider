import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../l10n/l10n.dart';
import '../../widgets/record_detail.dart';
import '../bloc/p16_finished_order_detail_bloc.dart';

class P16FinishedOrderDetail extends StatelessWidget {
  const P16FinishedOrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;

    context
        .read<P16FinishedOrderDetailBloc>()
        .add(const P16FinishedOrderDetailEvent.populateData());
    //TODO(tcmhoang): Intl and test UI

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () => context.router.popUntil((_) => true),
        ),
      ),
      body: context.watch<P16FinishedOrderDetailBloc>().state.when(
            loadSuccess: (unpaid, paid) => RecordDetail(
              title: 'Chi tiet don hang',
              // TODO(tcmhoang): Intl this
              unpaidServices: unpaid,
              paidServices: paid,
            ),
            initial: Container.new,
          ),
    );
  }
}
