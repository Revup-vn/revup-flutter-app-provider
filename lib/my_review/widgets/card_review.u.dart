import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../shared/shared.dart';
import '../models/models.dart';

class CardReview extends StatelessWidget {
  const CardReview({
    super.key,
    required this.data,
  });

  final ReviewModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO(namngoc231): Go to card detail
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
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: CachedNetworkImage(
                                  fadeInDuration:
                                      const Duration(milliseconds: 50),
                                  fadeOutDuration:
                                      const Duration(milliseconds: 50),
                                  imageUrl: data.user.urlImage,
                                  placeholder: (context, url) {
                                    return DefaultAvatar(
                                      textSize: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      userName: data.user.name,
                                    );
                                  },
                                  errorWidget: (context, url, dynamic error) {
                                    return DefaultAvatar(
                                      textSize: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      userName: data.user.name,
                                    );
                                  },
                                  height: 64,
                                  width: 64,
                                  fit: BoxFit.fitWidth,
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
                                    data.user.name,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: data.rating.toDouble(),
                                    itemSize: 20,
                                    allowHalfRating: true,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                    onRatingUpdate: (double value) {
                                      // TODO(namngoc231): rating
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        AutoSizeText(
                          data.comment,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: AutoSizeText(
                  '${DateTime.now().difference(data.commentedData).toString()}'
                  ' ngày trước',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
