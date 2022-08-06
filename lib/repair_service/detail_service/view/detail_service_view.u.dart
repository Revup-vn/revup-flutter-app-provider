import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../widgets/card_service_detail.u.dart';

class DetailServiceView extends StatelessWidget {
  const DetailServiceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(tcmhoang): Intl this file and parametalized
    // all the harded code value
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Chi tiết dịch vụ',
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
            child: const Text('Chỉnh sửa'),
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
                                'assets/screens/ball.png',
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
                              'Thay lốp',
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
                              'Tiền công: 20.000đ',
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
                              'Chỉnh sửa cuối: 25/6/2022',
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
                      'Loại sản phẩm',
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
                    child: const Text('Thêm mới'),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CartDetailServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Lốp xe Jupiter',
                priceRange: '80.000đ / cái',
              ),
              CartDetailServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Lốp xe Lead',
                priceRange: '180.000đ / cái',
              ),
              CartDetailServiceReview(
                img: Image.asset(
                  'assets/screens/ball.png',
                  height: 50,
                  width: 50,
                ),
                serviceName: 'Lốp xe Wave RSX',
                priceRange: '280.000đ / cái',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
