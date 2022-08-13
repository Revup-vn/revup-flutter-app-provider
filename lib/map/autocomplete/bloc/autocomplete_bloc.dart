import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../map_api/map_api.dart';
import '../../models/place_autocomplete_model.dart';

part 'autocomplete_bloc.freezed.dart';
part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  AutocompleteBloc() : super(const AutocompleteState.loading()) {
    on<AutocompleteEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    AutocompleteEvent event,
    Emitter<AutocompleteState> emit,
  ) async {
    await event.when(
      started: (searchInput, location) async {
        final sessionToken = const Uuid().v4();
        final autocomplete = await getAutocomplete(
          searchInput,
          sessionToken,
          location,
        );
        emit(AutocompleteState.loaded(autocomplete: autocomplete));
      },
      clear: () {
        emit(AutocompleteState.loaded(autocomplete: List.empty()));
      },
    );
  }
}
