import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../l10n/l10n.dart';
import '../../widgets/need_to_verify_item.u.dart';
import '../../widgets/service_request_item.u.dart';
import '../../widgets/total_service_price_item.u.dart';
import '../cubit/p10_quote_price_cubit.dart';

class P10QuotePriceView extends StatelessWidget {
  const P10QuotePriceView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return context.watch<P10QuotePriceCubit>().state.maybeWhen(
          success: (pendingService, needToVerifyService) => Column(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
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
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ) ??
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
                            style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ) ??
                                TextStyle(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ServiceRequestItem(
                            requests: pendingService,
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
                          if (needToVerifyService.isNotEmpty)
                            NeedToVerifyItem(
                              needToVerify: needToVerifyService,
                              pendingAmount: pendingService
                                  .map((e) => e.price)
                                  .toList()
                                  .reduce((value, element) => value + element),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TotalServicePriceItem(
                pendingAmount: pendingService
                    .map((e) => e.price)
                    .toList()
                    .reduce((value, element) => value + element),
              ),
            ],
          ),
          orElse: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
  }
}
