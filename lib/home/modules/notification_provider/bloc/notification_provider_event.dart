part of 'notification_provider_bloc.dart';

@freezed
class NotificationProviderEvent with _$NotificationProviderEvent {
  const factory NotificationProviderEvent.started() = _Started;
}
