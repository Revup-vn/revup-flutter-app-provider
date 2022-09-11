import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../l10n/l10n.dart';
import '../../../router/router.dart';
import '../../../shared/utils/utils_function.dart';
import '../../search_service/search/cubit/search_cubit.dart';
import '../bloc/detail_service_bloc.dart';
import 'detail_service_builder.u.dart';

class DetailServicePage extends StatelessWidget {
  const DetailServicePage(
    this.providerID,
    this.serviceName,
    this.category, {
    super.key,
  });
  final String providerID;
  final String serviceName;
  final String category;
  @override
  Widget build(BuildContext context) {
    final sr = context.read<StoreRepository>();
    final mayBeUser = getUser(context.read<AuthenticateBloc>().state)
        .getOrElse(() => throw NullThrownError());
    final serviceRepos = sr.repairServiceRepo(
      mayBeUser,
      RepairCategoryDummy.dummy(category),
    );
    final productRepos = sr.repairProductRepo(
      mayBeUser,
      RepairCategoryDummy.dummy(category),
      RepairServiceDummy.dummy(serviceName),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailServiceBloc(
            providerID,
            context.read(),
            context.read(),
            category,
            serviceName,
            serviceRepos,
            productRepos,
          ),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            providerID,
            context.read(),
            context.read(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            context.l10n.serviceDetailsAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                context.router.push(
                  UpdateServiceRoute(
                    providerID: providerID,
                    category: category,
                    sName: serviceName,
                  ),
                );
              },
              child: Text(context.l10n.updateServiceLabel),
            ),
          ],
        ),
        body: DetailServiceBuilder(providerID),
      ),
    );
  }
}
