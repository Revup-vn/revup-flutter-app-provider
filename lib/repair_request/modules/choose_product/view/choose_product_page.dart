import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../models/service_data.dart';
import '../bloc/choose_product_bloc.dart';
import 'choose_product_view.dart';

class ChooseProductPage extends StatelessWidget {
  const ChooseProductPage({
    super.key,
    required this.serviceData,
    required this.recordId,
  });
  final ServiceData serviceData;
  final String recordId;
  @override
  Widget build(BuildContext context) {
    final sr = context.read<StoreRepository>();

    return BlocProvider(
      create: (context) => ChooseProductBloc(
        sr,
        context.read(),
        serviceData,
        recordId,
        context.read(),
      ),
      child: ChooseProductView(
        recordId: recordId,
      ),
    );
  }
}
