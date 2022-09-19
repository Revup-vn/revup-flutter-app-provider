// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_call_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoCallEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() callStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? callStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? callStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CallStarted value) callStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CallStarted value)? callStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CallStarted value)? callStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallEventCopyWith<$Res> {
  factory $VideoCallEventCopyWith(
          VideoCallEvent value, $Res Function(VideoCallEvent) then) =
      _$VideoCallEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$VideoCallEventCopyWithImpl<$Res>
    implements $VideoCallEventCopyWith<$Res> {
  _$VideoCallEventCopyWithImpl(this._value, this._then);

  final VideoCallEvent _value;
  // ignore: unused_field
  final $Res Function(VideoCallEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$VideoCallEventCopyWithImpl<$Res>
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
    return 'VideoCallEvent.started()';
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
    required TResult Function() callStarted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? callStarted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? callStarted,
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
    required TResult Function(_CallStarted value) callStarted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CallStarted value)? callStarted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CallStarted value)? callStarted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VideoCallEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_CallStartedCopyWith<$Res> {
  factory _$$_CallStartedCopyWith(
          _$_CallStarted value, $Res Function(_$_CallStarted) then) =
      __$$_CallStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CallStartedCopyWithImpl<$Res>
    extends _$VideoCallEventCopyWithImpl<$Res>
    implements _$$_CallStartedCopyWith<$Res> {
  __$$_CallStartedCopyWithImpl(
      _$_CallStarted _value, $Res Function(_$_CallStarted) _then)
      : super(_value, (v) => _then(v as _$_CallStarted));

  @override
  _$_CallStarted get _value => super._value as _$_CallStarted;
}

/// @nodoc

class _$_CallStarted implements _CallStarted {
  const _$_CallStarted();

  @override
  String toString() {
    return 'VideoCallEvent.callStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CallStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() callStarted,
  }) {
    return callStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? callStarted,
  }) {
    return callStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? callStarted,
    required TResult orElse(),
  }) {
    if (callStarted != null) {
      return callStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CallStarted value) callStarted,
  }) {
    return callStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CallStarted value)? callStarted,
  }) {
    return callStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CallStarted value)? callStarted,
    required TResult orElse(),
  }) {
    if (callStarted != null) {
      return callStarted(this);
    }
    return orElse();
  }
}

abstract class _CallStarted implements VideoCallEvent {
  const factory _CallStarted() = _$_CallStarted;
}

/// @nodoc
mixin _$VideoCallState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() calling,
    required TResult Function() callEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? calling,
    TResult Function()? callEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? calling,
    TResult Function()? callEnded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Calling value) calling,
    required TResult Function(_CallEnded value) callEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calling value)? calling,
    TResult Function(_CallEnded value)? callEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calling value)? calling,
    TResult Function(_CallEnded value)? callEnded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallStateCopyWith<$Res> {
  factory $VideoCallStateCopyWith(
          VideoCallState value, $Res Function(VideoCallState) then) =
      _$VideoCallStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VideoCallStateCopyWithImpl<$Res>
    implements $VideoCallStateCopyWith<$Res> {
  _$VideoCallStateCopyWithImpl(this._value, this._then);

  final VideoCallState _value;
  // ignore: unused_field
  final $Res Function(VideoCallState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$VideoCallStateCopyWithImpl<$Res>
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
    return 'VideoCallState.initial()';
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
    required TResult Function() calling,
    required TResult Function() callEnded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? calling,
    TResult Function()? callEnded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? calling,
    TResult Function()? callEnded,
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
    required TResult Function(_Calling value) calling,
    required TResult Function(_CallEnded value) callEnded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calling value)? calling,
    TResult Function(_CallEnded value)? callEnded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calling value)? calling,
    TResult Function(_CallEnded value)? callEnded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VideoCallState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_CallingCopyWith<$Res> {
  factory _$$_CallingCopyWith(
          _$_Calling value, $Res Function(_$_Calling) then) =
      __$$_CallingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CallingCopyWithImpl<$Res> extends _$VideoCallStateCopyWithImpl<$Res>
    implements _$$_CallingCopyWith<$Res> {
  __$$_CallingCopyWithImpl(_$_Calling _value, $Res Function(_$_Calling) _then)
      : super(_value, (v) => _then(v as _$_Calling));

  @override
  _$_Calling get _value => super._value as _$_Calling;
}

/// @nodoc

class _$_Calling implements _Calling {
  const _$_Calling();

  @override
  String toString() {
    return 'VideoCallState.calling()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Calling);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() calling,
    required TResult Function() callEnded,
  }) {
    return calling();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? calling,
    TResult Function()? callEnded,
  }) {
    return calling?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? calling,
    TResult Function()? callEnded,
    required TResult orElse(),
  }) {
    if (calling != null) {
      return calling();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Calling value) calling,
    required TResult Function(_CallEnded value) callEnded,
  }) {
    return calling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calling value)? calling,
    TResult Function(_CallEnded value)? callEnded,
  }) {
    return calling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calling value)? calling,
    TResult Function(_CallEnded value)? callEnded,
    required TResult orElse(),
  }) {
    if (calling != null) {
      return calling(this);
    }
    return orElse();
  }
}

abstract class _Calling implements VideoCallState {
  const factory _Calling() = _$_Calling;
}

/// @nodoc
abstract class _$$_CallEndedCopyWith<$Res> {
  factory _$$_CallEndedCopyWith(
          _$_CallEnded value, $Res Function(_$_CallEnded) then) =
      __$$_CallEndedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CallEndedCopyWithImpl<$Res>
    extends _$VideoCallStateCopyWithImpl<$Res>
    implements _$$_CallEndedCopyWith<$Res> {
  __$$_CallEndedCopyWithImpl(
      _$_CallEnded _value, $Res Function(_$_CallEnded) _then)
      : super(_value, (v) => _then(v as _$_CallEnded));

  @override
  _$_CallEnded get _value => super._value as _$_CallEnded;
}

/// @nodoc

class _$_CallEnded implements _CallEnded {
  const _$_CallEnded();

  @override
  String toString() {
    return 'VideoCallState.callEnded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CallEnded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() calling,
    required TResult Function() callEnded,
  }) {
    return callEnded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? calling,
    TResult Function()? callEnded,
  }) {
    return callEnded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? calling,
    TResult Function()? callEnded,
    required TResult orElse(),
  }) {
    if (callEnded != null) {
      return callEnded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Calling value) calling,
    required TResult Function(_CallEnded value) callEnded,
  }) {
    return callEnded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calling value)? calling,
    TResult Function(_CallEnded value)? callEnded,
  }) {
    return callEnded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Calling value)? calling,
    TResult Function(_CallEnded value)? callEnded,
    required TResult orElse(),
  }) {
    if (callEnded != null) {
      return callEnded(this);
    }
    return orElse();
  }
}

abstract class _CallEnded implements VideoCallState {
  const factory _CallEnded() = _$_CallEnded;
}
