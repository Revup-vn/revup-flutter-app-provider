part of 'detail_service_request_bloc.u.dart';

@freezed
class DetailServiceRequestEvent with _$DetailServiceRequestEvent {
  const factory DetailServiceRequestEvent.started() = _Started;
}
