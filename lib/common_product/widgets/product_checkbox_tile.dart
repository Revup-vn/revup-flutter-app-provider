import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../shared/shared.dart';

class ServiceCheckboxTile extends StatefulWidget {
  const ServiceCheckboxTile({
    super.key,
    required this.serviceData,
    this.onTap,
    required this.index,
    required this.field,
    required this.formField,
  });
  final RepairProduct serviceData;
  final VoidCallback? onTap;
  final int index;
  final FormFieldState<List<RepairProduct>> field;
  final GlobalKey<FormBuilderState> formField;

  @override
  State<ServiceCheckboxTile> createState() => _ServiceCheckboxTileState();
}

class _ServiceCheckboxTileState extends State<ServiceCheckboxTile> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Card(
      elevation: 0,
      child: Column(
        children: [
          ListTile(
            onTap: widget.onTap,
            leading: SizedBox(
              height: 48,
              width: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: CachedNetworkImage(
                  imageUrl: widget.serviceData.img.isEmpty
                      ? kFallbackServiceImg
                      : widget.serviceData.img,
                  height: 64,
                  width: 64,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: FormBuilderTextField(
              enabled: !isChecked,
              name: widget.serviceData.name,
              initialValue: widget.serviceData.name,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderTextField(
                  name: 'price${widget.serviceData.name}',
                  initialValue: widget.serviceData.price.toString(),
                ),
                FormBuilderTextField(
                  name: 'des${widget.serviceData.name}',
                  initialValue: widget.serviceData.desc,
                ),
              ],
            ),
            trailing: Checkbox(
              checkColor: Theme.of(context).colorScheme.onPrimary,
              activeColor: Theme.of(context).colorScheme.primary,
              value: isChecked,
              onChanged: (bool? value) async {
                if (widget.formField.currentState != null &&
                    widget.formField.currentState?.saveAndValidate() == true) {
                  final fieldData = widget.formField.currentState?.value;
                  if (value != null) {
                    setState(() {
                      isChecked = value;
                    });
                  }

                  if (value ?? false) {
                    (widget.field.value)?.add(
                      RepairProduct(
                        name: fieldData?[widget.serviceData.name].toString() ??
                            '',
                        desc: fieldData?['desc${widget.serviceData.name}']
                                .toString() ??
                            '',
                        img: widget.serviceData.img,
                        price: int.parse(
                          fieldData?['price${widget.serviceData.name}']
                                  .toString() ??
                              '0',
                        ),
                      ),
                    );
                  } else {
                    widget.field.value?.removeWhere(
                      (element) =>
                          element.name ==
                          fieldData?[widget.serviceData.name].toString(),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
