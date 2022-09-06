import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/pending_service_model.dart';
import '../bloc/p16_finished_order_detail_bloc.dart';
import 'p16_finished_order_detail_view.u.dart';

class P16FinishedOrderDetailPage extends StatelessWidget {
  const P16FinishedOrderDetailPage({
    super.key,
    required this.services,
  });

  final List<PendingServiceModel> services;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => P16FinishedOrderDetailBloc(services),
      child: const P16FinishedOrderDetail(),
    );
  }
}
