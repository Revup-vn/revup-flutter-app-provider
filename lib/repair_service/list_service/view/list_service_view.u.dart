import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' hide showSearch;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../l10n/l10n.dart';
import '../../../router/router.dart';
import '../../../shared/widgets/custom_dialog.dart';
import '../bloc/list_service_bloc.dart';
import '../models/service_model.dart';
import '../widgets/card_service.u.dart';
import '../widgets/vehicle_type_item.u.dart';

class ListServiceView extends StatelessWidget {
  const ListServiceView({
    required this.data,
    required this.sortType,
    required this.providerID,
    super.key,
  });
  final IList<ServiceModel> data;
  final int sortType;
  final String providerID;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final listService = data.toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 30,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: Row(
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
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (bcontext) {
                                  return SimpleDialogCustom(
                                    height: 150,
                                    content: [
                                      Icon(
                                        Icons.settings,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      ),
                                      AutoSizeText(
                                        context
                                            .l10n.addCommonServiceQuestionLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        maxLines: 1,
                                      ),
                                    ],
                                    button: [
                                      TextButton(
                                        onPressed: () async {
                                          await bcontext.router.pop();
                                          await context.router.push(
                                            CommonServiceRoute(
                                              providerID: providerID,
                                              sortType: sortType,
                                            ),
                                          );
                                        },
                                        child: AutoSizeText(
                                          context.l10n.understoodLabel,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: AutoSizeText(context.l10n.chooseCommonLabel),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listService.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => CartServiceReview(
                isActive: listService[index].isActive,
                imgUrl: listService[index].imageUrl,
                serviceName: listService[index].serviceName,
                priceRange: listService[index].price.split('-').length > 1
                    ? '${context.formatMoney(
                        int.parse(
                          listService[index].price.split('-')[0].trim(),
                        ),
                      )} - ${context.formatMoney(
                        int.parse(
                          listService[index].price.split('-')[1].trim(),
                        ),
                      )}'
                    : context.formatMoney(
                        int.parse(
                          listService[index].price,
                        ),
                      ),
                callback: () {
                  context.router.push(
                    DetailServiceRoute(
                      providerID: providerID,
                      category: sortType == 0 ? 'Xe máy' : 'Oto',
                      serviceName: listService[index].serviceName,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
