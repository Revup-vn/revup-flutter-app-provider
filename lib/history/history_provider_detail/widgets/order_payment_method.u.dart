import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../../l10n/l10n.dart';

class OrderPaymentItem extends StatelessWidget {
  const OrderPaymentItem({
    super.key,
    required this.paymentMethod,
  });

  final String paymentMethod;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                  child: Icon(
                    Icons.payment,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                AutoSizeText(
                  l10n.paymentMethodLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ) ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: <Widget>[
                Column(
                  children: [
                    AutoSizeText(
                      paymentMethod,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
