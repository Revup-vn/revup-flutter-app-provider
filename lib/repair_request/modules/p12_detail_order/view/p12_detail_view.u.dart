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
            style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold) ??
                const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
              populated: (services) {
                final transFee = services.firstWhere(
                  (e) => e.name == 'transFee',
                );
                final filterLst = services
                    .where((element) => element.name != 'transFee')
                    .toList();
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      AutoSizeText(
                                        l10n.serviceRequestLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.add_box_outlined,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                        onPressed: () {
                                          context.router.push(
                                            ServiceSuggestionRoute(
                                              recordId: id,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
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
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                  itemCount: filterLst.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var statusLabel = l10n.pendingLabel;
                                    var statusColor = Colors.blueAccent;
                                    if (filterLst[index].status == 'paid') {
                                      statusLabel = l10n.paidLabel;
                                      statusColor = Colors.greenAccent;
                                    } else if (filterLst[index].status ==
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
                                                    filterLst[index].imageUrl ??
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
                                                filterLst[index].name,
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
                                                      filterLst[index].price ==
                                                              -1
                                                          ? l10n
                                                              .needPriceQuotationLabel
                                                          : context.formatMoney(
                                                              filterLst[index]
                                                                      .price +
                                                                  (filterLst[index]
                                                                          .products
                                                                          .isEmpty
                                                                      ? 0
                                                                      : filterLst[
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
                                                  if (filterLst[index].status ==
                                                      'waiting')
                                                    NeedToVerifyItem(
                                                      key: UniqueKey(),
                                                      needToVerify:
                                                          filterLst[index],
                                                      pendingAmount:
                                                          filterLst.fold(
                                                        0,
                                                        (p, e) =>
                                                            p +
                                                            (e.price == -1
                                                                ? 0
                                                                : e.price) +
                                                            (e.products.isEmpty
                                                                ? 0
                                                                : e
                                                                        .products
                                                                        .first
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
                                                '''${l10n.productLabel}: ${filterLst[index].products.isEmpty ? l10n.noneLabel : ('${filterLst[index].products.first.name} x ${filterLst[index].products.first.quantity}')}''',
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
                );
              },
              failure: UnknownFailure.new,
            ),
      ),
    );
  }
}
