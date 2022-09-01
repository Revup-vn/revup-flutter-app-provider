part of 'home_primary_cubit.dart';

@freezed
class HomePrimaryState with _$HomePrimaryState {
  const factory HomePrimaryState.initial() = _Initial;
  const factory HomePrimaryState.loaded({
    required AppUser user,
  }) = _Loaded;
  const factory HomePrimaryState.loading() = _Loading;
}
