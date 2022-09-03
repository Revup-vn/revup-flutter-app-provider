part of 'home_primary_cubit.dart';

@freezed
class HomePrimaryState with _$HomePrimaryState {
  const factory HomePrimaryState.initial({
    required IVector<String> ads,
  }) = _Initial;
  const factory HomePrimaryState.loaded({
    required AppUser user,
    required RecentOrderData recentOrder,
    required IList<MyServiceData> listService,
    required IVector<String> ads,
  }) = _Loaded;
  const factory HomePrimaryState.recentOrderEmpty({
    required AppUser user,
    required IList<MyServiceData> listService,
    required IVector<String> ads,
  }) = _OrderEmpty;
  const factory HomePrimaryState.loading() = _Loading;
}
