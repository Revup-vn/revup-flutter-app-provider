part of 'permission_cubit.dart';

@freezed
class PermissionState with _$PermissionState {
  const factory PermissionState.denied() = _Denied;
  const factory PermissionState.granted() = _Granted;
}
