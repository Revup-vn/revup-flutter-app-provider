import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../l10n/l10n.dart';
import '../bloc/list_service_bloc.dart';
import '../models/service_model.dart';
import '../widgets/card_service.u.dart';
import '../widgets/vehicle_type_item.u.dart';

class ListServiceView extends StatelessWidget {
  const ListServiceView({
    required this.data,
    required this.sortType,
    super.key,
  });
  final IList<ServiceModel> data;
  final int sortType;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final listService = data.toList();

    return SingleChildScrollView(
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
                      if (sortType != 0) {
                        context.read<ListServiceBloc>().add(
                              const ListServiceEvent.sortTypeChanged(
                                sortType: 0,
                              ),
                            );
                      }
                    },
                    sorted: sortType == 0,
                  ),
                  VehicleTypeItem(
                    vehicleName: l10n.carLabel,
                    iconVehicle: Icon(
                      Icons.local_taxi,
                      size: 20,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    callback: () {
                      if (sortType != 1) {
                        context.read<ListServiceBloc>().add(
                              const ListServiceEvent.sortTypeChanged(
                                sortType: 1,
                              ),
                            );
                      }
                    },
                    sorted: sortType == 1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              itemCount: listService.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => CartServiceReview(
                imgUrl: listService[index].imageUrl,
                serviceName: listService[index].serviceName,
                priceRange: context.formatMoney(
                  int.parse(listService[index].price),
                ),
                callback: () {
                  //TODO: route to detail service
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
