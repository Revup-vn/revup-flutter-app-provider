import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/shared.dart';
import '../add_service.dart';
import '../bloc/dropdown_list_bloc.dart';
import '../bloc/upload_image_bloc.dart';

class AddServiceView extends StatelessWidget {
  AddServiceView({
    super.key,
  });
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    var imageLink = '';
    final items = [
      'Xe máy',
      'Oto',
    ];
    var dropdownvalue = items[0];
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            l10n.addNewServiceLabel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            l10n.servicePhotoLabel,
                            style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ) ??
                                TextStyle(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                          ),
                          const SizedBox(height: 10),
                          BlocBuilder<UploadImageBloc, UploadImageState>(
                            builder: (context, state) => state.maybeWhen(
                              orElse: () => Center(
                                child: Container(
                                  height: 96,
                                  width: 96,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      _showModalButtonSheet(context);
                                    },
                                    icon: const Icon(
                                      Icons.add_photo_alternate_outlined,
                                    ),
                                  ),
                                ),
                              ),
                              success: (newImgUrl) {
                                imageLink = newImgUrl;
                                return Center(
                                  child: Container(
                                    height: 96,
                                    width: 96,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.none,
                                      fit: StackFit.passthrough,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: newImgUrl.isEmpty
                                              ? kFallbackServiceImg
                                              : newImgUrl,
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: IconButton(
                                            onPressed: () {
                                              context
                                                  .read<UploadImageBloc>()
                                                  .add(
                                                    const UploadImageEvent
                                                        .started(),
                                                  );
                                            },
                                            icon: Icon(
                                              Icons.cancel_rounded,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          AutoSizeText(
                            l10n.serviceInforLabel,
                            style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ) ??
                                TextStyle(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                          ),
                          const SizedBox(height: 10),
                          AutoSizeText(
                            l10n.serviceNameLabel,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 5),
                          FormBuilderTextField(
                            name: 'serviceName',
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: l10n.enterServiceNameLabel,
                            ),
                            style: Theme.of(context).textTheme.labelLarge,
                            keyboardType: TextInputType.multiline,
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: l10n.emptyLabel,
                                ),
                                FormBuilderValidators.match(
                                  r'^[a-zA-Z ]+$',
                                  errorText: l10n.invalidFormatLabel,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          AutoSizeText(
                            l10n.serviceFeeLabel,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 5),
                          FormBuilderTextField(
                            name: 'fee',
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: l10n.enterMountLabel,
                            ),
                            style: Theme.of(context).textTheme.labelLarge,
                            keyboardType: TextInputType.number,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: l10n.emptyLabel,
                              ),
                              FormBuilderValidators.match(
                                r'^[1-9].{4,}$',
                                errorText: l10n.invalidFormatLabel,
                              ),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          AutoSizeText(
                            l10n.priceUnitLabel,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: BlocSelector<DropdownListBloc,
                                DropdownListState, String>(
                              selector: (state) => state.maybeWhen(
                                success: (value) => value,
                                orElse: () => items[0],
                              ),
                              builder: (context, value) => DropdownButton(
                                value: value,
                                underline: const SizedBox(),
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    if (newValue.isNotEmpty) {
                                      dropdownvalue = newValue;
                                      context.read<DropdownListBloc>().add(
                                            DropdownListEvent.dropdownChanged(
                                              value: newValue,
                                            ),
                                          );
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() == true) {
                      final data = _formKey.currentState?.value;
                      final model = AddServiceModel(
                        img: imageLink,
                        serviceName: (data?['serviceName']).toString(),
                        serviceFee: int.parse((data?['fee']).toString()),
                        cate: dropdownvalue,
                      );
                      context.read<AddServiceBloc>().add(
                            AddServiceEvent.submitted(data: model),
                          );
                    }
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: AutoSizeText(
                    l10n.saveLabel,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModalButtonSheet(
    BuildContext context,
  ) {
    final bloc = context.read<UploadImageBloc>();
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
                bloc.add(
                  const UploadImageEvent.imageUploadSelected(
                    source: ImageSource.gallery,
                  ),
                );
                await context.router.pop();
              },
            ),
            ListTile(
              title: AutoSizeText(context.l10n.photoWithCameraLabel),
              leading: const Icon(Icons.camera_alt_rounded),
              onTap: () async {
                bloc.add(
                  const UploadImageEvent.imageUploadSelected(
                    source: ImageSource.camera,
                  ),
                );
                await context.router.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
