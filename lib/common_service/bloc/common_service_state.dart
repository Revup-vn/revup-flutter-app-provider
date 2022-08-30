part of 'common_service_bloc.dart';

@freezed
class CommonServiceState with _$CommonServiceState {
  const factory CommonServiceState.initial() = _Initial;
  const factory CommonServiceState.loading() = _Loading;
  const factory CommonServiceState.failure() = _Failure;
  const factory CommonServiceState.success({
    required List<CommonService> list,
    required String providerID,
  }) = _Success;
  const factory CommonServiceState.submitSuccess() = _SubmitSuccess;
}
