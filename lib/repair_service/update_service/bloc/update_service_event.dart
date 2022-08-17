part of 'update_service_bloc.dart';

@freezed
class UpdateServiceEvent with _$UpdateServiceEvent {
  const factory UpdateServiceEvent.started() = _Started;
  const factory UpdateServiceEvent.deleted() = _Deleted;
  const factory UpdateServiceEvent.submitted({
    required UpdateServiceModel model,
  }) = _Submitted;
}
