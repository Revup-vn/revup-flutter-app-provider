part of 'dropdown_list_bloc.dart';

@freezed
class DropdownListEvent with _$DropdownListEvent {
  const factory DropdownListEvent.started() = _Started;
  const factory DropdownListEvent.dropdownChanged({required String value}) =
      _DropdownChanged;
}
