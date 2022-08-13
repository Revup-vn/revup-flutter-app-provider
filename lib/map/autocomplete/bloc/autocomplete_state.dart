part of 'autocomplete_bloc.dart';

@freezed
class AutocompleteState with _$AutocompleteState {
  const factory AutocompleteState.loading() = _Loading;
  const factory AutocompleteState.loaded({
    required List<PlaceAutocomplete> autocomplete,
  }) = _Loaded;
  const factory AutocompleteState.failure() = _Failure;
}
