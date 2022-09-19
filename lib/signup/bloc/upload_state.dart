part of 'upload_bloc.dart';

@freezed
class UploadState with _$UploadState {
  const factory UploadState.initial() = _Initial;
  const factory UploadState.choosePhotoSuccess({required List<File> file}) =
      _ChoosePhotoSuccess;
}
