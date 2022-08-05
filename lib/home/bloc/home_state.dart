part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.failure() = _Failure;
  const factory HomeState.success({
    required ProviderModel provider,
    required IVector<String> imgs,
    required String timeRepair,
    required String dayRepair,
  }) = _Success;
}
