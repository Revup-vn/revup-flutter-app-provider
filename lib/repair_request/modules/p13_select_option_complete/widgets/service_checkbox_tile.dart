import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:revup_core/core.dart';

import '../../../models/pending_service_model.dart';

class ServiceCheckboxTile extends StatefulWidget {
  const ServiceCheckboxTile({
    super.key,
    required this.pendingService,
    required this.field,
  });
  final PendingServiceModel pendingService;
  final FormFieldState<List<PendingServiceModel>> field;
  @override
  State<ServiceCheckboxTile> createState() => _ServiceCheckboxTileState();
}

class _ServiceCheckboxTileState extends State<ServiceCheckboxTile> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                widget.pendingService.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Row(
                children: [
                  AutoSizeText(
                    context.formatMoney(widget.pendingService.price),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (b) {
                      setState(() {
                        isChecked = b;
                      });

                      if (b ?? false) {
                        (widget.field.value)?.add(widget.pendingService);
                      } else {
                        widget.field.value?.remove(widget.pendingService);
                      }

                      // widget.field.didChange(
                      // );
                    },
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
