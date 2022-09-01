import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../../../../l10n/l10n.dart';
import '../models/order_detail_model.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({
    super.key,
    required this.data,
  });

  final OrderDetailModel data;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 30,
                child: Icon(
                  const IconData(
                    0xee4b,
                    fontFamily: 'MaterialIcons',
                  ),
                  size: 30,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: AutoSizeText(
                  l10n.orderDetailLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ) ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          AutoSizeText(
            '${l10n.serviceLabel} :',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => AutoSizeText(
                data.serviceName[index],
                style: Theme.of(context).textTheme.labelLarge,
              ),
              itemCount: data.serviceName.length,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          AutoSizeText(
            '${l10n.addressLabel} ${data.address}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 6,
          ),
          AutoSizeText(
            '''${l10n.vehicleTypeLabel}${data.vehicleType == 0 ? l10n.motorcycleLabel : l10n.carLabel}''',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 6,
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    l10n.totalServiceFeeLabel,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onInverseSurface,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  AutoSizeText(
                    l10n.feeTransportLabel,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  AutoSizeText(
                    l10n.intoMoneyLabel,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    context.formatMoney(data.totalServiceFee),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  AutoSizeText(
                    context.formatMoney(data.feeTransport),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  AutoSizeText(
                    context
                        .formatMoney(data.feeTransport + data.totalServiceFee),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
