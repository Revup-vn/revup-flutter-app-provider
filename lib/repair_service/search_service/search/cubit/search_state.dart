part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.empty({
    required String keyword,
    required int resultCount,
  }) = _Empty;
  const factory SearchState.result({
    required String keyword,
    required int resultCount,
    required int type,
    required List<ServiceRawData> results,
  }) = _Success;
}
