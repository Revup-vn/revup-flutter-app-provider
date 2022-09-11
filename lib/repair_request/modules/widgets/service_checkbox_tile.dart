import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../router/router.dart';
import '../../models/service_data.dart';

class ServiceCheckboxTile extends StatefulWidget {
  const ServiceCheckboxTile({
    super.key,
    required this.serviceData,
    this.onTap,
    required this.index,
    required this.field,
    required this.canSelect,
    required this.recordId,
  });
  final ServiceData serviceData;
  final VoidCallback? onTap;
  final bool canSelect;
  final int index;
  final FormFieldState<List<ServiceData>> field;
  final String recordId;

  @override
  State<ServiceCheckboxTile> createState() => _ServiceCheckboxTileState();
}

class _ServiceCheckboxTileState extends State<ServiceCheckboxTile> {
  bool? isChecked;
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
                  imageUrl: widget.serviceData.imageURL,
                  errorWidget: (context, url, dynamic error) =>
                      Assets.screens.setting.svg(
                    fit: BoxFit.fill,
                    height: 64,
                    width: 64,
                  ),
                  height: 64,
                  width: 64,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  widget.serviceData.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  context.formatMoney(
                    widget.serviceData.serviceFee +
                        (widget.serviceData.products.isEmpty
                            ? 0
                            : widget.serviceData.products.fold(
                                0,
                                (p, e) => p + e.unitPrice * e.quantity,
                              )),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  '''${l10n.productLabel}: ${widget.serviceData.products.isEmpty ? l10n.noneLabel : ('${widget.serviceData.products.first.name} x ${widget.serviceData.products.first.quantity}')}''',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            trailing: Checkbox(
              checkColor: Theme.of(context).colorScheme.onPrimary,
              activeColor: Theme.of(context).colorScheme.primary,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });

                if (value ?? false) {
                  (widget.field.value)?.add(widget.serviceData);
                } else {
                  widget.field.value?.remove(widget.serviceData);
                }
                log('FORM :: ${widget.field.value.toString()}');
              },
            ),
          ),
          if (widget.canSelect && (isChecked ?? false))
            TextButton(
              onPressed: () async {
                await context.router.push(
                  ChooseProductRoute(
                    serviceData: widget.serviceData,
                    recordId: widget.recordId,
                  ),
                );
              },
              child: AutoSizeText(maxLines: 1, l10n.selectProductLabel),
            ),
        ],
      ),
    );
  }
}
