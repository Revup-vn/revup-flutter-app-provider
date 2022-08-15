import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CartDetailServiceReview extends StatelessWidget {
  const CartDetailServiceReview({
    super.key,
    required this.img,
    required this.serviceName,
    required this.priceRange,
  });
  final Image img;
  final String serviceName;
  final String priceRange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO(namngoc231): Go to card detail
        // context.router.push(
        //   const AddServiceRoute(),
        // );
      },
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
                                child: img,
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
                                    priceRange,
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
