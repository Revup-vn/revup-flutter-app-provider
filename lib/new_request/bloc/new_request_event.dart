part of 'new_request_bloc.dart';

@freezed
class NewRequestEvent with _$NewRequestEvent {
  const factory NewRequestEvent.started() = _Started;
  const factory NewRequestEvent.accepted(
      {required PendingRepairRequest record}) = _Accepted;
}
