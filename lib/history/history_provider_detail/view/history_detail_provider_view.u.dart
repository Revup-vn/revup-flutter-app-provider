import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../../l10n/l10n.dart';
import '../models/history_detail_model.dart';
import '../widgets/order_details.u.dart';
import '../widgets/order_feedback.u.dart';
import '../widgets/order_payment_method.u.dart';
import '../widgets/order_service_information.u.dart';
import '../widgets/order_status.u.dart';

class HistoryProviderDetailView extends StatelessWidget {
  const HistoryProviderDetailView({super.key, required this.data});
  final HistoryDetailModel data;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          l10n.orderInformationLabel,
          style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold) ??
              const TextStyle(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (data.isComplete == true) ...[
                    OrderStatusItem(
                      orderNumber: data.orderNumber,
                      orderStatusNotification: l10n.completedOrderLabel,
                      textStyleNotification: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ) ??
                          TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                      iconOrder: Icon(
                        Icons.inventory_outlined,
                        size: 30,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      serviceStartBooking: data.serviceStartBooking,
                      serviceEndBooking: data.serviceEndBooking,
                    ),
                  ] else ...[
                    OrderStatusItem(
                      orderNumber: data.orderNumber,
                      orderStatusNotification: l10n.cancelOrderLabel,
                      textStyleNotification:
                          Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ) ??
                              TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                      iconOrder: Icon(
                        Icons.inventory_outlined,
                        size: 30,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      serviceStartBooking: data.serviceStartBooking,
                      serviceEndBooking: data.serviceEndBooking,
                    ),
                  ],
                  const Divider(
                    height: 1,
                    thickness: 10,
                  ),
                  OrderDetailsItem(
                    data: data.orderDetailModel,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 10,
                  ),
                  OrderServiceInformationItem(user: data.consumer),
                  const Divider(
                    height: 1,
                    thickness: 10,
                  ),
                  OrderPaymentItem(
                    paymentMethod: data.paymentMethod.toString(),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 10,
                  ),
                  if (data.isComplete)
                    OrderFeedbackItem(
                      rating: data.rating.toDouble(),
                      feedback: data.feedback,
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: ElevatedButton(
                onPressed: () {
                  // TODO(namngoc231): Contact repair service
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: AutoSizeText(
                  l10n.contactRepairServiceLabel,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
