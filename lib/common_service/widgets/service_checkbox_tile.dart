import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
  final FormFieldState<
          List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>>
      field;
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

    return Card(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          ListTile(
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
                          imageUrl: widget.serviceData.sImg.isEmpty
                              ? kFallbackServiceImg
                              : widget.serviceData.sImg,
                          height: 64,
                          width: 64,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Image.file(img, fit: BoxFit.fill),
              ),
            ),
            title: Column(
              children: [
                FormBuilderTextField(
                  maxLength: 50,
                  enabled: !isChecked,
                  name: widget.serviceData.sName,
                  initialValue: widget.serviceData.sName,
                  decoration: InputDecoration(
                    labelText: l10n.serviceNameLabel,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                        errorText: l10n.emptyLabel,
                      ),
                      FormBuilderValidators.match(
                        r'^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\sW0-9]+$',
                        errorText: l10n.invalidFormatLabel,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  enabled: !isChecked,
                  maxLength: 9,
                  name: 'fee${widget.serviceData.sName}',
                  initialValue: widget.serviceData.sFee.toString(),
                  decoration: InputDecoration(
                    labelText: l10n.serviceFeeLabel,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    suffixText: l10n.moneyUnit,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: l10n.emptyLabel,
                    ),
                    FormBuilderValidators.match(
                      r'^[0-9]+$',
                      errorText: l10n.invalidFormatLabel,
                    ),
                  ]),
                ),
              ],
            ),
            trailing: Container(
              constraints: const BoxConstraints(minWidth: 70, maxWidth: 80),
              height: double.infinity,
              child: Align(
                alignment: Alignment.centerRight,
                child: Checkbox(
                  checkColor: Theme.of(context).colorScheme.onPrimary,
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: isChecked,
                  onChanged: (bool? value) async {
                    if (widget.formField.currentState?.saveAndValidate() ==
                            true &&
                        widget.formField.currentState != null) {
                      final fieldData = widget.formField.currentState?.value;
                      if (value != null) {
                        setState(() {
                          isChecked = value;
                        });
                      }
                      if (value ?? false) {
                        final completer =
                            Completer<List<Tuple2<RepairProduct, File>>>();
                        await context.router.push(
                          CommonProductRoute(
                            products: widget.serviceData.products,
                            complete: completer,
                          ),
                        );
                        final res = await completer.future;

                        if (res.isNotEmpty) {
                          (widget.field.value)?.add(
                            tuple3(
                              CommonService(
                                sName: fieldData?[widget.serviceData.sName]
                                        .toString() ??
                                    '',
                                sFee: int.parse(
                                  fieldData?['fee${widget.serviceData.sName}']
                                          .toString() ??
                                      '0',
                                ),
                                sImg: widget.serviceData.sImg,
                                products: res.map((e) => e.value1).toList(),
                              ),
                              res,
                              img,
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
                              element.value1.sName ==
                              fieldData?[widget.serviceData.sName].toString(),
                        );
                      }
                    }
                  },
                ),
              ),
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
