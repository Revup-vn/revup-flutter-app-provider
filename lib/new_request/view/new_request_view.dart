import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/new_request_bloc.dart';
import '../widgets/request_details_static.dart';
import '../widgets/request_map_static.dart';

class NewRequestView extends StatelessWidget {
  const NewRequestView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final blocPage = context.watch<NewRequestBloc>();
    blocPage.state.whenOrNull(
      initial: () => blocPage.add(const NewRequestEvent.started()),
    );

    return BlocBuilder<NewRequestBloc, NewRequestState>(
      builder: (context, state) {
        return state.maybeWhen(
          success:
              (directions, fromMaker, toMarker, consumer, record, services) {
            return Stack(
              children: <Widget>[
                RequestMapStatic(
                  directions: directions,
                  fromMaker: fromMaker,
                  toMarker: toMarker,
                  consumer: consumer,
                ),
                RequestDetailsStatic(
                  consumer: consumer,
                  record: record,
                  distance: directions.distance / 1000,
                  services: services,
                ),
              ],
            );
          },
          orElse: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
