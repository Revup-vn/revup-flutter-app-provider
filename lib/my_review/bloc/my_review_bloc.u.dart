import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/rating_data.dart';

part 'my_review_bloc.u.freezed.dart';
part 'my_review_event.dart';
part 'my_review_state.dart';

class MyReviewBloc extends Bloc<MyReviewEvent, MyReviewState> {
  MyReviewBloc(
    this._userStore,
    this._repairRecord,
    this.storeRepository,
    this.providerID,
  ) : super(const _Initial()) {
    on<MyReviewEvent>(_onEvent);
  }
  final String providerID;
  final IStore<AppUser> _userStore;
  final StoreRepository storeRepository;
  final IStore<RepairRecord> _repairRecord;

  FutureOr<void> _onEvent(
    MyReviewEvent event,
    Emitter<MyReviewState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const MyReviewState.loading());
        final feedbackData = (await _repairRecord.where(
          'pid',
          isEqualTo: providerID,
        ))
            .map(
              (r) => r.map(
                (a) => a.maybeMap<
                    Future<Option<Tuple2<AppUser, Option<ReportFeedback>>>>>(
                  orElse: () => Future.value(none()),
                  finished: (v) async => some(
                    tuple2(
                      (await _userStore.get(v.cid)).fold<AppUser>(
                        (l) => throw NullThrownError(),
                        (r) => r,
                      ),
                      v.feedback != null ? some(v.feedback!) : none(),
                    ),
                  ),
                ),
              ),
            )
            .fold<
                IList<Future<Option<Tuple2<AppUser, Option<ReportFeedback>>>>>>(
              (l) => throw NullThrownError(),
              (r) => r,
            );

        final feedbacks = (await Future.wait(feedbackData.toIterable()))
            .where((e) => e.isSome())
            .map((e) => e.getOrElse(() => throw NullThrownError()))
            .map(
              (e) => e,
            );
        final listfb = ilist(feedbacks).filter((a) => a.value2.isSome()).map(
              (a) => tuple2(
                a.value1,
                a.value2.getOrElse(
                  () => throw NullThrownError(),
                ),
              ),
            );
        final listRating = listfb.map(
          (a) => RatingData.fromDtos(a.value1, a.value2),
        );
        emit(
          MyReviewState.loadDataSuccess(
            data: listRating,
            sortStarRating: 0,
          ),
        );
      },
      sortButtonSelected: (sortStarRating) async {
        emit(const MyReviewState.loading());

        final feedbackData = (await _repairRecord.where(
          'pid',
          isEqualTo: providerID,
        ))
            .map(
              (r) => r.map(
                (a) => a.maybeMap<
                    Future<Option<Tuple2<AppUser, Option<ReportFeedback>>>>>(
                  orElse: () => Future.value(none()),
                  finished: (v) async => some(
                    tuple2(
                      (await _userStore.get(v.cid)).fold<AppUser>(
                        (l) => throw NullThrownError(),
                        (r) => r,
                      ),
                      v.feedback != null ? some(v.feedback!) : none(),
                    ),
                  ),
                ),
              ),
            )
            .fold<
                IList<Future<Option<Tuple2<AppUser, Option<ReportFeedback>>>>>>(
              (l) => throw NullThrownError(),
              (r) => r,
            );

        final feedbacks = (await Future.wait(feedbackData.toIterable()))
            .where((e) => e.isSome())
            .map((e) => e.getOrElse(() => throw NullThrownError()))
            .map(
              (e) => e,
            );
        final listfb = ilist(feedbacks).filter((a) => a.value2.isSome()).map(
              (a) => tuple2(
                a.value1,
                a.value2.getOrElse(
                  () => throw NullThrownError(),
                ),
              ),
            );
        final listRating = listfb.map(
          (a) => RatingData.fromDtos(a.value1, a.value2),
        );

        if (sortStarRating == 0) {
          emit(
            MyReviewState.loadDataSuccess(
              data: listRating,
              sortStarRating: sortStarRating,
            ),
          );
        } else {
          emit(
            MyReviewState.loadDataSuccess(
              data: listRating.filter((a) => a.rating == sortStarRating),
              sortStarRating: sortStarRating,
            ),
          );
        }
      },
    );
  }
}
