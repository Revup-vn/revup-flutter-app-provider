part of 'service_suggestion_bloc.dart';

@freezed
class ServiceSuggestionEvent with _$ServiceSuggestionEvent {
  const factory ServiceSuggestionEvent.started() = _Started;
  const factory ServiceSuggestionEvent.selectProductCompleted({
    required Function0<void> onRoute,
    required List<ServiceData> saveLst,
    required String recordId,
  }) = _SelectProductCompleted;
}
