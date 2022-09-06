part of 'start_repair_bloc.dart';

@freezed
class StartRepairState with _$StartRepairState {
  const factory StartRepairState.initial() = _Initial;
  const factory StartRepairState.loading() = _Loading;
  const factory StartRepairState.failure() = _Failure;
  const factory StartRepairState.success({
    required IList<PaymentService> needToVerifyService,
    required PendingRepairRequest record,
    required int len,
    required bool isReady,
  }) = _Success;
}
