import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../shared/shared.dart';
import '../cubit/product_cubit.dart';

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
  final FormFieldState<List<Tuple2<RepairProduct, File>>> field;
  final GlobalKey<FormBuilderState> formField;

  @override
  State<ServiceCheckboxTile> createState() => _ServiceCheckboxTileState();
}

class _ServiceCheckboxTileState extends State<ServiceCheckboxTile> {
  bool isChecked = false;
  bool isOnlineImg = true;
  File img = File('');
  @override
  void initState() {
    super.initState();
    isChecked = false;
    isOnlineImg = true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<ProductCubit>();
    return Card(
      child: Column(
        children: [
          ListTile(
            onTap: widget.onTap,
            leading: SizedBox(
              height: 48,
              width: 48,
              child: InkWell(
                onTap: !isChecked
                    ? () async {
                        final completer = Completer<File>();
                        _showModalButtonSheet(context, completer);
                        final res = await completer.future;
                        setState(() {
                          img = res;
                          isOnlineImg = false;
                        });
                      }
                    : null,
                child: isOnlineImg
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(48),
                        child: CachedNetworkImage(
                          imageUrl: widget.serviceData.img.isEmpty
                              ? kFallbackServiceImg
                              : widget.serviceData.img,
                          height: 64,
                          width: 64,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Image.file(img, fit: BoxFit.fill),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderTextField(
                  enabled: !isChecked,
                  name: widget.serviceData.name,
                  initialValue: widget.serviceData.name,
                  decoration: InputDecoration(
                    labelText: l10n.productName,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  enabled: !isChecked,
                  name: 'price${widget.serviceData.name}',
                  initialValue: widget.serviceData.price.toString(),
                  decoration: InputDecoration(
                    labelText: l10n.productPriceLabel,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    suffixText: l10n.moneyUnit,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  maxLength: 100,
                  maxLines: 5,
                  enabled: !isChecked,
                  name: 'des${widget.serviceData.name}',
                  initialValue: widget.serviceData.desc,
                  decoration: InputDecoration(
                    labelText: l10n.serviceDescriptionLabel,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
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
                      tuple2(
                        RepairProduct(
                          name:
                              fieldData?[widget.serviceData.name].toString() ??
                                  '',
                          desc: fieldData?['des${widget.serviceData.name}']
                                  .toString() ??
                              '',
                          img: widget.serviceData.img,
                          price: int.parse(
                            fieldData?['price${widget.serviceData.name}']
                                    .toString() ??
                                '0',
                          ),
                        ),
                        img,
                      ),
                    );
                  } else {
                    widget.field.value?.removeWhere(
                      (element) =>
                          element.value1.name ==
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

  void _showModalButtonSheet(
    BuildContext context,
    Completer<File> completer,
  ) {
    showMaterialModalBottomSheet<Widget>(
      context: context,
      builder: (context) => SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: AutoSizeText(context.l10n.imageFromGalleryLabel),
              leading: const Icon(Icons.photo_library_rounded),
              onTap: () async {
                final res = await addImg(ImageSource.gallery, ImagePicker());
                await context.router.pop();
                completer.complete(res);
              },
            ),
            ListTile(
              title: AutoSizeText(context.l10n.photoWithCameraLabel),
              leading: const Icon(Icons.camera_alt_rounded),
              onTap: () async {
                final res = await addImg(ImageSource.camera, ImagePicker());
                await context.router.pop();
                completer.complete(res);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<File> addImg(
    ImageSource imgSource,
    ImagePicker _imagePicker,
  ) async {
    final pickedImage = await _imagePicker.pickImage(source: imgSource);
    return File(pickedImage?.path ?? '');
  }
}
