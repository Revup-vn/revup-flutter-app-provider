import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../models/models.dart';
import '../bloc/p16_finished_order_detail_bloc.dart';
import 'p16_finished_order_detail_view.u.dart';

class P16FinishedOrderDetailPage extends StatelessWidget {
  const P16FinishedOrderDetailPage({
    super.key,
    required this.data,
  });

  final Tuple2<List<PendingServiceModel>, List<PaidServicesModel>> data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => P16FinishedOrderDetailBloc(data),
      child: const P16FinishedOrderDetail(),
    );
  }
}
