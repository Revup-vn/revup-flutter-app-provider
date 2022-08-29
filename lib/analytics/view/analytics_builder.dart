import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/loading.u.dart';
import '../bloc/analytics_bloc.dart';
import 'analytics_view.dart';

class AnalyticsBuilder extends StatelessWidget {
  const AnalyticsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<AnalyticsBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<AnalyticsBloc>()
                .add(const AnalyticsEvent.started());
          },
          orElse: () => false,
        );
    return BlocBuilder<AnalyticsBloc, AnalyticsState>(
      builder: (context, state) => state.when(
        initial: Container.new,
        loading: Loading.new,
        failure: Container.new,
        loadDataSuccess: AnalyticsView.new,
      ),
    );
  }
}
