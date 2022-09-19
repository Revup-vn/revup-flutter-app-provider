part of 'upload_bloc.dart';

@freezed
class UploadEvent with _$UploadEvent {
  const factory UploadEvent.started() = _Started;
  const factory UploadEvent.imageUploadSelected({
    required ImageSource source,
    required List<File> currentListStorage,
    required int typeUpload,
  }) = _ImageUploadSelected;
}
