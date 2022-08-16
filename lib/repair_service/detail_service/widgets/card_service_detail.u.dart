import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:revup_core/core.dart';

import '../../../shared/shared.dart';

class ServiceProduct extends StatelessWidget {
  const ServiceProduct({
    super.key,
    required this.img,
    required this.serviceName,
    required this.priceRange,
    this.callback,
  });
  final String img;
  final String serviceName;
  final int priceRange;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      img.isEmpty ? kFallbackProductImg : img,
                                  height: 64,
                                  width: 64,
                                  fit: BoxFit.fill,
                                ),
                              ),
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
                                    serviceName,
                                    style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ) ??
                                        const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  AutoSizeText(
                                    context.formatMoney(
                                        context.formatMoney(priceRange)),
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: const IconButton(
                  icon: Icon(Icons.create),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
