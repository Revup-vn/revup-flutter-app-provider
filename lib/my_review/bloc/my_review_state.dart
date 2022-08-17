part of 'my_review_bloc.u.dart';

@freezed
class MyReviewState with _$MyReviewState {
  const factory MyReviewState.initial() = _Initial;
  const factory MyReviewState.loadDataSuccess({
    required IList<RatingData> data,
    required int sortStarRating,
  }) = _LoadDataSuccess;
  const factory MyReviewState.loading() = _Loading;
  const factory MyReviewState.failure() = _Failure;
}
