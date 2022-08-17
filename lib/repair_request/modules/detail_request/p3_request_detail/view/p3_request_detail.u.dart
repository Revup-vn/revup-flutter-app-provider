import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../new_request/models/pending_repair_request.dart';
import '../../../../models/pending_service_model.dart';
import '../../widgets/widgets.dart';
import '../widgets/additional_costs_item.u.dart';
import '../widgets/bonus_service_item.u.dart';

class P3RequestDetailPage extends StatelessWidget {
  const P3RequestDetailPage({
    super.key,
    required this.record,
    required this.requests,
    required this.pendingAmount,
  });
  final PendingRepairRequest record;
  final IList<PendingServiceModel> requests;
  final int pendingAmount;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
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
                    const SizedBox(height: 32),
                    AutoSizeText(
                      l10n.notIncludeProductPriceLabel,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ) ??
                          TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ServiceRequestItem(
                      requests: requests.toList(),
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
                    if (record.optionalServices.isNotEmpty)
                      BonusServicetItem(
                        record: record,
                      ),
                    AdditionalCoststItem(
                      record: record,
                    ),
                  ],
                ),
              ),
            ),
          ),
          TotalServicePriceItem(
            pendingAmount: pendingAmount,
          ),
        ],
      ),
    );
  }
}
