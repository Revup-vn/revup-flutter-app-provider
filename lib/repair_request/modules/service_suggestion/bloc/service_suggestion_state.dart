part of 'service_suggestion_bloc.dart';

@freezed
class ServiceSuggestionState with _$ServiceSuggestionState {
  const factory ServiceSuggestionState.initial() = _Initial;
  const factory ServiceSuggestionState.loading() = _Loading;
  const factory ServiceSuggestionState.failure() = _Failure;
  const factory ServiceSuggestionState.success({
    required List<ServiceData> repairService,
  }) = _Success;
}
