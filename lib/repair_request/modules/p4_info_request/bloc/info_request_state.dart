part of 'info_request_bloc.dart';

@freezed
class InfoRequestState with _$InfoRequestState {
  const factory InfoRequestState.initial() = _Initial;
  const factory InfoRequestState.loading() = _Loading;
  const factory InfoRequestState.failure() = _Failure;
  const factory InfoRequestState.success({
    required AppUser consumer,
    required double distance,
    required IList<PendingServiceModel> pendingService,
    required int pendingAmount,
    required IList<PaymentService> needToVerifyService,
    required PendingRepairRequest record,
  }) = _Success;
}
