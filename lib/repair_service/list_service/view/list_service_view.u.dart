import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../widgets/card_service.u.dart';
import '../widgets/vehicle_type_item.u.dart';

class ListServiceView extends StatelessWidget {
  const ListServiceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(tcmhoang): Intl this file and parametalized
    // all the harded code value

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Dịch vụ của tôi',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              // TODO(namngoc231): cancel
            },
            child: const Text('Thêm mới'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    VehicleTypeItem(
                      vehicleName: 'Xe máy',
                      iconVehicle: Icon(
                        Icons.motorcycle,
                        size: 20,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      callback: () {
                        // TODO(namngoc231): list service motobike
                      },
                    ),
                    VehicleTypeItem(
                      vehicleName: 'Ô tô',
                      iconVehicle: Icon(
                        Icons.local_taxi,
                        size: 20,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      callback: () {
                        // TODO(namngoc231): list service car
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CartServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Thay lốp',
                priceRange: '100.000đ - 300.000đ',
              ),
              CartServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Thay lốp',
                priceRange: '100.000đ - 300.000đ',
              ),
              CartServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Thay lốp',
                priceRange: '100.000đ - 300.000đ',
              ),
              CartServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Thay lốp',
                priceRange: '100.000đ - 300.000đ',
              ),
              CartServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Thay lốp',
                priceRange: '100.000đ - 300.000đ',
              ),
              CartServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Thay lốp',
                priceRange: '100.000đ - 300.000đ',
              ),
              CartServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Thay lốp',
                priceRange: '100.000đ - 300.000đ',
              ),
              CartServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Thay lốp',
                priceRange: '100.000đ - 300.000đ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
