import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/fallbacks.dart';

class CartServiceReview extends StatelessWidget {
  const CartServiceReview({
    super.key,
    required this.imgUrl,
    required this.serviceName,
    required this.priceRange,
    required this.isActive,
    this.callback,
  });
  final String imgUrl;
  final String serviceName;
  final String priceRange;
  final bool isActive;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Card(
        color: isActive
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
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
                              fadeInDuration: const Duration(milliseconds: 50),
                              fadeOutDuration: const Duration(milliseconds: 50),
                              imageUrl:
                                  imgUrl.isEmpty ? kFallbackServiceImg : imgUrl,
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
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            serviceName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            priceRange,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.bodyText2,
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
                  icon: Icon(Icons.arrow_forward_ios),
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
