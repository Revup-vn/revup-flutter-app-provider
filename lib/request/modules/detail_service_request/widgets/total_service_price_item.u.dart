import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../bloc/detail_service_request_bloc.u.dart';

class TotalServicePriceItem extends StatelessWidget {
  const TotalServicePriceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: SizedBox(
            width: 30,
            height: 60,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AutoSizeText(
                    l10n.totalLabel,
                    style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  BlocBuilder<DetailServiceRequestBloc,
                      DetailServiceRequestState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const Text('Empty'),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        failure: () => const Text('Failed'),
                        success: (repairRecordModel) => SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              AutoSizeText(
                                '''${repairRecordModel.temporary}Đ''',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
