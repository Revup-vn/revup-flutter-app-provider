// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'common_service_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonServiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)
        submited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)?
        submited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)?
        submited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submited value) submited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submited value)? submited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submited value)? submited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonServiceEventCopyWith<$Res> {
  factory $CommonServiceEventCopyWith(
          CommonServiceEvent value, $Res Function(CommonServiceEvent) then) =
      _$CommonServiceEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommonServiceEventCopyWithImpl<$Res>
    implements $CommonServiceEventCopyWith<$Res> {
  _$CommonServiceEventCopyWithImpl(this._value, this._then);

  final CommonServiceEvent _value;
  // ignore: unused_field
  final $Res Function(CommonServiceEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$CommonServiceEventCopyWithImpl<$Res>
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
    return 'CommonServiceEvent.started()';
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
    required TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)
        submited,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)?
        submited,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)?
        submited,
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
    required TResult Function(_Submited value) submited,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submited value)? submited,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submited value)? submited,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CommonServiceEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_SubmitedCopyWith<$Res> {
  factory _$$_SubmitedCopyWith(
          _$_Submited value, $Res Function(_$_Submited) then) =
      __$$_SubmitedCopyWithImpl<$Res>;
  $Res call(
      {List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
          saveList});
}

/// @nodoc
class __$$_SubmitedCopyWithImpl<$Res>
    extends _$CommonServiceEventCopyWithImpl<$Res>
    implements _$$_SubmitedCopyWith<$Res> {
  __$$_SubmitedCopyWithImpl(
      _$_Submited _value, $Res Function(_$_Submited) _then)
      : super(_value, (v) => _then(v as _$_Submited));

  @override
  _$_Submited get _value => super._value as _$_Submited;

  @override
  $Res call({
    Object? saveList = freezed,
  }) {
    return _then(_$_Submited(
      saveList: saveList == freezed
          ? _value._saveList
          : saveList // ignore: cast_nullable_to_non_nullable
              as List<
                  Tuple3<CommonService, List<Tuple2<RepairProduct, File>>,
                      File>>,
    ));
  }
}

/// @nodoc

class _$_Submited implements _Submited {
  const _$_Submited(
      {required final List<
              Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
          saveList})
      : _saveList = saveList;

  final List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
      _saveList;
  @override
  List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
      get saveList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_saveList);
  }

  @override
  String toString() {
    return 'CommonServiceEvent.submited(saveList: $saveList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Submited &&
            const DeepCollectionEquality().equals(other._saveList, _saveList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_saveList));

  @JsonKey(ignore: true)
  @override
  _$$_SubmitedCopyWith<_$_Submited> get copyWith =>
      __$$_SubmitedCopyWithImpl<_$_Submited>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)
        submited,
  }) {
    return submited(saveList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)?
        submited,
  }) {
    return submited?.call(saveList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
                saveList)?
        submited,
    required TResult orElse(),
  }) {
    if (submited != null) {
      return submited(saveList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submited value) submited,
  }) {
    return submited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submited value)? submited,
  }) {
    return submited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submited value)? submited,
    required TResult orElse(),
  }) {
    if (submited != null) {
      return submited(this);
    }
    return orElse();
  }
}

abstract class _Submited implements CommonServiceEvent {
  const factory _Submited(
      {required final List<
              Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
          saveList}) = _$_Submited;

  List<Tuple3<CommonService, List<Tuple2<RepairProduct, File>>, File>>
      get saveList;
  @JsonKey(ignore: true)
  _$$_SubmitedCopyWith<_$_Submited> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommonServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(List<CommonService> list, String providerID)
        success,
    required TResult Function() submitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
    required TResult Function(_SubmitSuccess value) submitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonServiceStateCopyWith<$Res> {
  factory $CommonServiceStateCopyWith(
          CommonServiceState value, $Res Function(CommonServiceState) then) =
      _$CommonServiceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommonServiceStateCopyWithImpl<$Res>
    implements $CommonServiceStateCopyWith<$Res> {
  _$CommonServiceStateCopyWithImpl(this._value, this._then);

  final CommonServiceState _value;
  // ignore: unused_field
  final $Res Function(CommonServiceState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CommonServiceStateCopyWithImpl<$Res>
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
    return 'CommonServiceState.initial()';
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
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(List<CommonService> list, String providerID)
        success,
    required TResult Function() submitSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
    required TResult Function(_SubmitSuccess value) submitSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CommonServiceState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CommonServiceStateCopyWithImpl<$Res>
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
    return 'CommonServiceState.loading()';
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
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(List<CommonService> list, String providerID)
        success,
    required TResult Function() submitSuccess,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
    required TResult Function(_SubmitSuccess value) submitSuccess,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CommonServiceState {
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
    extends _$CommonServiceStateCopyWithImpl<$Res>
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
    return 'CommonServiceState.failure()';
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
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(List<CommonService> list, String providerID)
        success,
    required TResult Function() submitSuccess,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
    required TResult Function(_SubmitSuccess value) submitSuccess,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CommonServiceState {
  const factory _Failure() = _$_Failure;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  $Res call({List<CommonService> list, String providerID});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$CommonServiceStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? list = freezed,
    Object? providerID = freezed,
  }) {
    return _then(_$_Success(
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<CommonService>,
      providerID: providerID == freezed
          ? _value.providerID
          : providerID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(
      {required final List<CommonService> list, required this.providerID})
      : _list = list;

  final List<CommonService> _list;
  @override
  List<CommonService> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final String providerID;

  @override
  String toString() {
    return 'CommonServiceState.success(list: $list, providerID: $providerID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other.providerID, providerID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(providerID));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(List<CommonService> list, String providerID)
        success,
    required TResult Function() submitSuccess,
  }) {
    return success(list, providerID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
  }) {
    return success?.call(list, providerID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(list, providerID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
    required TResult Function(_SubmitSuccess value) submitSuccess,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CommonServiceState {
  const factory _Success(
      {required final List<CommonService> list,
      required final String providerID}) = _$_Success;

  List<CommonService> get list;
  String get providerID;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitSuccessCopyWith<$Res> {
  factory _$$_SubmitSuccessCopyWith(
          _$_SubmitSuccess value, $Res Function(_$_SubmitSuccess) then) =
      __$$_SubmitSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmitSuccessCopyWithImpl<$Res>
    extends _$CommonServiceStateCopyWithImpl<$Res>
    implements _$$_SubmitSuccessCopyWith<$Res> {
  __$$_SubmitSuccessCopyWithImpl(
      _$_SubmitSuccess _value, $Res Function(_$_SubmitSuccess) _then)
      : super(_value, (v) => _then(v as _$_SubmitSuccess));

  @override
  _$_SubmitSuccess get _value => super._value as _$_SubmitSuccess;
}

/// @nodoc

class _$_SubmitSuccess implements _SubmitSuccess {
  const _$_SubmitSuccess();

  @override
  String toString() {
    return 'CommonServiceState.submitSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SubmitSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(List<CommonService> list, String providerID)
        success,
    required TResult Function() submitSuccess,
  }) {
    return submitSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
  }) {
    return submitSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(List<CommonService> list, String providerID)? success,
    TResult Function()? submitSuccess,
    required TResult orElse(),
  }) {
    if (submitSuccess != null) {
      return submitSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
    required TResult Function(_SubmitSuccess value) submitSuccess,
  }) {
    return submitSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
  }) {
    return submitSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    TResult Function(_SubmitSuccess value)? submitSuccess,
    required TResult orElse(),
  }) {
    if (submitSuccess != null) {
      return submitSuccess(this);
    }
    return orElse();
  }
}

abstract class _SubmitSuccess implements CommonServiceState {
  const factory _SubmitSuccess() = _$_SubmitSuccess;
}
