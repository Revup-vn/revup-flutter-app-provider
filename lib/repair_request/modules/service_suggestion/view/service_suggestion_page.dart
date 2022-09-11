import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/service_suggestion_bloc.dart';
import 'service_suggestion_view.dart';

class ServiceSuggestionPage extends StatelessWidget {
  const ServiceSuggestionPage({
    super.key,
    required this.recordId,
  });
  final String recordId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ServiceSuggestionBloc(recordId, context.read(), context.read()),
      child: ServiceSuggestionView(
        form: GlobalKey(),
        recordId: recordId,
      ),
    );
  }
}
