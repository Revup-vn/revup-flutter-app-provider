import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dropdown_list_bloc.freezed.dart';
part 'dropdown_list_event.dart';
part 'dropdown_list_state.dart';

class DropdownListBloc extends Bloc<DropdownListEvent, DropdownListState> {
  DropdownListBloc() : super(const _Initial()) {
    on<DropdownListEvent>(_onEvent);
  }
  FutureOr<void> _onEvent(
    DropdownListEvent event,
    Emitter<DropdownListState> emit,
  ) async {
    event.when(
      started: () => emit(const DropdownListState.initial()),
      dropdownChanged: (value) => emit(DropdownListState.success(value: value)),
    );
  }
}
