import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../l10n/l10n.dart';
import '../../../shared/shared.dart';
import '../bloc/add_product_bloc.dart';
import '../bloc/upload_image_bloc.dart';
import '../cubit/add_product_cubit.dart';
import '../models/add_product_model.dart';

class AddProductView extends StatelessWidget {
  AddProductView(
    this.productModel,
    this.serviceName,
    this.cate,
    this.providerID, {
    super.key,
  });
  final _formKey = GlobalKey<FormBuilderState>();
  final AddProductModel productModel;
  final String serviceName;
  final String cate;
  final String providerID;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final oldName = productModel.productName;
    var imageLink = '';
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            productModel.productName.isEmpty
                ? context.l10n.addNewProductLabel
                : context.l10n.updateProductLabel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: productModel.productName.isNotEmpty
              ? <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (buildercontext) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                  ),
                                  width: double.infinity,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      AutoSizeText(
                                        context.l10n.sureLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            ),
                                      ),
                                      AutoSizeText(
                                        context.l10n.delProductLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          context.read<AddProductBloc>().add(
                                                const AddProductEvent
                                                    .deleteProduct(),
                                              );
                                          context.router.pop();
                                        },
                                        child: AutoSizeText(
                                          context.l10n.doneLabel,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.router.pop();
                                        },
                                        child: AutoSizeText(
                                          context.l10n.cancelLabel,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(context.l10n.deleteLabel),
                  ),
                ]
              : [],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
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
                                  child: Stack(
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.none,
                                    fit: StackFit.passthrough,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: productModel.imageUrl.isEmpty
                                            ? kFallbackProductImg
                                            : productModel.imageUrl,
                                        fit: BoxFit.fill,
                                      ),
                                      Center(
                                        child: IconButton(
                                          onPressed: () {
                                            _showModalButtonSheet(context);
                                          },
                                          icon: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      )
                                    ],
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
                          Row(
                            children: [
                              AutoSizeText(
                                l10n.productInfoLabel,
                                style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ) ??
                                    TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AutoSizeText(
                                      l10n.availableLabel,
                                      style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline,
                                              ) ??
                                          TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    BlocBuilder<AddProductCubit,
                                        AddProductCubitState>(
                                      builder: (context, state) => state.when(
                                        initial: () => FlutterSwitch(
                                          value: productModel.isActive,
                                          width: 45,
                                          height: 25,
                                          activeColor: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          inactiveColor: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                          onToggle: (value) {
                                            context
                                                .read<AddProductCubit>()
                                                .changeStatus(
                                                  curStatus: value,
                                                  providerID: providerID,
                                                  sName: serviceName,
                                                  cate: cate,
                                                  pName:
                                                      productModel.productName,
                                                );
                                          },
                                        ),
                                        changeActiveStatusSuccess: (status) =>
                                            FlutterSwitch(
                                          value: status,
                                          width: 45,
                                          height: 25,
                                          activeColor: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          inactiveColor: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                          onToggle: (value) {
                                            context
                                                .read<AddProductCubit>()
                                                .changeStatus(
                                                  curStatus: value,
                                                  providerID: providerID,
                                                  sName: serviceName,
                                                  cate: cate,
                                                  pName:
                                                      productModel.productName,
                                                );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          AutoSizeText(
                            l10n.productName,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 5),
                          FormBuilderTextField(
                            initialValue: productModel.productName,
                            //enabled: productModel.productName.isEmpty,
                            name: 'productName',
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
                                  r'^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\sW0-9]+$',
                                  errorText: l10n.invalidFormatLabel,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          AutoSizeText(
                            l10n.productPriceLabel,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 5),
                          FormBuilderTextField(
                            initialValue: productModel.productFee.toString(),
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
                                r'^[0-9]+$',
                                errorText: l10n.invalidFormatLabel,
                              ),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          AutoSizeText(
                            l10n.serviceDescriptionLabel,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 5),
                          FormBuilderTextField(
                            name: 'des',
                            initialValue: productModel.des,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: l10n.enterMountLabel,
                            ),
                            style: Theme.of(context).textTheme.labelLarge,
                            keyboardType: TextInputType.multiline,
                            maxLength: 100,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: BlocBuilder<AddProductCubit, AddProductCubitState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.when(
                        initial: () => () {
                          if (_formKey.currentState?.saveAndValidate() ==
                              true) {
                            final data = _formKey.currentState?.value;
                            final fee = (data?['fee'])
                                .toString()
                                .replaceAll(RegExp('/^0+/'), '');
                            final model = AddProductModel(
                              des: (data?['des']).toString(),
                              imageUrl: imageLink.isEmpty
                                  ? productModel.imageUrl
                                  : imageLink,
                              productFee: int.parse(fee),
                              productName: (data?['productName']).toString(),
                              cate: cate,
                              isActive: productModel.isActive,
                              sName: serviceName,
                            );
                            context.read<AddProductBloc>().add(
                                  AddProductEvent.submitted(
                                    data: model,
                                    type: productModel.productName.isEmpty
                                        ? 0
                                        : 1,
                                    oldName: oldName,
                                  ),
                                );
                          }
                        },
                        changeActiveStatusSuccess: (status) => () {
                          if (_formKey.currentState?.saveAndValidate() ==
                              true) {
                            final data = _formKey.currentState?.value;
                            final fee = (data?['fee'])
                                .toString()
                                .replaceAll(RegExp('/^0+/'), '');
                            final model = AddProductModel(
                              des: (data?['des']).toString(),
                              imageUrl: imageLink.isEmpty
                                  ? productModel.imageUrl
                                  : imageLink,
                              productFee: int.parse(fee),
                              productName: (data?['productName']).toString(),
                              cate: cate,
                              isActive: status,
                              sName: serviceName,
                            );
                            context.read<AddProductBloc>().add(
                                  AddProductEvent.submitted(
                                    data: model,
                                    type: productModel.productName.isEmpty
                                        ? 0
                                        : 1,
                                    oldName: oldName,
                                  ),
                                );
                          }
                        },
                      ),
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: AutoSizeText(
                        l10n.saveLabel,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
