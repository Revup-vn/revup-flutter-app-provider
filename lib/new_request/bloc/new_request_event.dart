part of 'new_request_bloc.dart';

@freezed
class NewRequestEvent with _$NewRequestEvent {
  const factory NewRequestEvent.started() = _Started;
  const factory NewRequestEvent.accepted({
    required PendingRepairRequest record,
    required Function0<void> onRoute,
    required Function1<String, Future<String>> sendMessage,
  }) = _Accepted;
  const factory NewRequestEvent.decline({
    required PendingRepairRequest record,
    required Function0<void> onRoute,
    required Function1<String, void> sendMessage,
  }) = _Decline;
}
