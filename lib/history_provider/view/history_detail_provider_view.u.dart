import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../widgets/order_details.u.dart';
import '../widgets/order_feedback.u.dart';
import '../widgets/order_payment_method.u.dart';
import '../widgets/order_service_information.u.dart';
import '../widgets/order_status.u.dart';

class HistoryProviderDetailView extends StatelessWidget {
  const HistoryProviderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
// status complete
    const isComplete = true;
//order_status
    const orderNumber = '12345';
    final serviceStartBooking = DateTime.now();
    final serviceEndBooking = DateTime.now();
//order_details
    const vehicleType = 'xe máy';
    const serviceName = 'Thay săm xe';
    const address = 'Đại học FPT,Thạch Thất, Hà Nội';
    const nameVehicleType = 'Honda Wave RSX';
    const totalServiceFee = '80.000đ';
    const feeTransport = '12.000đ';
    const intoMoney = '92.000đ';
//order_service_information
    final user = AppUser.consumer(
      uuid: '1a',
      firstName: 'Nam',
      lastName: 'Ngoc',
      phone: '0866199497',
      dob: DateTime.now(),
      addr: 'Ninh Binh',
      email: 'namngoc231@gmail.com',
      active: true,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
      createdTime: DateTime.now(),
      lastUpdatedTime: DateTime.now(),
      vac: const VideoCallAccount(
        id: '',
        username: '',
        pwd: '',
        email: '',
      ),
    );
//order_payment
    final paymentMethod = l10n.zaloPaymentLabel;
//order_feedback
    const rating = 4.5;
    const feedback =
        '''Thợ sửa rất có tâm, đêm tối đường xa vẫn giúp đỡ mình rất nhiệt tình''';

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
                  if (isComplete == true) ...[
                    OrderStatusItem(
                      orderNumber: orderNumber,
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
                      serviceStartBooking: serviceStartBooking,
                      serviceEndBooking: serviceEndBooking,
                    ),
                  ] else ...[
                    OrderStatusItem(
                      orderNumber: orderNumber,
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
                      serviceStartBooking: serviceStartBooking,
                      serviceEndBooking: serviceEndBooking,
                    ),
                  ],
                  const Divider(
                    height: 1,
                    thickness: 10,
                  ),
                  const OrderDetailsItem(
                    vehicleType: vehicleType,
                    serviceName: serviceName,
                    address: address,
                    nameVehicleType: nameVehicleType,
                    totalServiceFee: totalServiceFee,
                    feeTransport: feeTransport,
                    intoMoney: intoMoney,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 10,
                  ),
                  OrderServiceInformationItem(user: user),
                  const Divider(
                    height: 1,
                    thickness: 10,
                  ),
                  OrderPaymentItem(paymentMethod: paymentMethod),
                  const Divider(
                    height: 1,
                    thickness: 10,
                  ),
                  if (isComplete)
                    const OrderFeedbackItem(
                      rating: rating,
                      feedback: feedback,
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            // bottom: 0,
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
