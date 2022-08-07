import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../bloc/detail_service_request_bloc.u.dart';

class BonusServicetItem extends StatelessWidget {
  const BonusServicetItem({
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
                l10n.bonusServicesLabel,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ) ??
                    TextStyle(
                      color: Theme.of(context).colorScheme.outline,
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
              success: (repairRecordModel) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: repairRecordModel.bonusServicesModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AutoSizeText(
                          repairRecordModel.bonusServicesModel
                              .elementAt(index)
                              .name,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        AutoSizeText(
                          '''${repairRecordModel.bonusServicesModel.elementAt(index).price}Đ''',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
