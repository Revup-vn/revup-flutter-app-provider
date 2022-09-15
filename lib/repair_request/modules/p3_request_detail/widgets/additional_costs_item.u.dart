import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../models/pending_service_model.dart';

class AdditionalCoststItem extends StatelessWidget {
  const AdditionalCoststItem({
    super.key,
    required this.transFee,
  });
  final PendingServiceModel transFee;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                l10n.additionalCostsLabel,
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
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  l10n.transitFeeLabel,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              AutoSizeText(
                context.formatMoney(transFee.price),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                width: 2,
              ),
              AutoSizeText(
                transFee.status == 'pending'
                    ? context.l10n.pendingLabel
                    : context.l10n.paidLabel,
                maxFontSize: 12,
                minFontSize: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
