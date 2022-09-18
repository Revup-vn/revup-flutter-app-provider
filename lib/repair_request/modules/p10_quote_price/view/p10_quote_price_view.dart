import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revup_core/core.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../router/router.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/utils/fallbacks.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../../../../shared/widgets/unknown_failure.dart';
import '../../widgets/need_to_verify_item.dart';
import '../../widgets/total_service_price_item.u.dart';
import '../cubit/p10_quote_price_cubit.dart';

class P10QuotePriceView extends StatelessWidget {
  const P10QuotePriceView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    context.read<NotificationCubit>().addForegroundListener((p0) {
      final type = p0.payload.type;
      switch (type) {
        case NotificationType.NormalMessage:
          final type = p0.payload.payload['type'] as String;

          if (type == 'accepted') {
            final recordId = p0.payload.payload['recordId'] as String;
            context.router.push(
              P12DetailRoute(recordId: recordId),
            );
          }
          break;

        // ignore: no_default_cases
        default:
          break;
      }
    });
    return context.watch<P10QuotePriceCubit>().state.when(
          success: (serviceList) {
            final transFee = serviceList.firstWhere(
              (e) => e.name == 'transFee',
            );
            final services = serviceList
                .where((element) => element.name != 'transFee')
                .toList();
            return Scaffold(
              appBar: AppBar(
                title: AutoSizeText(
                  l10n.serviceDetailLabel,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: AutoSizeText(
                                        l10n.transitFeeLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    AutoSizeText(
                                      context.formatMoney(transFee.price),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
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
                                  } else if (services[index].status ==
                                      'waiting') {
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  services[index].imageUrl ??
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              services[index].name == 'transFee'
                                                  ? l10n.feeOfTransportLabel
                                                  : services[index].name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: AutoSizeText(
                                                    services[index].price == -1
                                                        ? l10n
                                                            .needPriceQuotationLabel
                                                        : context.formatMoney(
                                                            services[index]
                                                                    .price +
                                                                (services[index]
                                                                        .products
                                                                        .isEmpty
                                                                    ? 0
                                                                    : services[
                                                                            index]
                                                                        .products
                                                                        .fold(
                                                                          0,
                                                                          (p, e) =>
                                                                              p +
                                                                              e.unitPrice * e.quantity,
                                                                        )),
                                                          ),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                if (services[index].status ==
                                                    'waiting')
                                                  NeedToVerifyItem(
                                                    key: UniqueKey(),
                                                    needToVerify:
                                                        services[index],
                                                    pendingAmount:
                                                        services.fold(
                                                      0,
                                                      (p, e) =>
                                                          p +
                                                          (e.price == -1
                                                              ? 0
                                                              : e.price) +
                                                          (e.products.isEmpty
                                                              ? 0
                                                              : e.products.first
                                                                      .unitPrice *
                                                                  e
                                                                      .products
                                                                      .first
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
                              ((e.price == -1 ? 0 : e.price) +
                                  (e.products.isEmpty
                                      ? 0
                                      : e.products.first.unitPrice *
                                          e.products.first.quantity)),
                        ) +
                        (transFee.status == 'pending'
                            ? transFee.price
                            : -transFee.price),
                  ),
                ],
              ),
            );
          },
          failure: UnknownFailure.new,
          initial: Container.new,
          loading: Loading.new,
        );
  }
}
