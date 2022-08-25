part of 'upload_image_cubit.u.dart';

@freezed
class UploadImageCubitState with _$UploadImageCubitState {
  const factory UploadImageCubitState.initial() = _Initial;
  const factory UploadImageCubitState.uploadImageSuccess({
    required IList<Either<StorageFailure, String>> eitherFailuresOrUrls,
  }) = _UploadImageSuccess;
  const factory UploadImageCubitState.failure() = _Failure;
  const factory UploadImageCubitState.running() = _Running;
}
