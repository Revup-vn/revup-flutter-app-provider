part of 'my_review_bloc.u.dart';

@freezed
class MyReviewEvent with _$MyReviewEvent {
  const factory MyReviewEvent.started() = _Started;
  const factory MyReviewEvent.sortButtonSelected({
    required int sortStarRating,
  }) = _SortButtonSelected;
}
