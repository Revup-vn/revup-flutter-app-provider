import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../bloc/analytics_bloc.dart';
import 'analytics_builder.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage(this.providerID, {super.key});
  final String providerID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalyticsBloc(
        providerID,
        context.read(),
        context.read(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(context.l10n.analyticLabel),
        ),
        body: const AnalyticsBuilder(),
      ),
    );
  }
}
