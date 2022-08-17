part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started({required double lat, required double lng}) =
      _Started;
  const factory HomeEvent.changeActiveStatus({
    required bool status,
    required String providerID,
  }) = _ChangeActiveStatus;
}
