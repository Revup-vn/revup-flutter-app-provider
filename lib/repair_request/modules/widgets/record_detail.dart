import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../shared/utils/fallbacks.dart';
import '../../models/models.dart';
import 'need_to_verify_item.dart';
import 'total_service_price_item.u.dart';

class RecordDetail extends StatelessWidget {
  const RecordDetail({
    super.key,
    required this.title,
    required this.serviceList,
  });

  final String title;
  final List<PendingServiceModel> serviceList;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final transFee = serviceList.firstWhere(
      (e) => e.name == 'transFee',
    );
    final services =
        serviceList.where((element) => element.name != 'transFee').toList();
    return Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: AutoSizeText(
                              l10n.transitFeeLabel,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          AutoSizeText(
                            context.formatMoney(transFee.price),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          AutoSizeText(
                            transFee.status == 'pending'
                                ? context.l10n.pendingLabel
                                : context.l10n.paidLabel,
                            maxFontSize: 12,
                            minFontSize: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: services.length,
                      itemBuilder: (BuildContext context, int index) {
                        var statusLabel = l10n.pendingLabel;
                        var statusColor = Colors.blueAccent;
                        if (services[index].status == 'paid') {
                          statusLabel = l10n.paidLabel;
                          statusColor = Colors.greenAccent;
                        } else if (services[index].status == 'waiting') {
                          statusLabel = l10n.waitingLabel;
                          statusColor = Colors.orangeAccent;
                        }
                        return Card(
                          elevation: 0,
                          child: SizedBox(
                            height: 96,
                            child: ListTile(
                              leading: SizedBox(
                                height: 64,
                                width: 64,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: services[index].imageUrl ??
                                        kFallbackServiceImg,
                                    placeholder: (context, url) =>
                                        Assets.screens.setting.svg(
                                      fit: BoxFit.fill,
                                      height: 64,
                                      width: 64,
                                    ),
                                    errorWidget: (
                                      context,
                                      url,
                                      dynamic error,
                                    ) =>
                                        Assets.screens.setting.svg(
                                      fit: BoxFit.fill,
                                      height: 64,
                                      width: 64,
                                    ),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    services[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: AutoSizeText(
                                          services[index].price == -1
                                              ? l10n.needPriceQuotationLabel
                                              : context.formatMoney(
                                                  services[index].price +
                                                      (services[index]
                                                              .products
                                                              .isEmpty
                                                          ? 0
                                                          : services[index]
                                                              .products
                                                              .fold(
                                                                0,
                                                                (p, e) =>
                                                                    p +
                                                                    e.unitPrice *
                                                                        e.quantity,
                                                              )),
                                                ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      if (services[index].status == 'waiting')
                                        NeedToVerifyItem(
                                          key: UniqueKey(),
                                          needToVerify: services[index],
                                          pendingAmount: services.fold(
                                            0,
                                            (p, e) =>
                                                p +
                                                (e.price == -1 ? 0 : e.price) +
                                                (e.products.isEmpty
                                                    ? 0
                                                    : e.products.first
                                                            .unitPrice *
                                                        e.products.first
                                                            .quantity),
                                          ),
                                        )
                                      else
                                        AutoSizeText(
                                          statusLabel,
                                          style: TextStyle(
                                            color: statusColor,
                                          ),
                                          maxFontSize: 12,
                                          minFontSize: 8,
                                        ),
                                    ],
                                  ),
                                  AutoSizeText(
                                    '''${l10n.productLabel}: ${services[index].products.isEmpty ? l10n.noneLabel : ('${services[index].products.first.name} x ${services[index].products.first.quantity}')}''',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
        ),
        TotalServicePriceItem(
          pendingAmount: services.fold(
            0,
            (p, e) =>
                p +
                ((transFee.status == 'pending'
                        ? transFee.price
                        : -transFee.price) +
                    (e.price == -1 ? 0 : e.price) +
                    (e.products.isEmpty
                        ? 0
                        : e.products.first.unitPrice *
                            e.products.first.quantity)),
          ),
        ),
      ],
    );
  }
}
