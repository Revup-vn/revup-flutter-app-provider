part of 'analytics_bloc.dart';

@freezed
class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState.initial() = _Initial;
  const factory AnalyticsState.loading() = _Loading;
  const factory AnalyticsState.failure() = _Failure;
  const factory AnalyticsState.loadDataSuccess({
    required List<int> x1,
    required List<int> x2,
    required int total,
  }) = _LoadDataSuccess;
}
