part of 'common_service_cubit.dart';

@freezed
class CommonServiceCubitState with _$CommonServiceCubitState {
  const factory CommonServiceCubitState.initial() = _Initial;
  const factory CommonServiceCubitState.uploadImageSuccess({
    required IList<Either<StorageFailure, String>> eitherFailuresOrUrls,
  }) = _UploadImageSuccess;
  const factory CommonServiceCubitState.failure() = _Failure;
  const factory CommonServiceCubitState.running() = _Running;
}
