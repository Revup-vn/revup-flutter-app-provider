import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:revup_core/core.dart';

import '../../configs/video_call_config_pub.dart';
import '../../l10n/l10n.dart';
import '../../shared/shared.dart';
import '../bloc/signup_bloc.u.dart';
import '../cubit/signup_cubit.u.dart';
import 'background_view.u.dart';
import 'id_image.u.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent({
    super.key,
    required this.completer,
    required this.phoneNumber,
    required this.photoURL,
    required this.uid,
    required this.email,
  });

  final Completer<AppUser> completer;

  final String phoneNumber;
  final String photoURL;
  final String uid;
  final String email;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SignupCubit>();
    final l10n = context.l10n;
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
            l10n.completeRegistrationLabel,
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
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) => state.when(
                  initial: () => Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      BackGroundView(
                        200,
                        File(''),
                        () => _showModalButtonSheet(context, 1, list),
                      ),
                      Avatar(
                        localImg: File(''),
                        urlImage: photoURL,
                        userName: 'Revup',
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
                        ),
                        Avatar(
                          localImg: file[0],
                          urlImage: photoURL,
                          userName: 'Revup',
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
                            r'^[a-zA-Z ]+$',
                            errorText: l10n.invalidFormatLabel,
                          ),
                        ]),
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        enabled: email == '',
                        initialValue: email,
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
                        enabled: phoneNumber == '',
                        initialValue: phoneNumber,
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
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: Theme.of(context).textTheme.labelLarge,
                        decoration: InputDecoration(
                          labelText: l10n.idCardLabel,
                          labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        keyboardType: TextInputType.number,
                        name: 'idcardNum',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: l10n.emptyLabel,
                          ),
                          FormBuilderValidators.match(
                            r'^((\d{9})|(\d{13}))$',
                            errorText: l10n.invalidFormatLabel,
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AutoSizeText(
                        l10n.imageCardLabel,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              border: Border.all(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  _showModalButtonSheet(context, 2, list);
                                },
                                icon: const Icon(Icons.photo_camera),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              border: Border.all(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            width: 40,
                            height: 40,
                            child: BlocBuilder<SignupBloc, SignupState>(
                              builder: (context, state) => state.when(
                                initial: () => const Center(
                                  child: IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.photo,
                                    ),
                                  ),
                                ),
                                choosePhotoSuccess: (file) => Center(
                                  child: file[2].path.isEmpty
                                      ? const IconButton(
                                          onPressed: null,
                                          icon: Icon(
                                            Icons.photo,
                                          ),
                                        )
                                      : IdImage(40, file[2]),
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
                          if (list[2].path.isEmpty) {
                            await showDialog<String>(
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: const EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.hide_image_outlined,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                          ),
                                          AutoSizeText(
                                            context.l10n.idImgRequiredLabel,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .error,
                                                ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              context.router.pop();
                                            },
                                            child: const AutoSizeText(
                                              'OK',
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            if (_formKey.currentState?.saveAndValidate() ==
                                true) {
                              context.loaderOverlay.show();
                              final data = _formKey.currentState?.value;
                              final fName =
                                  data?['fullName'].toString().split(' ')[0];
                              final lName = data?['fullName']
                                  .toString()
                                  .split(fName ?? '')[1];
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
                              final ilistFile = ilist(list);
                              final ilistStorageFile = ilistFile
                                  .map((a) => StorageFile.profile(file: a));

                              if (ilistStorageFile.length() != 0) {
                                await cubit
                                    .uploadImg(files: ilistStorageFile)
                                    .whenComplete(() {
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
                                      completer.complete(
                                        AppUser.provider(
                                          backgroundUrl: list[1],
                                          bio: data?['bio'].toString() ?? '',
                                          idCardImage: list[2],
                                          idCardNum:
                                              data?['idcardNum'].toString() ??
                                                  '',
                                          online: true,
                                          loc: const Location(
                                            name: 'home',
                                            long: 1,
                                            lat: 1,
                                          ),
                                          uuid: uid,
                                          firstName: fName ?? '',
                                          lastName: lName ?? '',
                                          phone: '+84$phoneNumber',
                                          dob: DateTime.parse(
                                            data?['date']
                                                    .toString()
                                                    .split(' ')[0] ??
                                                '',
                                          ),
                                          addr:
                                              data?['address'].toString() ?? '',
                                          email:
                                              data?['email'].toString() ?? '',
                                          active: true,
                                          avatarUrl: list[0].isEmpty
                                              ? photoURL
                                              : list[0],
                                          createdTime: DateTime.now(),
                                          lastUpdatedTime: DateTime.now(),
                                          vac: VideoCallAccount(
                                            id: uid,
                                            username: '+84$phoneNumber',
                                            pwd: DEFAULT_PASS,
                                            email:
                                                data?['email'].toString() ?? '',
                                          ),
                                        ),
                                      );
                                      await context.router.pop();
                                    },
                                  );
                                });
                              } else {
                                completer.complete(
                                  AppUser.provider(
                                    backgroundUrl: '',
                                    bio: data?['bio'].toString() ?? '',
                                    idCardImage: '',
                                    idCardNum:
                                        data?['idcardNum'].toString() ?? '',
                                    online: true,
                                    loc: const Location(
                                      name: 'home',
                                      long: 1,
                                      lat: 1,
                                    ),
                                    uuid: uid,
                                    firstName: fName ?? '',
                                    lastName: lName ?? '',
                                    phone: '+84$phoneNumber',
                                    dob: DateTime.parse(
                                      data?['date'].toString().split(' ')[0] ??
                                          '',
                                    ),
                                    addr: data?['address'].toString() ?? '',
                                    email: data?['email'].toString() ?? '',
                                    active: true,
                                    avatarUrl: photoURL,
                                    createdTime: DateTime.now(),
                                    lastUpdatedTime: DateTime.now(),
                                    vac: VideoCallAccount(
                                      id: uid,
                                      username: '+84$phoneNumber',
                                      pwd: DEFAULT_PASS,
                                      email: data?['email'].toString() ?? '',
                                    ),
                                  ),
                                );
                                await context.router.pop();
                              }
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
    final bloc = context.read<SignupBloc>();
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
                  SignupEvent.imageUploadSelected(
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
                  SignupEvent.imageUploadSelected(
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
