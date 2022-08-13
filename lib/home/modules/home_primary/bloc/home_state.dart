part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.changeActiveStatusSuccess({
    required bool status,
    required AppUser user,
  }) = _ChangeActiveStatusSuccess;
}
