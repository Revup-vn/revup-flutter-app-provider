import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:revup_core/core.dart';

import '../../../../../l10n/l10n.dart';
import '../../../models/models.dart';

class PaidServiceItem extends StatelessWidget {
  const PaidServiceItem({
    super.key,
    required this.paidService,
  });

  final List<PaidServicesModel> paidService;

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
                // TODO(tcmhoang) : change this to `Paid Services`
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
          paidService.length,
          (index) => SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoSizeText(
                  paidService[index].name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                AutoSizeText(
                  context.formatMoney(paidService[index].price),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}
