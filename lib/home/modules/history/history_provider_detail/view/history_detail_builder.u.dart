import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/widgets/loading.u.dart';
import '../bloc/history_detail_bloc.u.dart';
import 'history_detail_view.u.dart';

class HistoryDetailBuilder extends StatelessWidget {
  const HistoryDetailBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<HistoryProviderDetailBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<HistoryProviderDetailBloc>()
                .add(const HistoryProviderDetailEvent.started());
          },
          orElse: () => false,
        );
    return BlocBuilder<HistoryProviderDetailBloc, HistoryProviderDetailState>(
      builder: (context, state) => state.maybeWhen(
        orElse: Container.new,
        loading: Loading.new,
        success: (model, rid) => HistoryProviderDetailView(
          data: model,
          rid: rid,
        ),
      ),
    );
  }
}
