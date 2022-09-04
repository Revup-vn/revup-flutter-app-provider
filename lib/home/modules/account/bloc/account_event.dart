part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.started() = _Started;
  const factory AccountEvent.dataChanged({
    required QuerySnapshot<Map<String, dynamic>> data,
  }) = _DataChanged;
  const factory AccountEvent.imageUploadSelected({
    required ImageSource source,
  }) = _ImageUploadSelected;
}
