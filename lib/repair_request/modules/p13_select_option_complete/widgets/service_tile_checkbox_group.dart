import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../models/models.dart';
import 'service_checkbox_tile.dart';

class ServiceTileCheckBoxGroup extends StatelessWidget {
  const ServiceTileCheckBoxGroup({super.key, required this.services});

  final List<PendingServiceModel> services;

  @override
  Widget build(BuildContext context) {
    final lst = <PendingServiceModel>[];
    return FormBuilderField<List<PendingServiceModel>>(
      initialValue: lst,
      name: 'data',
      builder: (FormFieldState<List<PendingServiceModel>> field) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: services.length,
          itemBuilder: (context, index) => SizedBox(
            height: 50,
            child: ServiceCheckboxTile(
              pendingService: services[index],
              field: field,
            ),
          ),
        );
      },
    );
  }
}
