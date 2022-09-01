import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/history_detail_bloc.u.dart';
import 'history_detail_builder.u.dart';

class HistoryProviderDetailPage extends StatelessWidget {
  const HistoryProviderDetailPage(this.rpID, {super.key});
  final String rpID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryProviderDetailBloc(
        rpID,
        context.read(),
        context.read(),
        context.read(),
      ),
      child: const HistoryDetailBuilder(),
    );
  }
}
