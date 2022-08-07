import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../bloc/detail_service_request_bloc.u.dart';

class AdditionalCoststItem extends StatelessWidget {
  const AdditionalCoststItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                l10n.additionalCostsLabel,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ) ??
                    TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        BlocBuilder<DetailServiceRequestBloc, DetailServiceRequestState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Text('Empty'),
              loading: () => const Center(child: CircularProgressIndicator()),
              failure: () => const Text('Failed'),
              success: (repairRecordModel) => SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AutoSizeText(
                      l10n.transitFeeLabel,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    AutoSizeText(
                      '''${repairRecordModel.feeTransport}Đ''',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
