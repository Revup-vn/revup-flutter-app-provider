import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notification_provider_bloc.dart';
import 'notification_provider_view.u.dart';

class NotificationProviderPage extends StatelessWidget {
  const NotificationProviderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationProviderBloc()
        ..add(
          const NotificationProviderEvent.started(),
        ),
      child: const NotificationProviderView(),
    );
  }
}
