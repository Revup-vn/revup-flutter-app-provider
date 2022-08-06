import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/info_request_bloc.dart';
import 'info_request_view.u.dart';

class InfoRequestPage extends StatelessWidget {
  const InfoRequestPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InfoRequestBloc()
        ..add(
          const InfoRequestEvent.started(),
        ),
      child: const InfoRequestView(),
    );
  }
}
