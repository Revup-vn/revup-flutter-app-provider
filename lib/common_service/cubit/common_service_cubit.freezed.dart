// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'common_service_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonServiceCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)
        uploadImageSuccess,
    required TResult Function() failure,
    required TResult Function() running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Running value) running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonServiceCubitStateCopyWith<$Res> {
  factory $CommonServiceCubitStateCopyWith(CommonServiceCubitState value,
          $Res Function(CommonServiceCubitState) then) =
      _$CommonServiceCubitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommonServiceCubitStateCopyWithImpl<$Res>
    implements $CommonServiceCubitStateCopyWith<$Res> {
  _$CommonServiceCubitStateCopyWithImpl(this._value, this._then);

  final CommonServiceCubitState _value;
  // ignore: unused_field
  final $Res Function(CommonServiceCubitState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CommonServiceCubitStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CommonServiceCubitState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)
        uploadImageSuccess,
    required TResult Function() failure,
    required TResult Function() running,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Running value) running,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CommonServiceCubitState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_UploadImageSuccessCopyWith<$Res> {
  factory _$$_UploadImageSuccessCopyWith(_$_UploadImageSuccess value,
          $Res Function(_$_UploadImageSuccess) then) =
      __$$_UploadImageSuccessCopyWithImpl<$Res>;
  $Res call({IList<Either<StorageFailure, String>> eitherFailuresOrUrls});
}

/// @nodoc
class __$$_UploadImageSuccessCopyWithImpl<$Res>
    extends _$CommonServiceCubitStateCopyWithImpl<$Res>
    implements _$$_UploadImageSuccessCopyWith<$Res> {
  __$$_UploadImageSuccessCopyWithImpl(
      _$_UploadImageSuccess _value, $Res Function(_$_UploadImageSuccess) _then)
      : super(_value, (v) => _then(v as _$_UploadImageSuccess));

  @override
  _$_UploadImageSuccess get _value => super._value as _$_UploadImageSuccess;

  @override
  $Res call({
    Object? eitherFailuresOrUrls = freezed,
  }) {
    return _then(_$_UploadImageSuccess(
      eitherFailuresOrUrls: eitherFailuresOrUrls == freezed
          ? _value.eitherFailuresOrUrls
          : eitherFailuresOrUrls // ignore: cast_nullable_to_non_nullable
              as IList<Either<StorageFailure, String>>,
    ));
  }
}

/// @nodoc

class _$_UploadImageSuccess implements _UploadImageSuccess {
  const _$_UploadImageSuccess({required this.eitherFailuresOrUrls});

  @override
  final IList<Either<StorageFailure, String>> eitherFailuresOrUrls;

  @override
  String toString() {
    return 'CommonServiceCubitState.uploadImageSuccess(eitherFailuresOrUrls: $eitherFailuresOrUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadImageSuccess &&
            const DeepCollectionEquality()
                .equals(other.eitherFailuresOrUrls, eitherFailuresOrUrls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(eitherFailuresOrUrls));

  @JsonKey(ignore: true)
  @override
  _$$_UploadImageSuccessCopyWith<_$_UploadImageSuccess> get copyWith =>
      __$$_UploadImageSuccessCopyWithImpl<_$_UploadImageSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)
        uploadImageSuccess,
    required TResult Function() failure,
    required TResult Function() running,
  }) {
    return uploadImageSuccess(eitherFailuresOrUrls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
  }) {
    return uploadImageSuccess?.call(eitherFailuresOrUrls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
    required TResult orElse(),
  }) {
    if (uploadImageSuccess != null) {
      return uploadImageSuccess(eitherFailuresOrUrls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Running value) running,
  }) {
    return uploadImageSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
  }) {
    return uploadImageSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) {
    if (uploadImageSuccess != null) {
      return uploadImageSuccess(this);
    }
    return orElse();
  }
}

abstract class _UploadImageSuccess implements CommonServiceCubitState {
  const factory _UploadImageSuccess(
      {required final IList<Either<StorageFailure, String>>
          eitherFailuresOrUrls}) = _$_UploadImageSuccess;

  IList<Either<StorageFailure, String>> get eitherFailuresOrUrls;
  @JsonKey(ignore: true)
  _$$_UploadImageSuccessCopyWith<_$_UploadImageSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$CommonServiceCubitStateCopyWithImpl<$Res>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, (v) => _then(v as _$_Failure));

  @override
  _$_Failure get _value => super._value as _$_Failure;
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure();

  @override
  String toString() {
    return 'CommonServiceCubitState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Failure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)
        uploadImageSuccess,
    required TResult Function() failure,
    required TResult Function() running,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Running value) running,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CommonServiceCubitState {
  const factory _Failure() = _$_Failure;
}

/// @nodoc
abstract class _$$_RunningCopyWith<$Res> {
  factory _$$_RunningCopyWith(
          _$_Running value, $Res Function(_$_Running) then) =
      __$$_RunningCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RunningCopyWithImpl<$Res>
    extends _$CommonServiceCubitStateCopyWithImpl<$Res>
    implements _$$_RunningCopyWith<$Res> {
  __$$_RunningCopyWithImpl(_$_Running _value, $Res Function(_$_Running) _then)
      : super(_value, (v) => _then(v as _$_Running));

  @override
  _$_Running get _value => super._value as _$_Running;
}

/// @nodoc

class _$_Running implements _Running {
  const _$_Running();

  @override
  String toString() {
    return 'CommonServiceCubitState.running()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Running);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)
        uploadImageSuccess,
    required TResult Function() failure,
    required TResult Function() running,
  }) {
    return running();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
  }) {
    return running?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            IList<Either<StorageFailure, String>> eitherFailuresOrUrls)?
        uploadImageSuccess,
    TResult Function()? failure,
    TResult Function()? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Running value) running,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_Failure value)? failure,
    TResult Function(_Running value)? running,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class _Running implements CommonServiceCubitState {
  const factory _Running() = _$_Running;
}
