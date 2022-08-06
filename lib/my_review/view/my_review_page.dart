import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'my_review_view.u.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyReviewView(reviews: nil());
  }
}
