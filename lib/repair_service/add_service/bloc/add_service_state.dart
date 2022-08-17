part of 'add_service_bloc.dart';

@freezed
class AddServiceState with _$AddServiceState {
  const factory AddServiceState.initial() = _Initial;
  const factory AddServiceState.addServiceSuccess() = _AddServiceSuccess;
}
