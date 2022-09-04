import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide showSearch;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../l10n/l10n.dart';
import '../../../router/router.dart';
import '../../../shared/utils/utils_function.dart';
import '../../../shared/widgets/search_custom.dart';
import '../../search_service/search/cubit/search_cubit.dart';
import '../../search_service/search/view/provider_search.dart';
import '../bloc/list_service_bloc.dart';
import 'list_service_builder.u.dart';

class ListServicePage extends StatelessWidget {
  const ListServicePage(this.providerID, {super.key});
  final String providerID;
  @override
  Widget build(BuildContext context) {
    final sr = context.read<StoreRepository>();
    final mayBeUser = getUser(context.read<AuthenticateBloc>().state)
        .getOrElse(() => throw NullThrownError());
    final serviceRepos = sr.repairServiceRepo(
      mayBeUser,
      RepairCategoryDummy.dummy('Xe máy'),
    );
    final serviceRepos2 = sr.repairServiceRepo(
      mayBeUser,
      RepairCategoryDummy.dummy('Oto'),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ListServiceBloc(
            providerID,
            context.read(),
            context.read(),
            serviceRepos,
            serviceRepos2,
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
            context.l10n.serviceAccountLabel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    final t = BlocProvider.of<SearchCubit>(context);
                    showSearch(
                      context: context,
                      delegate: ProviderSearch(
                        0,
                        1,
                        '',
                        searchBloc: t,
                        hintText: context.l10n.searchLabel,
                        searchFieldStyle:
                            Theme.of(context).textTheme.bodyMedium,
                      ),
                      useRootNavigator: false,
                    );
                  },
                  icon: const Icon(Icons.search_rounded),
                );
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                context.router.push(AddServiceRoute(providerID: providerID));
              },
              child: Text(context.l10n.addLabel),
            ),
          ],
        ),
        body: const ListServiceBuilder(),
      ),
    );
  }
}
