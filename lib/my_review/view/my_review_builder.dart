import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/loading.u.dart';
import '../bloc/my_review_bloc.u.dart';
import '../widgets/load_failure.u.dart';
import 'my_review_view.u.dart';

class MyReviewBuilder extends StatelessWidget {
  const MyReviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<MyReviewBloc>().state.maybeWhen(
          initial: () {
            return context
                .read<MyReviewBloc>()
                .add(const MyReviewEvent.started());
          },
          orElse: () => false,
        );
    return BlocBuilder<MyReviewBloc, MyReviewState>(
      builder: (context, state) => state.when(
        initial: Container.new,
        loadDataSuccess: (data, sortStarRating) => MyReviewView(
          reviews: data,
          sortRatingStar: sortStarRating,
        ),
        loading: Loading.new,
        failure: LoadFailure.new,
      ),
    );
  }
}
