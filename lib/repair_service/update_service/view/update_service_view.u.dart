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
import '../../../shared/widgets/custom_dialog.dart';
import '../bloc/upload_image_bloc.dart';
import '../cubit/detail_service_cubit.dart';
import '../update_service.dart';

class UpdateServiceView extends StatelessWidget {
  UpdateServiceView(
    this.data,
    this.pid, {
    super.key,
  });
  final _formKey = GlobalKey<FormBuilderState>();
  final UpdateServiceModel data;
  final String pid;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final oldName = data.serviceName;
    var imageLink = '';
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            l10n.updateServiceLabel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
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
                    return SimpleDialogCustom(
                      height: 200,
                      content: [
                        AutoSizeText(
                          context.l10n.sureLabel,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        ),
                        AutoSizeText(
                          context.l10n.delProductLabel,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        ),
                      ],
                      button: [
                        TextButton(
                          onPressed: () {
                            context.read<UpdateServiceBloc>().add(
                                  const UpdateServiceEvent.deleted(),
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
                    );
                  },
                );
              },
              child: Text(context.l10n.deleteLabel),
            ),
          ],
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
                                        imageUrl: data.img.isEmpty
                                            ? kFallbackServiceImg
                                            : data.img,
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
                                l10n.serviceInforLabel,
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
                                    BlocBuilder<DetailServiceCubit,
                                        DetailServiceState>(
                                      builder: (context, state) => state.when(
                                        initial: () => FlutterSwitch(
                                          value: data.active,
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
                                                .read<DetailServiceCubit>()
                                                .changeStatus(
                                                  curStatus: value,
                                                  providerID: pid,
                                                  sName: data.serviceName,
                                                  cate: data.cate,
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
                                                .read<DetailServiceCubit>()
                                                .changeStatus(
                                                  curStatus: value,
                                                  providerID: pid,
                                                  sName: data.serviceName,
                                                  cate: data.cate,
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
                            l10n.serviceNameLabel,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 5),
                          FormBuilderTextField(
                            name: 'serviceName',
                            initialValue: data.serviceName,
                            //enabled: false,
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
                            l10n.serviceFeeLabel,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(height: 5),
                          FormBuilderTextField(
                            initialValue: data.serviceFee.toString(),
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
                                r'^[0-9]{1,9}$',
                                errorText: l10n.invalidFormatLabel,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<DetailServiceCubit, DetailServiceState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.when(
                        initial: () => () {
                          if (_formKey.currentState?.saveAndValidate() ==
                              true) {
                            final dataForm = _formKey.currentState?.value;
                            final fee = (dataForm?['fee'])
                                .toString()
                                .replaceAll(RegExp('/^0+/'), '');
                            final model = UpdateServiceModel(
                              img: imageLink.isEmpty ? data.img : imageLink,
                              serviceName:
                                  (dataForm?['serviceName']).toString(),
                              serviceFee: int.parse(fee),
                              cate: data.cate,
                              active: data.active,
                            );
                            context.read<UpdateServiceBloc>().add(
                                  UpdateServiceEvent.submitted(
                                    model: model,
                                    oldName: oldName,
                                  ),
                                );
                          }
                        },
                        changeActiveStatusSuccess: (status) => () {
                          if (_formKey.currentState?.saveAndValidate() ==
                              true) {
                            final dataForm = _formKey.currentState?.value;
                            final fee = (dataForm?['fee'])
                                .toString()
                                .replaceAll(RegExp('/^0+/'), '');
                            final model = UpdateServiceModel(
                              img: imageLink.isEmpty ? data.img : imageLink,
                              serviceName:
                                  (dataForm?['serviceName']).toString(),
                              serviceFee: int.parse(fee),
                              cate: data.cate,
                              active: status,
                            );
                            context.read<UpdateServiceBloc>().add(
                                  UpdateServiceEvent.submitted(
                                    model: model,
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
