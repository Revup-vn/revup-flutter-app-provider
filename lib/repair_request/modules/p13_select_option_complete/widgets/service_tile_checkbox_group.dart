import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

import '../../../models/models.dart';

class ServiceTileCheckBoxGroup extends StatelessWidget {
  const ServiceTileCheckBoxGroup({super.key, required this.services});

  final List<PendingServiceModel> services;

  @override
  Widget build(BuildContext context) =>
      FormBuilderField<List<PendingServiceModel>>(
        name: 'data',
        builder: (FormFieldState<List<PendingServiceModel>> field) =>
            ListView.builder(
          shrinkWrap: true,
          itemCount: services.length,
          itemBuilder: (context, index) => SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AutoSizeText(
                  services[index].name,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                AutoSizeText(
                  context.formatMoney(services[index].price),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Checkbox(
                  value: false,
                  onChanged: (b) => field.didChange(
                    b ?? false
                        ? ((field.value ?? [])..add(services[index]))
                        : field.value
                      ?..remove(services[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
