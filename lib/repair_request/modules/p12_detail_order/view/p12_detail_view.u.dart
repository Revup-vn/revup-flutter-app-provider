import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../router/router.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../../widgets/record_detail.dart';
import '../bloc/p12_detail_bloc.dart';

class P12DetailView extends StatelessWidget {
  const P12DetailView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final blocPage = context.watch<P12DetailBloc>();
    blocPage.state.maybeWhen(
      initial: () => blocPage.add(const P12DetailEvent.fetched()),
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => context.read<P12DetailBloc>().state.maybeWhen(
                  orElse: () => null,
                  populated: (unpaid, paid) =>
                      context.read<P12DetailBloc>().add(
                            P12DetailEvent.submitted(
                              (vehicle) => context.router.push(
                                P13SelectOptionCompleteRoute(
                                  id: id,
                                  paid: paid,
                                  vehicle: vehicle,
                                ),
                              ),
                            ),
                          ),
                ),
            child: Text(l10n.confirmLabel),
          )
        ],
      ),
      body: context.watch<P12DetailBloc>().state.when(
            initial: Container.new,
            loading: Loading.new,
            populated: (unpaid, paid) => RecordDetail(
              title: l10n.underRepairLabel,
              unpaidServices: unpaid,
              paidServices: paid,
            ),
            failure: () => Center(
              child: Column(
                children: [
                  const AutoSizeText('Failed!, Try again'),
                  OutlinedButton(
                    onPressed: () => context.router.pop(),
                    child: const AutoSizeText('Back to the home page'),
                  )
                ],
              ),
            ),
          ),
    );
  }
}
