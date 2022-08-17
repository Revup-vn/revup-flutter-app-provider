part of 'detail_service_bloc.dart';

@freezed
class DetailServiceEvent with _$DetailServiceEvent {
  const factory DetailServiceEvent.started() = _Started;
}
