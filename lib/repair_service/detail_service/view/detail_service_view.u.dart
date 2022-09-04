import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' hide showSearch;
import 'package:revup_core/core.dart';

import '../../../l10n/l10n.dart';
import '../../../router/router.dart';
import '../../../shared/shared.dart';
import '../../../shared/widgets/search_custom.dart';
import '../../search_service/search/cubit/search_cubit.dart';
import '../../search_service/search/view/provider_search.dart';
import '../widgets/card_service_detail.u.dart';

class DetailServiceView extends StatelessWidget {
  const DetailServiceView({
    required this.service,
    required this.listProduct,
    required this.providerID,
    required this.cate,
    required this.searchCubit,
    super.key,
  });
  final RepairService service;
  final IList<RepairProduct> listProduct;
  final String providerID;
  final String cate;
  final SearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final listData = listProduct.toList();
    final serAvt = service.img ?? '';
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(48),
                            child: CachedNetworkImage(
                              imageUrl:
                                  serAvt.isEmpty ? kFallbackServiceImg : serAvt,
                              height: 64,
                              width: 64,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AutoSizeText(
                            service.name,
                            style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ) ??
                                const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            '${l10n.wageLabel}: ${context.formatMoney(
                              service.fee,
                            )}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: AutoSizeText(
                    l10n.productTypeLabel,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ProviderSearch(
                        1,
                        cate == 'Xe máy' ? 0 : 1,
                        service.name,
                        searchBloc: searchCubit,
                        hintText: context.l10n.searchLabel,
                        searchFieldStyle:
                            Theme.of(context).textTheme.bodyMedium,
                      ),
                      useRootNavigator: false,
                    );
                  },
                  icon: const Icon(Icons.search_rounded),
                  iconSize: 24,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    context.router.push(
                      AddProductRoute(
                        providerID: providerID,
                        cate: cate,
                        sName: service.name,
                        pName: '',
                        type: 0,
                      ),
                    );
                  },
                  child: Text(l10n.addLabel),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (listData.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: listData.length,
                itemBuilder: (context, index) => ServiceProduct(
                  img: listData[index].img,
                  serviceName: listData[index].name,
                  priceRange: listData[index].price,
                  callback: () {
                    context.router.push(
                      AddProductRoute(
                        providerID: providerID,
                        cate: cate,
                        sName: service.name,
                        pName: listData[index].name,
                        type: 1,
                      ),
                    );
                  },
                ),
              )
            else
              Center(
                child: AutoSizeText(
                  l10n.emptyLabel,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
