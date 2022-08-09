import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:revup_core/core.dart';

import '../../configs/video_call_config.dart';
import '../../l10n/l10n.dart';
import '../../shared/shared.dart';
import '../bloc/signup_bloc.dart';
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
    required this.list,
  });

  final Completer<AppUser> completer;
  final List<File> list;
  final String phoneNumber;
  final String photoURL;
  final String uid;
  final String email;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          l10n.completeRegistrationLabel,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                BackGroundView(
                  200,
                  list[1],
                  () => _showModalButtonSheet(context, 1),
                ),
                Avatar(
                  localImg: list[0],
                  urlImage: list[0].path.isEmpty ? photoURL : list[0].path,
                  userName: 'Revup',
                  callback: () {
                    _showModalButtonSheet(context, 0);
                  },
                ),
              ],
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
                        FormBuilderValidators.match(
                          r'^0?(3|5|7|8|9){1}([0-9]{8})$',
                          errorText: l10n.invalidFormatLabel,
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
                      keyboardType: TextInputType.text,
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
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                _showModalButtonSheet(context, 2);
                              },
                              icon: const Icon(
                                Icons.add_a_photo_outlined,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            border: Border.all(),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          width: 40,
                          height: 40,
                          child: Center(
                            child: list[2].path.isEmpty
                                ? const IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.photo,
                                    ),
                                  )
                                : IdImage(40, list[2]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        _formKey.currentState?.saveAndValidate();
                        final data = _formKey.currentState?.value;
                        final fName =
                            data?['fullName'].toString().split(' ')[0];
                        final lName =
                            data?['fullName'].toString().split(fName ?? '')[1];
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
                        final ilistStorageFile = ilistFile.map<StorageFile>(
                          (a) => StorageFile.profile(file: a),
                        );

                        context.read<StorageBloc>().add(
                              StorageEvent.uploadMany(files: ilistStorageFile),
                            );

                        BlocSelector<StorageBloc, StorageState, IList<String>>(
                          selector: (state) => state.maybeWhen(
                            success: (eitherFailuresOrUrls) {
                              final tmp =
                                  eitherFailuresOrUrls.map<Option<String>>(
                                (a) => a.fold(
                                  (l) => none(),
                                  some,
                                ),
                              );

                              return tmp.filter((a) => a.isSome()).map(
                                    (a) => a.getOrElse(
                                      () => throw NullThrownError(),
                                    ),
                                  );
                            },
                            orElse: () => ilist(['']),
                          ),
                          builder: (context, state) {
                            final list = state.toList();
                            completer.complete(
                              AppUser.provider(
                                backgroundUrl: list[1],
                                bio: data?['bio'].toString() ?? '',
                                idCardImage: list[2],
                                idCardNum: data?['idcardNum'].toString() ?? '',
                                online: true,
                                curLocation: GeoFirePoint(1, 1),
                                uuid: uid,
                                firstName: fName ?? '',
                                lastName: lName ?? '',
                                phone: '+84$phoneNumber',
                                dob: DateTime.parse(
                                  data?['date'].toString().split(' ')[0] ?? '',
                                ),
                                addr: data?['address'].toString() ?? '',
                                email: data?['email'].toString() ?? '',
                                active: true,
                                avatarUrl: list[3].isEmpty ? photoURL : list[3],
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

                            return Container();
                          },
                        );

                        await context.router.pop();
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
    );
  }

  void _showModalButtonSheet(BuildContext context, int type) {
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
