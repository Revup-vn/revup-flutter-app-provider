import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/l10n.dart';
import '../../../router/router.dart';
import '../bloc/detail_service_bloc.dart';
import 'detail_service_builder.u.dart';

class DetailServicePage extends StatelessWidget {
  const DetailServicePage(
    this.providerID,
    this.serviceName,
    this.category, {
    super.key,
  });
  final String providerID;
  final String serviceName;
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailServiceBloc(
        providerID,
        context.read(),
        context.read(),
        category,
        serviceName,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            context.l10n.serviceDetailsAppBarTitle,
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
                context.router.push(
                  UpdateServiceRoute(
                    providerID: providerID,
                    category: category,
                    sName: serviceName,
                  ),
                );
              },
              child: Text(context.l10n.editProfileLabel),
            ),
          ],
        ),
        body: DetailServiceBuilder(providerID),
      ),
    );
  }
}
