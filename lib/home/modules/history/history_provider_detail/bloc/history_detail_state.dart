part of 'history_detail_bloc.u.dart';

@freezed
class HistoryProviderDetailState with _$HistoryProviderDetailState {
  const factory HistoryProviderDetailState.initial() = _Initial;
  const factory HistoryProviderDetailState.loading() = _Loading;
  const factory HistoryProviderDetailState.failure() = _Failure;
  const factory HistoryProviderDetailState.success({
    required HistoryDetailModel model,
    required String cid,
  }) = _Success;
}
