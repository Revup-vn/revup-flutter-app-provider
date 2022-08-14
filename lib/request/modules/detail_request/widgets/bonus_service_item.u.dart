import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:revup_core/core.dart';

import '../../../../../l10n/l10n.dart';
import '../../../models/models.dart';

class BonusServiceItem extends StatelessWidget {
  const BonusServiceItem({
    super.key,
    required this.bonuses,
  });

  final List<PaidServicesModel> bonuses;

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
                l10n.bonusServicesLabel,
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
          bonuses.length,
          (index) => SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoSizeText(
                  bonuses[index].name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                AutoSizeText(
                  context.formatMoney(bonuses[index].price),
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
