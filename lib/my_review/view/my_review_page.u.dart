import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:revup_core/core.dart';

import '../widgets/card_review.u.dart';
import '../widgets/rating_start_item.u.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = AppUser.consumer(
      uuid: '1a',
      firstName: 'Nam',
      lastName: 'Ngoc',
      phone: '0866199497',
      dob: DateTime.now(),
      addr: 'Ninh Binh',
      email: 'namngoc231@gmail.com',
      active: true,
      avatarUrl:
          'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280s.jpg',
      createdTime: DateTime.now(),
      lastUpdatedTime: DateTime.now(),
      vac: const VideoCallAccount(
        id: '',
        username: '',
        pwd: '',
        email: '',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Đánh giá của tôi',
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
                    MyReviewtItem(
                      numberOfStars: 'Tất cả',
                      callback: () {
                        // TODO(namngoc231): Go to list rating all start
                      },
                    ),
                    MyReviewtItem(
                      numberOfStars: '5',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 5 start
                      },
                    ),
                    MyReviewtItem(
                      numberOfStars: '4',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 4 start
                      },
                    ),
                    MyReviewtItem(
                      numberOfStars: '3',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 3 start
                      },
                    ),
                    MyReviewtItem(
                      numberOfStars: '2',
                      callback: () {
                        // TODO(namngoc231): Go to list rating 2 start
                      },
                    ),
                    MyReviewtItem(
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
              CardReview(
                user: user,
                ratingStar: 4,
                comment: 'Thợ sửa tốt, có tâm',
              ),
              CardReview(
                user: user,
                ratingStar: 4,
                comment: 'Thợ sửa tốt, có tâm',
              ),
              CardReview(
                user: user,
                ratingStar: 4,
                comment: 'Thợ sửa tốt, có tâm',
              ),
              CardReview(
                user: user,
                ratingStar: 4,
                comment: 'Thợ sửa tốt, có tâm',
              ),
              CardReview(
                user: user,
                ratingStar: 4,
                comment: 'Thợ sửa tốt, có tâm',
              ),
              CardReview(
                user: user,
                ratingStar: 4,
                comment: 'Thợ sửa tốt, có tâm',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
