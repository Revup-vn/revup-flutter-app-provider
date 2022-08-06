import 'package:flutter/material.dart';

import '../../../../../shared/models/models.dart';
import '../models/history_detail_model.dart';
import '../models/order_detail_model.dart';
import 'history_detail_provider_view.u.dart';

class HistoryProviderDetailPage extends StatelessWidget {
  const HistoryProviderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HistoryProviderDetailView(
      data: HistoryDetailModel(
        isComplete: true,
        orderNumber: '',
        serviceStartBooking: DateTime.now(),
        serviceEndBooking: DateTime.now(),
        orderDetailModel: const OrderDetailModel(
          address: '',
          feeTransport: 0,
          intoMoney: 0,
          nameVehicleType: '',
          serviceName: '',
          totalServiceFee: 0,
          vehicleType: '',
        ),
        paymentMethod: PaymentMethod.Zalo,
        rating: 0,
        feedback: '',
        consumer: UserModel(
          address: '',
          date: DateTime.now(),
          email: '',
          name: '',
          phone: '',
          urlImage: '',
          onlineStatus: true,
        ),
      ),
    );
  }
}
