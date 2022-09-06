part of 'p16_finished_order_detail_bloc.dart';

@freezed
class P16FinishedOrderDetailState with _$P16FinishedOrderDetailState {
  const factory P16FinishedOrderDetailState.initial() = _Initial;
  const factory P16FinishedOrderDetailState.loadSuccess({
    required List<PendingServiceModel> services,
  }) = _success;
}
