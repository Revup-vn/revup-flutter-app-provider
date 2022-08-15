import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../router/router.dart';
import '../../widgets/record_detail.dart';
import '../bloc/p12_detail_bloc.dart';

class P12DetailView extends StatelessWidget {
  const P12DetailView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;

    //TODO(tcmhoang): Intl and test UI

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
            child: const Text(
              'Xac nhan',
              // TODO(tcmhoang): add arbs
            ),
          )
        ],
      ),
      body: context.watch<P12DetailBloc>().state.when(
            initial: Container.new,
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            populated: (unpaid, paid) => RecordDetail(
              title: 'Dang sua chua',
              // TODO(ctmhoang): intl this
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
