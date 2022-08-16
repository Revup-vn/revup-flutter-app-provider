import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../models/pending_service_model.dart';

class ServiceRequestItem extends StatelessWidget {
  const ServiceRequestItem({
    super.key,
    required this.pendingService,
  });

  final IList<PendingServiceModel> pendingService;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final services = pendingService.toList();
    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                l10n.serviceRequestLabel,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ) ??
                    TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AutoSizeText(
                    services[index].name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  AutoSizeText(
                    context.formatMoney(services[index].price),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
