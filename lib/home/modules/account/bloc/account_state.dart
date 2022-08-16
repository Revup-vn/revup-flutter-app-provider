part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.loading() = _Loading;
  const factory AccountState.failure() = _Failure;
  const factory AccountState.success({
    required AppUser aUser,
    required double rating,
    required String newImgUrl,
  }) = _Success;
}
