part of 'detail_service_cubit.dart';

@freezed
class DetailServiceState with _$DetailServiceState {
  const factory DetailServiceState.initial() = _Initial;
  const factory DetailServiceState.changeActiveStatusSuccess({
    required bool status,
  }) = _Success;
}
