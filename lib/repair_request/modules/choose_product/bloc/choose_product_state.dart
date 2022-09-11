part of 'choose_product_bloc.dart';

@freezed
class ChooseProductState with _$ChooseProductState {
  const factory ChooseProductState.initial() = _Initial;
  const factory ChooseProductState.loading() = _Loading;
  const factory ChooseProductState.failure() = _Failure;
  const factory ChooseProductState.success(List<RepairProduct> products) =
      _Success;
}
