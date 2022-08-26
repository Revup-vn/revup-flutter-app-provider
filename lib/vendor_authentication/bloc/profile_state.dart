part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.failure() = _Failure;
  const factory ProfileState.success() = _Success;

  const factory ProfileState.loadDataSuccess({
    required AppUser aUser,
  }) = _Loaded;
}
