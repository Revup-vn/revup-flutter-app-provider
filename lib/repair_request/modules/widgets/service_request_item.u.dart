import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../models/pending_service_model.dart';

class ServiceRequestItem extends StatelessWidget {
  const ServiceRequestItem({
    super.key,
    required this.pendingService,
  });

  final List<PendingServiceModel> pendingService;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final excludeTransFee =
        pendingService.where((e) => e.name != 'transFee').toList();
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
        ...List.generate(
          excludeTransFee.length,
          (index) => SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoSizeText(
                  excludeTransFee[index].name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                AutoSizeText(
                  context.formatMoney(excludeTransFee[index].price),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
