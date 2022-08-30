import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../models/commonservice.dart';
import 'service_checkbox_tile.dart';

class ServiceCheckboxGroup extends StatelessWidget {
  const ServiceCheckboxGroup({
    super.key,
    required this.serviceList,
    required this.providerId,
    required this.formKey,
  });
  final List<CommonService> serviceList;
  final String providerId;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final lst = <CommonService>[];

    return FormBuilderField<List<CommonService>>(
      initialValue: <CommonService>[].toList(),
      name: 'data',
      builder: (field) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: serviceList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ServiceCheckboxTile(
            onTap: () {},
            serviceData: serviceList[index],
            index: index,
            providerId: providerId,
            field: field,
            formField: formKey,
          );
        },
      ),
    );
  }
}
