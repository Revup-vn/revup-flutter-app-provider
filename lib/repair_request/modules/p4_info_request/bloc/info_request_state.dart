part of 'info_request_bloc.dart';

@freezed
class InfoRequestState with _$InfoRequestState {
  const factory InfoRequestState.initial() = _Initial;
  const factory InfoRequestState.loading() = _Loading;
  const factory InfoRequestState.failure() = _Failure;
  const factory InfoRequestState.success({
    required IList<PaymentService> needToVerifyService,
    required PendingRepairRequest record,
    required int len,
    required bool isReady,
  }) = _Success;
}
