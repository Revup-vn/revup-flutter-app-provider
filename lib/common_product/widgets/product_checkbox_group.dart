import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

import 'product_checkbox_tile.dart';

class ProductCheckboxGroup extends StatelessWidget {
  const ProductCheckboxGroup({
    super.key,
    required this.serviceList,
    required this.formField,
  });
  final List<RepairProduct> serviceList;
  final GlobalKey<FormBuilderState> formField;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<Tuple2<RepairProduct, File>>>(
      initialValue: <Tuple2<RepairProduct, File>>[].toList(),
      name: 'product',
      builder: (field) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: serviceList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductCheckboxTile(
            onTap: () {},
            serviceData: serviceList[index],
            index: index,
            field: field,
            formField: formField,
          );
        },
      ),
    );
  }
}
