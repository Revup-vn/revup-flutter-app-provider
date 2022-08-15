import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';
import 'paid_service_item.u.dart';
import 'service_request_item.u.dart';
import 'total_service_price_item.u.dart';

class RecordDetail extends StatelessWidget {
  const RecordDetail({
    super.key,
    required this.title,
    required this.unpaidServices,
    required this.paidServices,
  });

  final String title;
  final List<PendingServiceModel> unpaidServices;
  final List<PaidServicesModel> paidServices;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        children: <Widget>[
                          AutoSizeText(
                            title,
                            style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold) ??
                                const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ServiceRequestItem(requests: unpaidServices),
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
                    PaidServiceItem(bonuses: paidServices),
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
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TotalServicePriceItem(
                  pendingAmount: -paidServices
                          .map((e) => e.price)
                          .toList()
                          .reduce((value, element) => value + element) +
                      unpaidServices
                          .map((e) => e.price)
                          .reduce((value, element) => value + element),
                ),
              ],
            ),
          ),
        ],
      );
}
