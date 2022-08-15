import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widgets/loading.u.dart';
import '../bloc/list_service_bloc.dart';
import 'list_service_view.u.dart';

class ListServiceBuilder extends StatelessWidget {
  const ListServiceBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<ListServiceBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<ListServiceBloc>()
                .add(const ListServiceEvent.started());
          },
          orElse: () => false,
        );

    return BlocBuilder<ListServiceBloc, ListServiceState>(
      builder: (context, state) => state.when(
        failure: Loading.new,
        loading: Loading.new,
        initial: Container.new,
        loadDataSuccess: (data, sortType) => ListServiceView(
          data: data,
          sortType: sortType,
        ),
      ),
    );
  }
}
