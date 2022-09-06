part of 'p10_quote_price_cubit.dart';

@freezed
class P10QuotePriceState with _$P10QuotePriceState {
  const factory P10QuotePriceState.initial() = _Initial;
  const factory P10QuotePriceState.loading() = _Loading;
  const factory P10QuotePriceState.failure() = _Failure;
  const factory P10QuotePriceState.success({
    required List<PendingServiceModel> services,
  }) = _Success;
}
