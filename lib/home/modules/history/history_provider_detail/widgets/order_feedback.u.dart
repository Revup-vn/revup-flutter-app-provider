import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../l10n/l10n.dart';

class OrderFeedbackItem extends StatelessWidget {
  const OrderFeedbackItem({
    super.key,
    required this.rating,
    required this.feedback,
  });

  final int rating;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      height: 170,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 6,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                          child: Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                        ),
                        AutoSizeText(
                          l10n.serviceReviewsLabel,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ) ??
                                  const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: rating.toDouble(),
                  itemSize: 25,
                  allowHalfRating: true,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onRatingUpdate: print,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    child: Icon(
                      const IconData(
                        0xf04f,
                        fontFamily: 'MaterialIcons',
                      ),
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                  ),
                  AutoSizeText(
                    l10n.feedBackLabel,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ) ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      feedback.isEmpty || feedback == 'null' ? '' : feedback,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
