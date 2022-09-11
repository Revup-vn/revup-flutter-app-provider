import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../models/service_data.dart';
import 'service_checkbox_tile.dart';

class ServiceCheckboxGroup extends StatelessWidget {
  const ServiceCheckboxGroup({
    super.key,
    required this.serviceList,
    required this.recordId,
    required this.form,
  });
  final List<ServiceData> serviceList;
  final GlobalKey<FormBuilderState> form;
  final String recordId;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<ServiceData>>(
      initialValue: [],
      name: 'data',
      builder: (field) {
        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 70),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          itemCount: serviceList.length,
          itemBuilder: (context, index) {
            return ServiceCheckboxTile(
              key: UniqueKey(),
              serviceData: serviceList[index],
              canSelect: true,
              index: index,
              field: field,
              recordId: recordId,
            );
          },
        );
      },
    );
  }
}
