part of 'list_service_bloc.dart';

@freezed
class ListServiceEvent with _$ListServiceEvent {
  const factory ListServiceEvent.started() = _Started;
  const factory ListServiceEvent.sortTypeChanged({required int sortType}) =
      _SortTypeChanged;
}
