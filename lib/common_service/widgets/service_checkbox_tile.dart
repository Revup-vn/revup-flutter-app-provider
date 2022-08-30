import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../router/router.dart';
import '../../shared/shared.dart';
import '../models/commonservice.dart';

class ServiceCheckboxTile extends StatefulWidget {
  const ServiceCheckboxTile({
    super.key,
    required this.serviceData,
    this.onTap,
    required this.index,
    required this.providerId,
    required this.field,
    required this.formField,
  });
  final CommonService serviceData;
  final VoidCallback? onTap;
  final int index;
  final String providerId;
  final FormFieldState<List<CommonService>> field;
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
            leading: SizedBox(
              height: 48,
              width: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: CachedNetworkImage(
                  imageUrl: widget.serviceData.sImg.isEmpty
                      ? kFallbackServiceImg
                      : widget.serviceData.sImg,
                  height: 64,
                  width: 64,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: FormBuilderTextField(
              enabled: !isChecked,
              name: widget.serviceData.sName,
              initialValue: widget.serviceData.sName,
            ),
            subtitle: FormBuilderTextField(
              enabled: !isChecked,
              name: 'fee${widget.serviceData.sName}',
              initialValue: widget.serviceData.sFee.toString(),
            ),
            trailing: Checkbox(
              checkColor: Theme.of(context).colorScheme.onPrimary,
              activeColor: Theme.of(context).colorScheme.primary,
              value: isChecked,
              onChanged: (bool? value) async {
                if (widget.formField.currentState?.saveAndValidate() == true &&
                    widget.formField.currentState != null) {
                  final fieldData = widget.formField.currentState?.value;
                  if (value != null) {
                    setState(() {
                      isChecked = value;
                    });
                  }
                  if (value ?? false) {
                    final completer = Completer<List<RepairProduct>>();
                    await context.router.push(
                      CommonProductRoute(
                        products: widget.serviceData.products,
                        complete: completer,
                      ),
                    );
                    final res = await completer.future;

                    if (res.isNotEmpty) {
                      (widget.field.value)?.add(
                        CommonService(
                          sName:
                              fieldData?[widget.serviceData.sName].toString() ??
                                  '',
                          sFee: int.parse(
                            fieldData?['fee${widget.serviceData.sName}']
                                    .toString() ??
                                '0',
                          ),
                          sImg: widget.serviceData.sImg,
                          products: res,
                        ),
                      );
                    } else {
                      setState(() {
                        isChecked = false;
                      });
                    }
                  } else {
                    widget.field.value?.removeWhere(
                      (element) =>
                          element.sName ==
                          fieldData?[widget.serviceData.sName].toString(),
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
