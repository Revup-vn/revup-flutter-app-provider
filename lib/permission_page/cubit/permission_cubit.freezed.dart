// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'permission_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PermissionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() denied,
    required TResult Function() granted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? denied,
    TResult Function()? granted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? denied,
    TResult Function()? granted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Denied value) denied,
    required TResult Function(_Granted value) granted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Denied value)? denied,
    TResult Function(_Granted value)? granted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Denied value)? denied,
    TResult Function(_Granted value)? granted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStateCopyWith<$Res> {
  factory $PermissionStateCopyWith(
          PermissionState value, $Res Function(PermissionState) then) =
      _$PermissionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PermissionStateCopyWithImpl<$Res>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._value, this._then);

  final PermissionState _value;
  // ignore: unused_field
  final $Res Function(PermissionState) _then;
}

/// @nodoc
abstract class _$$_DeniedCopyWith<$Res> {
  factory _$$_DeniedCopyWith(_$_Denied value, $Res Function(_$_Denied) then) =
      __$$_DeniedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeniedCopyWithImpl<$Res> extends _$PermissionStateCopyWithImpl<$Res>
    implements _$$_DeniedCopyWith<$Res> {
  __$$_DeniedCopyWithImpl(_$_Denied _value, $Res Function(_$_Denied) _then)
      : super(_value, (v) => _then(v as _$_Denied));

  @override
  _$_Denied get _value => super._value as _$_Denied;
}

/// @nodoc

class _$_Denied implements _Denied {
  const _$_Denied();

  @override
  String toString() {
    return 'PermissionState.denied()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Denied);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() denied,
    required TResult Function() granted,
  }) {
    return denied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? denied,
    TResult Function()? granted,
  }) {
    return denied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? denied,
    TResult Function()? granted,
    required TResult orElse(),
  }) {
    if (denied != null) {
      return denied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Denied value) denied,
    required TResult Function(_Granted value) granted,
  }) {
    return denied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Denied value)? denied,
    TResult Function(_Granted value)? granted,
  }) {
    return denied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Denied value)? denied,
    TResult Function(_Granted value)? granted,
    required TResult orElse(),
  }) {
    if (denied != null) {
      return denied(this);
    }
    return orElse();
  }
}

abstract class _Denied implements PermissionState {
  const factory _Denied() = _$_Denied;
}

/// @nodoc
abstract class _$$_GrantedCopyWith<$Res> {
  factory _$$_GrantedCopyWith(
          _$_Granted value, $Res Function(_$_Granted) then) =
      __$$_GrantedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GrantedCopyWithImpl<$Res> extends _$PermissionStateCopyWithImpl<$Res>
    implements _$$_GrantedCopyWith<$Res> {
  __$$_GrantedCopyWithImpl(_$_Granted _value, $Res Function(_$_Granted) _then)
      : super(_value, (v) => _then(v as _$_Granted));

  @override
  _$_Granted get _value => super._value as _$_Granted;
}

/// @nodoc

class _$_Granted implements _Granted {
  const _$_Granted();

  @override
  String toString() {
    return 'PermissionState.granted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Granted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() denied,
    required TResult Function() granted,
  }) {
    return granted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? denied,
    TResult Function()? granted,
  }) {
    return granted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? denied,
    TResult Function()? granted,
    required TResult orElse(),
  }) {
    if (granted != null) {
      return granted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Denied value) denied,
    required TResult Function(_Granted value) granted,
  }) {
    return granted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Denied value)? denied,
    TResult Function(_Granted value)? granted,
  }) {
    return granted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Denied value)? denied,
    TResult Function(_Granted value)? granted,
    required TResult orElse(),
  }) {
    if (granted != null) {
      return granted(this);
    }
    return orElse();
  }
}

abstract class _Granted implements PermissionState {
  const factory _Granted() = _$_Granted;
}
