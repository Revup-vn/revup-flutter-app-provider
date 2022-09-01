import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revup_core/core.dart';

import '../cubit/product_cubit.dart';
import 'common_product_view.dart';

class CommonProductPage extends StatelessWidget {
  const CommonProductPage(this.products, this.complete, {super.key});
  final List<RepairProduct> products;
  final Completer<List<Tuple2<RepairProduct, File>>> complete;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ImagePicker()),
      child: CommonProductView(products, complete),
    );
  }
}
