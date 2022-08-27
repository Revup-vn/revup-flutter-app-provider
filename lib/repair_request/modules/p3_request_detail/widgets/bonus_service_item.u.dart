import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';
import '../../../models/need_to_verify_model.dart';

class BonusServicetItem extends StatelessWidget {
  const BonusServicetItem({
    super.key,
    required this.needToVerify,
  });

  final List<NeedToVerifyModel> needToVerify;
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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: needToVerify.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AutoSizeText(
                    needToVerify[index].serviceName,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  AutoSizeText(
                    l10n.needPriceQuotationLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
