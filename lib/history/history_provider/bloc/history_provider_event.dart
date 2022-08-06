part of 'history_provider_bloc.dart';

@freezed
class HistoryProviderEvent with _$HistoryProviderEvent {
  const factory HistoryProviderEvent.started() = _Started;
}
