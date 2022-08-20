import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../new_request/models/pending_repair_request.dart';
import '../../../models/pending_service_model.dart';
import '../bloc/info_request_bloc.dart';
import 'info_request_view.u.dart';

class InfoRequestPage extends StatelessWidget {
  const InfoRequestPage({
    super.key,
    required this.consumer,
    required this.record,
    required this.distance,
    required this.pendingService,
    required this.pendingAmount,
  });
  final AppUser consumer;
  final PendingRepairRequest record;
  final double distance;
  final IList<PendingServiceModel> pendingService;
  final int pendingAmount;

  @override
  Widget build(BuildContext context) {
    final sr = context.read<StoreRepository>();
    final paymentService =
        sr.repairPaymentRepo(RepairRecordDummy.dummyStarted(record.id));
    // final user = getUser(context.read<AuthenticateBloc>().state)
    //     .getOrElse(() => throw NullThrownError());
    final user = AppUser.provider(
        uuid: 'geCHNSHZ2xg2GfMSfZpxAweWWln2',
        firstName: 'firstName',
        lastName: 'lastName',
        phone: 'phone',
        dob: DateTime.now(),
        addr: 'addr',
        email: 'email',
        active: true,
        avatarUrl: 'https://shibatoken.com/images/c1.png',
        createdTime: DateTime.now(),
        lastUpdatedTime: DateTime.now(),
        idCardNum: 'idCardNum',
        idCardImage: 'idCardImage',
        backgroundUrl: 'https://shibatoken.com/images/c1.png',
        bio: 'bio',
        vac: VideoCallAccount(
            id: 'id', username: 'username', pwd: 'pwd', email: 'email'),
        online: true,
        loc: Location(name: 'name', long: 1, lat: 1));
    return BlocProvider(
      create: (_) => InfoRequestBloc(
        record,
        context.read(),
        context.read(),
        paymentService,
        user,
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: InfoRequestView(
          consumer: consumer,
          distance: distance,
          pendingService: pendingService,
          pendingAmount: pendingAmount,
          userRepos: context.read(),
          user: user,
        ),
      ),
    );
  }
}
