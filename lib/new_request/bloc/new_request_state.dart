part of 'new_request_bloc.dart';

@freezed
class NewRequestState with _$NewRequestState {
  const factory NewRequestState.initial() = _Initial;
  const factory NewRequestState.loading() = _Loading;
  const factory NewRequestState.failure() = _Failure;
  const factory NewRequestState.success({
    required Directions directions,
    required Marker fromMarker,
    required Marker toMarker,
    required AppUser consumer,
    required PendingRepairRequest record,
    required List<PendingServiceModel> pendingService,
    required List<NeedToVerifyModel> needToVerifyService,
    required int pendingAmount,
  }) = _Success;
}
