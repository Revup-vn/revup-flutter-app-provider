import 'dart:io';

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../shared/shared.dart';

class VendorAuthenticationPage extends StatelessWidget {
  const VendorAuthenticationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final _formKey = GlobalKey<FormBuilderState>();
    final userApp = AppUser.consumer(
      uuid: '1a',
      firstName: 'Nam',
      lastName: 'Ngoc',
      phone: 'XXX-XXX-XXXX',
      dob: DateTime.now(),
      addr: 'Ninh Binh',
      email: 'huyxam@huyxam.cm',
      active: true,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280s.jpg',
      createdTime: DateTime.now(),
      lastUpdatedTime: DateTime.now(),
      vac: const VideoCallAccount(
        id: '',
        username: '',
        pwd: '',
        email: '',
      ),
    );
    final user = UserModel.fromDto(userApp);

    // TODO(tcmhoang): Get datformat from LanguageCubit
    final formatter = DateFormat();

    const confirmation = 'Xác nhận';
    const serviceProviderAuthentication = 'Xác thực nhà cung cấp dịch vụ';
    const portrait = 'Ảnh chân dung';
    const basicInformation = 'Thông tin cơ bản';
    const imgCard = 'Ảnh CMT/CMND';
    const imgBefore = 'Mặt trước';
    const imgAfter = 'Mặt sau';

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              // TODO(namngoc231): cancel
            },
            child: const Text(confirmation),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  AutoSizeText(
                    serviceProviderAuthentication,
                    style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  AutoSizeText(
                    portrait,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                child: Avatar(
                  localImg: File(''),
                  urlImage: user.urlImage,
                  userName: user.name,
                  callback: () {
                    // TODO(namngoc231): Go to photo selection method
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  AutoSizeText(
                    basicInformation,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                ],
              ),
              Padding(
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
                        //initialValue: '${user.firstName} ${user.lastName}',
                        initialValue: user.name,
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        enabled: user.email == '',
                        initialValue: user.email,
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        initialValue: user.phone,
                        enabled: user.phone == '',
                      ),
                      FormBuilderDateTimePicker(
                        style: Theme.of(context).textTheme.labelLarge,
                        name: 'date',
                        inputType: InputType.date,
                        format: formatter,
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
                        initialValue: user.date,
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
                        initialValue: user.address,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  AutoSizeText(
                    imgCard,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ) ??
                        TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      AutoSizeText(
                        imgBefore,
                        style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ) ??
                            TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      AutoSizeText(
                        imgAfter,
                        style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                ) ??
                            TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 40,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 40,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
