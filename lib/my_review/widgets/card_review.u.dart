import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../l10n/l10n.dart';
import '../../shared/shared.dart';
import '../models/rating_data.dart';

class CardReview extends StatelessWidget {
  const CardReview({
    super.key,
    required this.data,
  });

  final RatingData data;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return InkWell(
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
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: CachedNetworkImage(
                                  imageUrl: data.imageUrl,
                                  placeholder: (context, url) {
                                    return DefaultAvatar(
                                      textSize: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      userName: data.consumerName,
                                    );
                                  },
                                  errorWidget: (context, url, dynamic error) {
                                    return DefaultAvatar(
                                      textSize: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      userName: data.consumerName,
                                    );
                                  },
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
                                    data.consumerName,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    initialRating: data.rating.toDouble(),
                                    itemSize: 20,
                                    allowHalfRating: true,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                    onRatingUpdate: (double value) {},
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
                          data.description,
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
                  (Duration(
                                milliseconds:
                                    DateTime.now().millisecondsSinceEpoch -
                                        data.createdTime.millisecondsSinceEpoch,
                              ).inHours) /
                              24 <
                          1
                      ? Duration(
                                milliseconds:
                                    DateTime.now().millisecondsSinceEpoch -
                                        data.createdTime.millisecondsSinceEpoch,
                              ).inHours >
                              1
                          ? '''
${Duration(
                              milliseconds:
                                  DateTime.now().millisecondsSinceEpoch -
                                      data.createdTime.millisecondsSinceEpoch,
                            ).inHours} ${context.l10n.hoursAgoLabel}'''
                          : context.l10n.todayLabel
                      : '''
${(Duration(
                            milliseconds:
                                DateTime.now().millisecondsSinceEpoch -
                                    data.createdTime.millisecondsSinceEpoch,
                          ).inHours) / 24} ${context.l10n.yesterdayLabel}''',
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
