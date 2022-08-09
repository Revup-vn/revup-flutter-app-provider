import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';

import '../../l10n/l10n.dart';
import '../models/models.dart';
import '../widgets/card_review.u.dart';
import '../widgets/rating_start_item.u.dart';

class MyReviewView extends StatelessWidget {
  const MyReviewView({
    super.key,
    required this.reviews,
  });

  final IList<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    // TODO(tcmhoang): Intl this page
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          l10n.myRatingLabel,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MyReviewItem(
                      numberOfStars: l10n.allRatingLabel,
                      callback: () {
                        // TODO(namngoc231): Go to list rating all start
                      },
                    ),
                    MyReviewItem(
                      numberOfStars: '5',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 5 start
                      },
                    ),
                    MyReviewItem(
                      numberOfStars: '4',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 4 start
                      },
                    ),
                    MyReviewItem(
                      numberOfStars: '3',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 3 start
                      },
                    ),
                    MyReviewItem(
                      numberOfStars: '2',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 2 start
                      },
                    ),
                    MyReviewItem(
                      numberOfStars: '1',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 1 start
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ...reviews.map((a) => CardReview(data: a)).toIterable(),
            ],
          ),
        ),
      ),
    );
  }
}
