// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_service_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateServiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UpdateServiceModel model) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UpdateServiceModel model)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UpdateServiceModel model)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateServiceEventCopyWith<$Res> {
  factory $UpdateServiceEventCopyWith(
          UpdateServiceEvent value, $Res Function(UpdateServiceEvent) then) =
      _$UpdateServiceEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UpdateServiceEventCopyWithImpl<$Res>
    implements $UpdateServiceEventCopyWith<$Res> {
  _$UpdateServiceEventCopyWithImpl(this._value, this._then);

  final UpdateServiceEvent _value;
  // ignore: unused_field
  final $Res Function(UpdateServiceEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$UpdateServiceEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'UpdateServiceEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UpdateServiceModel model) submitted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UpdateServiceModel model)? submitted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UpdateServiceModel model)? submitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submitted value) submitted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UpdateServiceEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_SubmittedCopyWith<$Res> {
  factory _$$_SubmittedCopyWith(
          _$_Submitted value, $Res Function(_$_Submitted) then) =
      __$$_SubmittedCopyWithImpl<$Res>;
  $Res call({UpdateServiceModel model});

  $UpdateServiceModelCopyWith<$Res> get model;
}

/// @nodoc
class __$$_SubmittedCopyWithImpl<$Res>
    extends _$UpdateServiceEventCopyWithImpl<$Res>
    implements _$$_SubmittedCopyWith<$Res> {
  __$$_SubmittedCopyWithImpl(
      _$_Submitted _value, $Res Function(_$_Submitted) _then)
      : super(_value, (v) => _then(v as _$_Submitted));

  @override
  _$_Submitted get _value => super._value as _$_Submitted;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$_Submitted(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as UpdateServiceModel,
    ));
  }

  @override
  $UpdateServiceModelCopyWith<$Res> get model {
    return $UpdateServiceModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value));
    });
  }
}

/// @nodoc

class _$_Submitted implements _Submitted {
  const _$_Submitted({required this.model});

  @override
  final UpdateServiceModel model;

  @override
  String toString() {
    return 'UpdateServiceEvent.submitted(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Submitted &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$_SubmittedCopyWith<_$_Submitted> get copyWith =>
      __$$_SubmittedCopyWithImpl<_$_Submitted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UpdateServiceModel model) submitted,
  }) {
    return submitted(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UpdateServiceModel model)? submitted,
  }) {
    return submitted?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UpdateServiceModel model)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements UpdateServiceEvent {
  const factory _Submitted({required final UpdateServiceModel model}) =
      _$_Submitted;

  UpdateServiceModel get model;
  @JsonKey(ignore: true)
  _$$_SubmittedCopyWith<_$_Submitted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UpdateServiceModel model) loadDataSuccess,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function() sumbitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadDataSuccess value) loadDataSuccess,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SumbitSuccess value) sumbitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateServiceStateCopyWith<$Res> {
  factory $UpdateServiceStateCopyWith(
          UpdateServiceState value, $Res Function(UpdateServiceState) then) =
      _$UpdateServiceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UpdateServiceStateCopyWithImpl<$Res>
    implements $UpdateServiceStateCopyWith<$Res> {
  _$UpdateServiceStateCopyWithImpl(this._value, this._then);

  final UpdateServiceState _value;
  // ignore: unused_field
  final $Res Function(UpdateServiceState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$UpdateServiceStateCopyWithImpl<$Res>
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
    return 'UpdateServiceState.initial()';
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
    required TResult Function(UpdateServiceModel model) loadDataSuccess,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function() sumbitSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
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
    required TResult Function(_LoadDataSuccess value) loadDataSuccess,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SumbitSuccess value) sumbitSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UpdateServiceState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadDataSuccessCopyWith<$Res> {
  factory _$$_LoadDataSuccessCopyWith(
          _$_LoadDataSuccess value, $Res Function(_$_LoadDataSuccess) then) =
      __$$_LoadDataSuccessCopyWithImpl<$Res>;
  $Res call({UpdateServiceModel model});

  $UpdateServiceModelCopyWith<$Res> get model;
}

/// @nodoc
class __$$_LoadDataSuccessCopyWithImpl<$Res>
    extends _$UpdateServiceStateCopyWithImpl<$Res>
    implements _$$_LoadDataSuccessCopyWith<$Res> {
  __$$_LoadDataSuccessCopyWithImpl(
      _$_LoadDataSuccess _value, $Res Function(_$_LoadDataSuccess) _then)
      : super(_value, (v) => _then(v as _$_LoadDataSuccess));

  @override
  _$_LoadDataSuccess get _value => super._value as _$_LoadDataSuccess;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$_LoadDataSuccess(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as UpdateServiceModel,
    ));
  }

  @override
  $UpdateServiceModelCopyWith<$Res> get model {
    return $UpdateServiceModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value));
    });
  }
}

/// @nodoc

class _$_LoadDataSuccess implements _LoadDataSuccess {
  const _$_LoadDataSuccess({required this.model});

  @override
  final UpdateServiceModel model;

  @override
  String toString() {
    return 'UpdateServiceState.loadDataSuccess(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadDataSuccess &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$$_LoadDataSuccessCopyWith<_$_LoadDataSuccess> get copyWith =>
      __$$_LoadDataSuccessCopyWithImpl<_$_LoadDataSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UpdateServiceModel model) loadDataSuccess,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function() sumbitSuccess,
  }) {
    return loadDataSuccess(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
  }) {
    return loadDataSuccess?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
    required TResult orElse(),
  }) {
    if (loadDataSuccess != null) {
      return loadDataSuccess(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadDataSuccess value) loadDataSuccess,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SumbitSuccess value) sumbitSuccess,
  }) {
    return loadDataSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
  }) {
    return loadDataSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
    required TResult orElse(),
  }) {
    if (loadDataSuccess != null) {
      return loadDataSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadDataSuccess implements UpdateServiceState {
  const factory _LoadDataSuccess({required final UpdateServiceModel model}) =
      _$_LoadDataSuccess;

  UpdateServiceModel get model;
  @JsonKey(ignore: true)
  _$$_LoadDataSuccessCopyWith<_$_LoadDataSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$UpdateServiceStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'UpdateServiceState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UpdateServiceModel model) loadDataSuccess,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function() sumbitSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadDataSuccess value) loadDataSuccess,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SumbitSuccess value) sumbitSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UpdateServiceState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$UpdateServiceStateCopyWithImpl<$Res>
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
    return 'UpdateServiceState.failure()';
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
    required TResult Function(UpdateServiceModel model) loadDataSuccess,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function() sumbitSuccess,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
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
    required TResult Function(_LoadDataSuccess value) loadDataSuccess,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SumbitSuccess value) sumbitSuccess,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements UpdateServiceState {
  const factory _Failure() = _$_Failure;
}

/// @nodoc
abstract class _$$_SumbitSuccessCopyWith<$Res> {
  factory _$$_SumbitSuccessCopyWith(
          _$_SumbitSuccess value, $Res Function(_$_SumbitSuccess) then) =
      __$$_SumbitSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SumbitSuccessCopyWithImpl<$Res>
    extends _$UpdateServiceStateCopyWithImpl<$Res>
    implements _$$_SumbitSuccessCopyWith<$Res> {
  __$$_SumbitSuccessCopyWithImpl(
      _$_SumbitSuccess _value, $Res Function(_$_SumbitSuccess) _then)
      : super(_value, (v) => _then(v as _$_SumbitSuccess));

  @override
  _$_SumbitSuccess get _value => super._value as _$_SumbitSuccess;
}

/// @nodoc

class _$_SumbitSuccess implements _SumbitSuccess {
  const _$_SumbitSuccess();

  @override
  String toString() {
    return 'UpdateServiceState.sumbitSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SumbitSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UpdateServiceModel model) loadDataSuccess,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function() sumbitSuccess,
  }) {
    return sumbitSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
  }) {
    return sumbitSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UpdateServiceModel model)? loadDataSuccess,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function()? sumbitSuccess,
    required TResult orElse(),
  }) {
    if (sumbitSuccess != null) {
      return sumbitSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadDataSuccess value) loadDataSuccess,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SumbitSuccess value) sumbitSuccess,
  }) {
    return sumbitSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
  }) {
    return sumbitSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadDataSuccess value)? loadDataSuccess,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_SumbitSuccess value)? sumbitSuccess,
    required TResult orElse(),
  }) {
    if (sumbitSuccess != null) {
      return sumbitSuccess(this);
    }
    return orElse();
  }
}

abstract class _SumbitSuccess implements UpdateServiceState {
  const factory _SumbitSuccess() = _$_SumbitSuccess;
}
