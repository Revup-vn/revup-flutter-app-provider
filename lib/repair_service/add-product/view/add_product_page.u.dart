import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/add_product_bloc.dart';
import '../bloc/upload_image_bloc.dart';
import 'add_product_builder.u.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage(
    this.providerID,
    this.cate,
    this.sName,
    this.pName,
    this.type, {
    super.key,
  });
  final String providerID;
  final String cate;
  final String sName;
  final String pName;
  final int type;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AddProductBloc(
            providerID,
            context.read(),
            context.read(),
            cate,
            sName,
            pName,
          ),
        ),
        BlocProvider(
          create: (context) => UploadImageBloc(ImagePicker(), context.read()),
        ),
      ],
      child: AddProductBuilder(type),
    );
  }
}
