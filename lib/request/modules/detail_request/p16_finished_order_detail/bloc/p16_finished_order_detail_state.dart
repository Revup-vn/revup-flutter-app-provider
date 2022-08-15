part of 'p16_finished_order_detail_bloc.dart';

@freezed
class P16FinishedOrderDetailState with _$P16FinishedOrderDetailState {
  const factory P16FinishedOrderDetailState.initial() = _Initial;
  const factory P16FinishedOrderDetailState.loadSuccess({
    required List<PendingServiceModel> requests,
    required List<PaidServicesModel> bonuses,
  }) = _success;
  const factory P16FinishedOrderDetailState.loadFailure() = _failure;
  const factory P16FinishedOrderDetailState.loading() = _loading;
}
