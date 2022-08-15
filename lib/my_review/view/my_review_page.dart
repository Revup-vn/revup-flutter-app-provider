import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../bloc/my_review_bloc.u.dart';
import 'my_review_builder.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage(this.providerID, {super.key});
  final String providerID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyReviewBloc(
        context.read(),
        context.read(),
        context.read(),
        providerID,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            context.l10n.myRatingLabel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: const MyReviewBuilder(),
      ),
    );
  }
}
