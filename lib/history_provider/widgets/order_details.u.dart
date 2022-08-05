import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../l10n/l10n.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({
    super.key,
    required this.vehicleType,
    required this.serviceName,
    required this.address,
    required this.nameVehicleType,
    required this.totalServiceFee,
    required this.feeTransport,
    required this.intoMoney,
  });

  final String vehicleType;
  final String serviceName;
  final String address;
  final String nameVehicleType;
  final String totalServiceFee;
  final String feeTransport;
  final String intoMoney;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SizedBox(
      height: 235,
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
                    const IconData(
                      0xee4b,
                      fontFamily: 'MaterialIcons',
                    ),
                    size: 30,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                AutoSizeText(
                  l10n.orderDetailLabel,
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
            AutoSizeText(
              '${l10n.serviceLabel}$vehicleType - $serviceName',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 6,
            ),
            AutoSizeText(
              '${l10n.addressLabel}$address',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 6,
            ),
            AutoSizeText(
              '${l10n.vehicleTypeLabel}$nameVehicleType',
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
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
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
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
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
                      totalServiceFee,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ) ??
                          TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    AutoSizeText(
                      feeTransport,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ) ??
                          TextStyle(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    AutoSizeText(
                      intoMoney,
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
      ),
    );
  }
}
