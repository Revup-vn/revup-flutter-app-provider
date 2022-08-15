import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../bloc/list_service_bloc.dart';
import 'list_service_builder.u.dart';

class ListServicePage extends StatelessWidget {
  const ListServicePage(this.providerID, {super.key});
  final String providerID;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            context.l10n.serviceAccountLabel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // TODO(namngoc231): cancel
              },
              child: Text(context.l10n.addLabel),
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => ListServiceBloc(
            providerID,
            context.read(),
            context.read(),
          ),
          child: const ListServiceBuilder(),
        ),
      );
}
