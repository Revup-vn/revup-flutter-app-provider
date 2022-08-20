import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/permission_cubit.dart';
import 'permission_view.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PermissionCubit(),
      child: const PermissionView(),
    );
  }
}
