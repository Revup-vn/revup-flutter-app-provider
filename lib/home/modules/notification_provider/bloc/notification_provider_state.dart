part of 'notification_provider_bloc.dart';

@freezed
class NotificationProviderState with _$NotificationProviderState {
  const factory NotificationProviderState.initial() = _Initial;
  const factory NotificationProviderState.loading() = _Loading;
  const factory NotificationProviderState.failure() = _Failure;
  const factory NotificationProviderState.success(
    List<NotificationProviderModel> notifications,
  ) = _Success;
}
