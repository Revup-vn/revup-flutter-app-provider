import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../shared/shared.dart';
import '../../signup/widgets/background_view.u.dart';
import '../../signup/widgets/id_image.u.dart';
import '../bloc/bloc/upload_image_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../cubit/upload_image_cubit.u.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView(this.user, {super.key});
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.watch<UploadImageCubit>();
    final _formKey = GlobalKey<FormBuilderState>();
    var list = <File>[
      File(''),
      File(''),
      File(''),
    ];

    return LoaderOverlay(
      closeOnBackButton: true,
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            l10n.editProfileLabel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          leading: BackButton(
            onPressed: () {
              if (context.loaderOverlay.visible) context.loaderOverlay.hide();
              context.router.pop();
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: BlocBuilder<UploadImageBloc, UploadImageState>(
                builder: (context, state) => state.when(
                  initial: () => Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      BackGroundView(
                        200,
                        File(''),
                        () => _showModalButtonSheet(context, 1, list),
                        user.maybeMap(
                          orElse: () => '',
                          provider: (value) => value.backgroundUrl,
                        ),
                      ),
                      Avatar(
                        localImg: File(''),
                        urlImage: user.avatarUrl,
                        userName: '${user.firstName} ${user.lastName}',
                        callback: () {
                          _showModalButtonSheet(context, 0, list);
                        },
                      ),
                    ],
                  ),
                  choosePhotoSuccess: (file) {
                    list = file;

                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        BackGroundView(
                          200,
                          file[1],
                          () => _showModalButtonSheet(context, 1, list),
                          user.maybeMap(
                            orElse: () => '',
                            provider: (value) => value.backgroundUrl,
                          ),
                        ),
                        Avatar(
                          localImg: file[0],
                          urlImage: user.avatarUrl,
                          userName: '${user.firstName} ${user.lastName}',
                          callback: () {
                            _showModalButtonSheet(context, 0, list);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            DismissKeyboard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FormBuilder(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: '${user.firstName} ${user.lastName}',
                        style: Theme.of(context).textTheme.labelLarge,
                        decoration: InputDecoration(
                          labelText: l10n.fullNameLabel,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        keyboardType: TextInputType.text,
                        name: 'fullName',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: l10n.emptyLabel,
                          ),
                          FormBuilderValidators.match(
                            r'^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$',
                            errorText: l10n.invalidFormatLabel,
                          ),
                        ]),
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        enabled: user.email == '',
                        initialValue: user.email,
                        style: Theme.of(context).textTheme.labelLarge,
                        decoration: InputDecoration(
                          labelText: l10n.emailLabel,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        keyboardType: TextInputType.text,
                        name: 'email',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: l10n.emptyLabel,
                          ),
                          FormBuilderValidators.email(
                            errorText: l10n.invalidFormatLabel,
                          ),
                        ]),
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        enabled: user.phone == '',
                        initialValue: user.phone,
                        style: Theme.of(context).textTheme.labelLarge,
                        decoration: InputDecoration(
                          labelText: l10n.phoneLabel,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        keyboardType: TextInputType.number,
                        name: 'phone',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: l10n.emptyLabel,
                          ),
                        ]),
                      ),
                      FormBuilderDateTimePicker(
                        style: Theme.of(context).textTheme.labelLarge,
                        name: 'date',
                        inputType: InputType.date,
                        initialValue: user.dob,
                        format: DateFormat('dd-MM-yyyy'),
                        decoration: InputDecoration(
                          labelText: l10n.dateLabel,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        initialDate: DateTime.now()
                            .subtract(const Duration(days: 356 * 18)),
                        lastDate: DateTime.now()
                            .subtract(const Duration(days: 356 * 18)),
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: Theme.of(context).textTheme.labelLarge,
                        initialValue: user.addr,
                        decoration: InputDecoration(
                          labelText: l10n.addressLabel,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        keyboardType: TextInputType.text,
                        name: 'address',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: l10n.emptyLabel,
                          ),
                        ]),
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: user.maybeMap(
                          orElse: () => '',
                          provider: (value) => value.bio,
                        ),
                        style: Theme.of(context).textTheme.labelLarge,
                        decoration: InputDecoration(
                          labelText: l10n.bioLabel,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        keyboardType: TextInputType.text,
                        name: 'bio',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (user.maybeMap(
                        orElse: () => false,
                        provider: (value) => value.needToUpdateInfo,
                      ))
                        AutoSizeText.rich(
                          TextSpan(
                            text: l10n.imageCardLabel,
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                              TextSpan(
                                text: '( ${l10n.blsLabel} )',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                        ),
                      if (user.maybeMap(
                        orElse: () => false,
                        provider: (value) => value.needToUpdateInfo,
                      ))
                        const SizedBox(height: 16),
                      if (user.maybeMap(
                        orElse: () => false,
                        provider: (value) => value.needToUpdateInfo,
                      ))
                        Row(
                          children: [
                            Center(
                              child: Container(
                                height: 96,
                                width: 96,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: BlocBuilder<UploadImageBloc,
                                    UploadImageState>(
                                  builder: (context, state) => state.when(
                                    initial: () => Center(
                                      child: IconButton(
                                        onPressed: () {
                                          _showModalButtonSheet(
                                              context, 2, list);
                                        },
                                        icon: Icon(
                                          Icons.add_photo_alternate_outlined,
                                          size: 40,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                      ),
                                    ),
                                    choosePhotoSuccess: (file) => Center(
                                      child: file[2].path.isEmpty
                                          ? IconButton(
                                              onPressed: () {
                                                _showModalButtonSheet(
                                                  context,
                                                  2,
                                                  list,
                                                );
                                              },
                                              icon: Icon(
                                                Icons
                                                    .add_photo_alternate_outlined,
                                                size: 40,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline,
                                              ),
                                            )
                                          : IdImage(
                                              96,
                                              file[2],
                                              callback: () {
                                                list[2] = File('');
                                                context
                                                    .read<UploadImageBloc>()
                                                    .add(
                                                      const UploadImageEvent
                                                          .started(),
                                                    );
                                              },
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.saveAndValidate() ==
                              true) {
                            context.loaderOverlay.show();
                            final data = _formKey.currentState?.value;
                            final listName =
                                data?['fullName'].toString().split(' ');
                            final fName = listName?[0].trim();
                            var lName = '';
                            if (listName != null && listName.length > 1) {
                              listName.remove(listName[0]);
                              lName = listName
                                  .fold<String>(
                                    '',
                                    (previousValue, element) =>
                                        '$previousValue $element',
                                  )
                                  .trim();
                            }
                            var phoneNumber = data?['phone'].toString();
                            if (phoneNumber?.substring(0, 3) == '+84') {
                              phoneNumber = phoneNumber?.substring(
                                3,
                                phoneNumber.length,
                              );
                            }
                            if (phoneNumber?.substring(0, 1) == '0') {
                              phoneNumber = phoneNumber?.substring(
                                1,
                                phoneNumber.length,
                              );
                            }
                            if (list[0].path.isEmpty &&
                                list[1].path.isEmpty &&
                                list[2].path.isEmpty) {
                              final appUser =
                                  AppUserDummy.dummyProvider(user.uuid)
                                      .maybeMap(
                                orElse: () => throw NullThrownError(),
                                provider: (value) => value.copyWith(
                                  avatarUrl: user.avatarUrl,
                                  backgroundUrl: user.maybeMap(
                                    orElse: () => '',
                                    provider: (value) => value.backgroundUrl,
                                  ),
                                  addr: data?['address'].toString() ?? '',
                                  firstName: fName ?? '',
                                  lastName: lName,
                                  dob: DateTime.parse(
                                    data?['date'].toString().split(' ')[0] ??
                                        '',
                                  ),
                                  bio: data?['bio'].toString() ?? '',
                                ),
                              );
                              context.read<ProfileBloc>().add(
                                    ProfileEvent.submitted(appUser),
                                  );
                            } else {
                              final ilistFile = ilist(list);
                              final ilistStorageFile = ilistFile
                                  .map((a) => StorageFile.profile(file: a));

                              await cubit
                                  .uploadImg(files: ilistStorageFile)
                                  .whenComplete(
                                () {
                                  context.read<StorageBloc>().state.whenOrNull(
                                    success: (eitherFailuresOrUrls) async {
                                      final tmp = eitherFailuresOrUrls
                                          .map<Option<String>>(
                                        (a) => a.fold(
                                          (l) => none(),
                                          some,
                                        ),
                                      );

                                      final listLink =
                                          tmp.filter((a) => a.isSome()).map(
                                                (a) => a.getOrElse(
                                                  () => throw NullThrownError(),
                                                ),
                                              );
                                      final list = listLink.toList();

                                      final appUser =
                                          AppUserDummy.dummyProvider(user.uuid)
                                              .maybeMap(
                                        orElse: () => throw NullThrownError(),
                                        provider: (value) => value.copyWith(
                                          avatarUrl: list[0].isEmpty
                                              ? user.avatarUrl
                                              : list[0],
                                          backgroundUrl: list[1].isEmpty
                                              ? user.maybeMap(
                                                  orElse: () => '',
                                                  provider: (value) =>
                                                      value.backgroundUrl,
                                                )
                                              : list[1],
                                          addr:
                                              data?['address'].toString() ?? '',
                                          firstName: fName ?? '',
                                          lastName: lName,
                                          dob: DateTime.parse(
                                            data?['date']
                                                    .toString()
                                                    .split(' ')[0] ??
                                                '',
                                          ),
                                          bio: data?['bio'].toString() ?? '',
                                          idCardImage: list[2].isEmpty
                                              ? user.mapOrNull(
                                                    provider: (value) =>
                                                        value.idCardImage,
                                                  ) ??
                                                  ''
                                              : list[2],
                                        ),
                                      );
                                      context.read<ProfileBloc>().add(
                                            ProfileEvent.submitted(appUser),
                                          );
                                    },
                                  );
                                },
                              );
                            }
                          }
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: AutoSizeText(
                          l10n.doneLabel,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
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
    int type,
    List<File> list,
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
                  UploadImageEvent.imageUploadSelected(
                    source: ImageSource.gallery,
                    currentListStorage: list,
                    typeUpload: type,
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
                  UploadImageEvent.imageUploadSelected(
                    source: ImageSource.camera,
                    currentListStorage: list,
                    typeUpload: type,
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
