import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../../shared/shared.dart';
import '../../models/servicerawdata.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.results,
    required this.keyword,
    required this.resultCount,
    required this.type,
    required this.providerID,
  });
  final String keyword;
  final int resultCount;
  final int type;
  final List<ServiceRawData> results;
  final String providerID;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText.rich(
                  TextSpan(
                    text: l10n.resultForLabel,
                    style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      if (keyword.isNotEmpty)
                        TextSpan(
                          text: ' "$keyword" ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                    ],
                  ),
                  maxLines: 1,
                  maxFontSize: 12,
                ),
                Text(
                  '$resultCount ${l10n.resultCountLabel}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ) ??
                      const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext buildContext, int index) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  child: ListBody(
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 9,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    type == 0
                                        ? context.router.push(
                                            DetailServiceRoute(
                                              providerID: providerID,
                                              serviceName: results[index].name,
                                              category: results[index].cate == 0
                                                  ? 'Xe máy'
                                                  : 'Oto',
                                            ),
                                          )
                                        : context.router.push(
                                            AddProductRoute(
                                              providerID: providerID,
                                              cate: results[index].cate == 0
                                                  ? 'Xe máy'
                                                  : 'Oto',
                                              sName: results[index].maybeMap(
                                                orElse: () => '',
                                                product: (value) => value.sName,
                                              ),
                                              pName: results[index].name,
                                              type: 1,
                                            ),
                                          );
                                  },
                                  leading: SizedBox(
                                    width: 54,
                                    height: 54,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(48),
                                      child: CircleAvatar(
                                        child: CachedNetworkImage(
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                          imageUrl:
                                              results[index].imgUrl.isEmpty
                                                  ? kFallbackImage
                                                  : results[index].imgUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: AutoSizeText(
                                    results[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  subtitle: results[index].map(
                                    product: (value) => AutoSizeText(
                                      context.formatMoney(value.fee),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      maxLines: 1,
                                    ),
                                    service: (value) => AutoSizeText(
                                      value.feeRange,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: results.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
