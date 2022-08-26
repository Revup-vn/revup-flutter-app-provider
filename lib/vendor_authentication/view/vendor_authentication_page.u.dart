import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revup_core/core.dart';

import '../bloc/bloc/upload_image_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../cubit/upload_image_cubit.u.dart';
import 'update_profile_builder.dart';

class VendorAuthenticationPage extends StatelessWidget {
  const VendorAuthenticationPage(
    this.user, {
    super.key,
  });
  final AppUser user;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadImageBloc(ImagePicker()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(context.read(), user.uuid),
        ),
        BlocProvider(
          create: (context) => UploadImageCubit(context.read()),
          child: Container(),
        )
      ],
      child: const UpdateProfileBuilder(),
    );
  }
}
