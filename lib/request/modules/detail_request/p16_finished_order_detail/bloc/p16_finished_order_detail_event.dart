part of 'p16_finished_order_detail_bloc.dart';

@freezed
class P16FinishedOrderDetailEvent with _$P16FinishedOrderDetailEvent {
  const factory P16FinishedOrderDetailEvent.started() = _Started;
  const factory P16FinishedOrderDetailEvent.populateData() = _fetchedData;
}
