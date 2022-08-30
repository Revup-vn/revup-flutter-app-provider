part of 'common_service_bloc.dart';

@freezed
class CommonServiceEvent with _$CommonServiceEvent {
  const factory CommonServiceEvent.started() = _Started;
  const factory CommonServiceEvent.submited() = _Submited;
}
