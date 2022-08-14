part of 'p12_detail_bloc.dart';

@freezed
class P12DetailState with _$P12DetailState {
  const factory P12DetailState.initial() = _Initial;

  const factory P12DetailState.loading() = _loading;

  const factory P12DetailState.populated({
    required List<PendingServiceModel> requests,
    required List<PaidServicesModel> bonuses,
  }) = _populated;

  const factory P12DetailState.failure() = _failure;
}
