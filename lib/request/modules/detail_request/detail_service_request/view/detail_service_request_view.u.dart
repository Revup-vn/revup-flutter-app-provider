import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/l10n.dart';
import '../../widgets/widgets.dart';

class DetailServiceRequestView extends StatelessWidget {
  const DetailServiceRequestView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // TODO(tcmhoang): depressed cannot review this file
    /// someone please help me

    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                            l10n.serviceDetailLabel,
                            style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold) ??
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
                    const ServiceRequestItem(
                      requests: [],
                    ),
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
                    const BonusServiceItem(
                      bonuses: [],
                    ),
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
                    const AdditionalCostItem(
                      fee: 0,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                TotalServicePriceItem(
                  pendingAmount: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
