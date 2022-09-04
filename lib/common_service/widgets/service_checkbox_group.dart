import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

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
    return FormBuilderField<
        List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>>(
      initialValue:
          <Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>[]
              .toList(),
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
