import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revup_core/core.dart';

import '../../../models/models.dart';
import '../bloc/image_picker_bloc.dart';
import '../cubit/p14_repair_completed_cubit.dart';
import 'p14_repair_completed_view.u.dart';

class P14RepairCompletePage extends StatelessWidget {
  const P14RepairCompletePage({
    super.key,
    required this.finished,
    required this.paid,
    required this.vehicle,
    required this.recordId,
    required this.transFee,
  });

  final List<PendingServiceModel> finished;
  final List<PaidServicesModel> paid;
  final String vehicle;
  final String recordId;
  final PendingServiceModel transFee;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => P14RepairCompletedCubit(
            context.read(),
            recordId,
            context.read(),
            context.read(),
            context.read(),
            context.read<AuthenticateBloc>().state.maybeMap(
                  orElse: () => throw NullThrownError(),
                  authenticated: (type) => type.authType.user,
                ),
          ),
        ),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePicker())),
      ],
      child: P14RepairCompleteView(
        finished: finished,
        paid: paid,
        vehicle: vehicle,
        transFee: transFee,
      ),
    );
  }
}
