import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';

import '../../../../../l10n/l10n.dart';

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem({
    super.key,
    required this.orderNumber,
    required this.orderStatusNotification,
    required this.textStyleNotification,
    required this.iconOrder,
    required this.serviceStartBooking,
    required this.serviceEndBooking,
  });
  final String orderNumber;
  final String orderStatusNotification;
  final TextStyle textStyleNotification;
  final Icon iconOrder;
  final DateTime serviceStartBooking;
  final DateTime serviceEndBooking;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // TODO(tcmhoang): Get datformat from LanguageCubit
    final formatterDate = DateFormat('dd/MM/yyyy hh:mm');

    return Container(
      height: 170,
      color: Theme.of(context).colorScheme.onInverseSurface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  l10n.codeOrderLabel + orderNumber,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ) ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AutoSizeText(
                    orderStatusNotification,
                    style: textStyleNotification,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 1,
                  width: 20,
                ),
                iconOrder,
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AutoSizeText(
                    l10n.timeBookingLabel,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                  width: 20,
                ),
                Expanded(
                  child: AutoSizeText(
                    textAlign: TextAlign.end,
                    formatterDate.format(serviceStartBooking),
                    softWrap: true,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AutoSizeText(
                    l10n.timeCancelLabel,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                  width: 20,
                ),
                Expanded(
                  child: AutoSizeText(
                    textAlign: TextAlign.end,
                    formatterDate.format(serviceStartBooking),
                    softWrap: true,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
