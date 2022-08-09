import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../../l10n/l10n.dart';
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
    final l10n = context.l10n;
    const nameService = 'Thay lốp';
    const priceRangeStart = '100.000';
    const priceRangeEnd = '300.000';

    // TODO(tcmhoang): change this asset to a more general image
    // and Use `Assets` class instead of using a path
    const image = '';

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          l10n.serviceAccountLabel,
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
            child: Text(l10n.addLabel),
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
                      vehicleName: l10n.motorcycleLabel,
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
                      vehicleName: l10n.carLabel,
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
                  image,
                  height: 50,
                  width: 50,
                ),
                serviceName: nameService,
                priceRange: '$priceRangeStartđ - $priceRangeEndđ',
              ),
              CartServiceReview(
                img: Image.asset(
                  image,
                  height: 50,
                  width: 50,
                ),
                serviceName: nameService,
                priceRange: '$priceRangeStartđ - $priceRangeEndđ',
              ),
              CartServiceReview(
                img: Image.asset(
                  image,
                  height: 50,
                  width: 50,
                ),
                serviceName: nameService,
                priceRange: '$priceRangeStartđ - $priceRangeEndđ',
              ),
              CartServiceReview(
                img: Image.asset(
                  image,
                  height: 50,
                  width: 50,
                ),
                serviceName: nameService,
                priceRange: '$priceRangeStartđ - $priceRangeEndđ',
              ),
              CartServiceReview(
                img: Image.asset(
                  image,
                  height: 50,
                  width: 50,
                ),
                serviceName: nameService,
                priceRange: '$priceRangeStartđ - $priceRangeEndđ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
