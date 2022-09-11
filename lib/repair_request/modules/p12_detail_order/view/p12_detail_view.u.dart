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
import '../bloc/p12_detail_bloc.dart';

class P12DetailView extends StatelessWidget {
  const P12DetailView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final blocPage = context.watch<P12DetailBloc>();
    blocPage.state.maybeWhen(
      initial: () => blocPage.add(const P12DetailEvent.fetched()),
      orElse: () => false,
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            l10n.underRepairLabel,
            maxLines: 1,
          ),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () => context.read<P12DetailBloc>().state.maybeWhen(
                    orElse: () => null,
                    populated: (services) => context.read<P12DetailBloc>().add(
                          P12DetailEvent.submitted(
                            (vehicle) => context.router.push(
                              P13SelectOptionCompleteRoute(
                                id: id,
                                services: services,
                                vehicle: vehicle,
                              ),
                            ),
                          ),
                        ),
                  ),
              child: Text(l10n.confirmLabel),
            )
          ],
        ),
        body: context.watch<P12DetailBloc>().state.when(
              initial: Container.new,
              loading: Loading.new,
              populated: (services) => Column(
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
                          (e.price == -1 ? 0 : e.price) +
                          (e.products.isEmpty
                              ? 0
                              : e.products.first.unitPrice *
                                  e.products.first.quantity),
                    ),
                  ),
                ],
              ),
              failure: UnknownFailure.new,
            ),
      ),
    );
  }
}
