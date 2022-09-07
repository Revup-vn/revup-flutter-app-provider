import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../bloc/my_review_bloc.u.dart';
import '../models/rating_data.dart';
import '../widgets/card_review.u.dart';
import '../widgets/rating_start_item.u.dart';

class MyReviewView extends StatelessWidget {
  const MyReviewView({
    super.key,
    required this.reviews,
    required this.sortRatingStar,
  });

  final IList<RatingData> reviews;
  final int sortRatingStar;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SingleChildScrollView(
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
                      context.read<MyReviewBloc>().add(
                            const MyReviewEvent.sortButtonSelected(
                              sortStarRating: 0,
                            ),
                          );
                    },
                    onPressed: 0 == sortRatingStar,
                  ),
                  MyReviewItem(
                    numberOfStars: '5',
                    callback: () {
                      context.read<MyReviewBloc>().add(
                            const MyReviewEvent.sortButtonSelected(
                              sortStarRating: 5,
                            ),
                          );
                    },
                    onPressed: 5 == sortRatingStar,
                  ),
                  MyReviewItem(
                    numberOfStars: '4',
                    callback: () {
                      context.read<MyReviewBloc>().add(
                            const MyReviewEvent.sortButtonSelected(
                              sortStarRating: 4,
                            ),
                          );
                    },
                    onPressed: 4 == sortRatingStar,
                  ),
                  MyReviewItem(
                    numberOfStars: '3',
                    callback: () {
                      context.read<MyReviewBloc>().add(
                            const MyReviewEvent.sortButtonSelected(
                              sortStarRating: 3,
                            ),
                          );
                    },
                    onPressed: 3 == sortRatingStar,
                  ),
                  MyReviewItem(
                    numberOfStars: '2',
                    callback: () {
                      context.read<MyReviewBloc>().add(
                            const MyReviewEvent.sortButtonSelected(
                              sortStarRating: 2,
                            ),
                          );
                    },
                    onPressed: 2 == sortRatingStar,
                  ),
                  MyReviewItem(
                    numberOfStars: '1',
                    callback: () {
                      context.read<MyReviewBloc>().add(
                            const MyReviewEvent.sortButtonSelected(
                              sortStarRating: 1,
                            ),
                          );
                    },
                    onPressed: 1 == sortRatingStar,
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
    );
  }
}
