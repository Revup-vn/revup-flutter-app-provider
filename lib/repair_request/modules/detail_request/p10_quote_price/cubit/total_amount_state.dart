part of 'total_amount_cubit.dart';

@freezed
class TotalAmountState with _$TotalAmountState {
  // const factory TotalAmountState.initial({required int value}) = _Initial;
  const factory TotalAmountState.refresh({required int total}) = _Refresh;
}
