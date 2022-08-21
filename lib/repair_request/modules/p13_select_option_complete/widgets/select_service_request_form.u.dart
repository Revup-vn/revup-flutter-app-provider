import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../l10n/l10n.dart';
import '../../../models/models.dart';
import 'service_tile_checkbox_group.dart';

class SelectServiceRequestForm extends StatelessWidget {
  const SelectServiceRequestForm({
    super.key,
    required this.services,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;
  final List<PendingServiceModel> services;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                l10n.serviceRequestLabel,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ) ??
                    TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        FormBuilder(
          key: formKey,
          child: ServiceTileCheckBoxGroup(services: services),
        )
      ],
    );
  }
}
