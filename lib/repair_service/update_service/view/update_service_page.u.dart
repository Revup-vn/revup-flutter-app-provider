import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/update_service_bloc.dart';
import '../bloc/upload_image_bloc.dart';
import '../cubit/detail_service_cubit.dart';
import 'update_service_builder.u.dart';

class UpdateServicePage extends StatelessWidget {
  const UpdateServicePage(
    this.providerID,
    this.category,
    this.sName, {
    super.key,
  });
  final String providerID;
  final String category;
  final String sName;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UpdateServiceBloc(
            providerID,
            context.read(),
            context.read(),
            category,
            sName,
          ),
        ),
        BlocProvider(
          create: (context) => UploadImageBloc(ImagePicker(), context.read()),
        ),
        BlocProvider(
          create: (context) => DetailServiceCubit(
            context.read(),
            context.read(),
          ),
        ),
      ],
      child: const UpdateServiceBuilder(),
    );
  }
}
