import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';

import '../../../../l10n/l10n.dart';
import '../../../../new_request/models/pending_request.dart';
import '../../../../new_request/models/pending_service.dart';
import '../widgets/widgets.dart';

class DetailServiceRequestPage extends StatelessWidget {
  const DetailServiceRequestPage({
    super.key,
    required this.record,
    required this.pendingService,
    required this.pendingAmount,
  });
  final PendingRequest record;
  final IList<PendingService> pendingService;
  final int pendingAmount;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

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
                    ServiceRequestItem(
                      pendingService: pendingService,
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
                    BonusServicetItem(
                      record: record,
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
                    AdditionalCoststItem(
                      record: record,
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
              children: [
                TotalServicePriceItem(
                  pendingAmount: pendingAmount,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
