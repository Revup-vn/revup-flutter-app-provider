part of 'add_service_bloc.dart';

@freezed
class AddServiceEvent with _$AddServiceEvent {
  const factory AddServiceEvent.started() = _Started;
  const factory AddServiceEvent.submitted({required AddServiceModel data}) =
      _Submitted;
}
