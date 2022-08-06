part of 'history_provider_bloc.dart';

@freezed
class HistoryProviderState with _$HistoryProviderState {
  const factory HistoryProviderState.initial() = _Initial;
  const factory HistoryProviderState.loading() = _Loading;
  const factory HistoryProviderState.failure() = _Failure;
  const factory HistoryProviderState.success(
    List<HistoryProviderModel> histories,
  ) = _Success;
}
