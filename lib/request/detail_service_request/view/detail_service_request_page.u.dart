import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail_service_request_bloc.u.dart';
import 'detail_service_request_view.u.dart';

class DetailServiceRequestPage extends StatelessWidget {
  const DetailServiceRequestPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailServiceRequestBloc()
        ..add(
          const DetailServiceRequestEvent.started(),
        ),
      child: const DetailServiceRequestView(),
    );
  }
}
