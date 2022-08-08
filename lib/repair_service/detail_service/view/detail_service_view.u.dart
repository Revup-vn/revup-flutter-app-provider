import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../../l10n/l10n.dart';
import '../widgets/card_service_detail.u.dart';

class DetailServiceView extends StatelessWidget {
  const DetailServiceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(tcmhoang): Intl this file and parametalized
    // all the harded code value
    final l10n = context.l10n;

    const nameService = 'Thay lốp';
    const price = '50.000';
    const date = '25/6/2022';
    const productTypeName = 'Lốp xe Lead';
    const unit = 'cái';
    // TODO(tcmhoang): change this asset to a more general image
    // and Use `Assets` class instead of using a path
    const image = '';

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          l10n.serviceDetailsAppBarTitle,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              // TODO(namngoc231): cancel
            },
            child: Text(l10n.editProfileLabel),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                              child: Image.asset(
                                image,
                                height: 50,
                                width: 50,
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
                              nameService,
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
                              '${l10n.wageLabel}: $priceđ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              '${l10n.lastEditLabel}: $date',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
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
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // TODO(namngoc231): quote
                    },
                    child: Text(l10n.addLabel),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CartDetailServiceReview(
                img: Image.asset(
                  image,
                  height: 50,
                  width: 50,
                ),
                serviceName: productTypeName,
                priceRange: '$priceđ / $unit',
              ),
              CartDetailServiceReview(
                img: Image.asset(
                  image,
                  height: 50,
                  width: 50,
                ),
                serviceName: productTypeName,
                priceRange: '$priceđ / $unit',
              ),
              CartDetailServiceReview(
                img: Image.asset(
                  image,
                  height: 50,
                  width: 50,
                ),
                serviceName: productTypeName,
                priceRange: '$priceđ / $unit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
