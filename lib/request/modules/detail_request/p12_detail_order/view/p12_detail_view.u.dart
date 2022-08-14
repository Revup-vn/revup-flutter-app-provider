import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import '../bloc/p12_detail_bloc.dart';

class P12DetailView extends StatelessWidget {
  const P12DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;

    //TODO(tcmhoang): Intl and test UI

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              context
                  .read<P12DetailBloc>()
                  .add(const P12DetailEvent.submitted());
            },
            child: const Text(
              'Xac nhan',
              // TODO(tcmhoang): add arbs
            ),
          )
        ],
      ),
      body: context.read<P12DetailBloc>().state.when(
            initial: Container.new,
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            populated: (requests, bonuses) => Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            child: Row(
                              children: <Widget>[
                                AutoSizeText(
                                  // TODO(tcmhoang): Add arb value
                                  'Dang sua chua',
                                  style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold) ??
                                      const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          ServiceRequestItem(requests: requests),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          BonusServiceItem(bonuses: bonuses),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TotalServicePriceItem(
                        pendingAmount: bonuses
                                .map((e) => e.price)
                                .toList()
                                .reduce((value, element) => value + element) +
                            requests
                                .map((e) => e.price)
                                .reduce((value, element) => value + element),
                      ),
                    ],
                  ),
                ),
              ],
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
