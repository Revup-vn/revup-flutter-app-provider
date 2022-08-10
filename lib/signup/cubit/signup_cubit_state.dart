part of 'signup_cubit.u.dart';

@freezed
class SignupCubitState with _$SignupCubitState {
  const factory SignupCubitState.initial() = _Initial;
  const factory SignupCubitState.uploadImageSuccess({
    required IList<Either<StorageFailure, String>> eitherFailuresOrUrls,
  }) = _UploadImageSuccess;
  const factory SignupCubitState.failure() = _Failure;
  const factory SignupCubitState.running() = _Running;
}
