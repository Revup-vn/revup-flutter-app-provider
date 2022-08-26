// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'info_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InfoRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LatLng pos) locationUpdated,
    required TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)
        confirmStarted,
    required TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)
        confirmDeparted,
    required TResult Function() confirmArrived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationUpdated value) locationUpdated,
    required TResult Function(_ConfirmStarted value) confirmStarted,
    required TResult Function(_ConfirmDeparted value) confirmDeparted,
    required TResult Function(_ConfirmArrived value) confirmArrived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoRequestEventCopyWith<$Res> {
  factory $InfoRequestEventCopyWith(
          InfoRequestEvent value, $Res Function(InfoRequestEvent) then) =
      _$InfoRequestEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InfoRequestEventCopyWithImpl<$Res>
    implements $InfoRequestEventCopyWith<$Res> {
  _$InfoRequestEventCopyWithImpl(this._value, this._then);

  final InfoRequestEvent _value;
  // ignore: unused_field
  final $Res Function(InfoRequestEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$InfoRequestEventCopyWithImpl<$Res>
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
    return 'InfoRequestEvent.started()';
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
    required TResult Function(LatLng pos) locationUpdated,
    required TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)
        confirmStarted,
    required TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)
        confirmDeparted,
    required TResult Function() confirmArrived,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
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
    required TResult Function(_LocationUpdated value) locationUpdated,
    required TResult Function(_ConfirmStarted value) confirmStarted,
    required TResult Function(_ConfirmDeparted value) confirmDeparted,
    required TResult Function(_ConfirmArrived value) confirmArrived,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements InfoRequestEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_LocationUpdatedCopyWith<$Res> {
  factory _$$_LocationUpdatedCopyWith(
          _$_LocationUpdated value, $Res Function(_$_LocationUpdated) then) =
      __$$_LocationUpdatedCopyWithImpl<$Res>;
  $Res call({LatLng pos});
}

/// @nodoc
class __$$_LocationUpdatedCopyWithImpl<$Res>
    extends _$InfoRequestEventCopyWithImpl<$Res>
    implements _$$_LocationUpdatedCopyWith<$Res> {
  __$$_LocationUpdatedCopyWithImpl(
      _$_LocationUpdated _value, $Res Function(_$_LocationUpdated) _then)
      : super(_value, (v) => _then(v as _$_LocationUpdated));

  @override
  _$_LocationUpdated get _value => super._value as _$_LocationUpdated;

  @override
  $Res call({
    Object? pos = freezed,
  }) {
    return _then(_$_LocationUpdated(
      pos: pos == freezed
          ? _value.pos
          : pos // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_LocationUpdated implements _LocationUpdated {
  const _$_LocationUpdated({required this.pos});

  @override
  final LatLng pos;

  @override
  String toString() {
    return 'InfoRequestEvent.locationUpdated(pos: $pos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationUpdated &&
            const DeepCollectionEquality().equals(other.pos, pos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pos));

  @JsonKey(ignore: true)
  @override
  _$$_LocationUpdatedCopyWith<_$_LocationUpdated> get copyWith =>
      __$$_LocationUpdatedCopyWithImpl<_$_LocationUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LatLng pos) locationUpdated,
    required TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)
        confirmStarted,
    required TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)
        confirmDeparted,
    required TResult Function() confirmArrived,
  }) {
    return locationUpdated(pos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
  }) {
    return locationUpdated?.call(pos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
    required TResult orElse(),
  }) {
    if (locationUpdated != null) {
      return locationUpdated(pos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationUpdated value) locationUpdated,
    required TResult Function(_ConfirmStarted value) confirmStarted,
    required TResult Function(_ConfirmDeparted value) confirmDeparted,
    required TResult Function(_ConfirmArrived value) confirmArrived,
  }) {
    return locationUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
  }) {
    return locationUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
    required TResult orElse(),
  }) {
    if (locationUpdated != null) {
      return locationUpdated(this);
    }
    return orElse();
  }
}

abstract class _LocationUpdated implements InfoRequestEvent {
  const factory _LocationUpdated({required final LatLng pos}) =
      _$_LocationUpdated;

  LatLng get pos;
  @JsonKey(ignore: true)
  _$$_LocationUpdatedCopyWith<_$_LocationUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmStartedCopyWith<$Res> {
  factory _$$_ConfirmStartedCopyWith(
          _$_ConfirmStarted value, $Res Function(_$_ConfirmStarted) then) =
      __$$_ConfirmStartedCopyWithImpl<$Res>;
  $Res call(
      {Function0<void> onRoute, Function2<String, String, void> sendMessage});
}

/// @nodoc
class __$$_ConfirmStartedCopyWithImpl<$Res>
    extends _$InfoRequestEventCopyWithImpl<$Res>
    implements _$$_ConfirmStartedCopyWith<$Res> {
  __$$_ConfirmStartedCopyWithImpl(
      _$_ConfirmStarted _value, $Res Function(_$_ConfirmStarted) _then)
      : super(_value, (v) => _then(v as _$_ConfirmStarted));

  @override
  _$_ConfirmStarted get _value => super._value as _$_ConfirmStarted;

  @override
  $Res call({
    Object? onRoute = freezed,
    Object? sendMessage = freezed,
  }) {
    return _then(_$_ConfirmStarted(
      onRoute: onRoute == freezed
          ? _value.onRoute
          : onRoute // ignore: cast_nullable_to_non_nullable
              as Function0<void>,
      sendMessage: sendMessage == freezed
          ? _value.sendMessage
          : sendMessage // ignore: cast_nullable_to_non_nullable
              as Function2<String, String, void>,
    ));
  }
}

/// @nodoc

class _$_ConfirmStarted implements _ConfirmStarted {
  const _$_ConfirmStarted({required this.onRoute, required this.sendMessage});

  @override
  final Function0<void> onRoute;
  @override
  final Function2<String, String, void> sendMessage;

  @override
  String toString() {
    return 'InfoRequestEvent.confirmStarted(onRoute: $onRoute, sendMessage: $sendMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfirmStarted &&
            (identical(other.onRoute, onRoute) || other.onRoute == onRoute) &&
            (identical(other.sendMessage, sendMessage) ||
                other.sendMessage == sendMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onRoute, sendMessage);

  @JsonKey(ignore: true)
  @override
  _$$_ConfirmStartedCopyWith<_$_ConfirmStarted> get copyWith =>
      __$$_ConfirmStartedCopyWithImpl<_$_ConfirmStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LatLng pos) locationUpdated,
    required TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)
        confirmStarted,
    required TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)
        confirmDeparted,
    required TResult Function() confirmArrived,
  }) {
    return confirmStarted(onRoute, sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
  }) {
    return confirmStarted?.call(onRoute, sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
    required TResult orElse(),
  }) {
    if (confirmStarted != null) {
      return confirmStarted(onRoute, sendMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationUpdated value) locationUpdated,
    required TResult Function(_ConfirmStarted value) confirmStarted,
    required TResult Function(_ConfirmDeparted value) confirmDeparted,
    required TResult Function(_ConfirmArrived value) confirmArrived,
  }) {
    return confirmStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
  }) {
    return confirmStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
    required TResult orElse(),
  }) {
    if (confirmStarted != null) {
      return confirmStarted(this);
    }
    return orElse();
  }
}

abstract class _ConfirmStarted implements InfoRequestEvent {
  const factory _ConfirmStarted(
          {required final Function0<void> onRoute,
          required final Function2<String, String, void> sendMessage}) =
      _$_ConfirmStarted;

  Function0<void> get onRoute;
  Function2<String, String, void> get sendMessage;
  @JsonKey(ignore: true)
  _$$_ConfirmStartedCopyWith<_$_ConfirmStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmDepartedCopyWith<$Res> {
  factory _$$_ConfirmDepartedCopyWith(
          _$_ConfirmDeparted value, $Res Function(_$_ConfirmDeparted) then) =
      __$$_ConfirmDepartedCopyWithImpl<$Res>;
  $Res call({Function0<void> onRoute, Function1<String, void> sendMessage});
}

/// @nodoc
class __$$_ConfirmDepartedCopyWithImpl<$Res>
    extends _$InfoRequestEventCopyWithImpl<$Res>
    implements _$$_ConfirmDepartedCopyWith<$Res> {
  __$$_ConfirmDepartedCopyWithImpl(
      _$_ConfirmDeparted _value, $Res Function(_$_ConfirmDeparted) _then)
      : super(_value, (v) => _then(v as _$_ConfirmDeparted));

  @override
  _$_ConfirmDeparted get _value => super._value as _$_ConfirmDeparted;

  @override
  $Res call({
    Object? onRoute = freezed,
    Object? sendMessage = freezed,
  }) {
    return _then(_$_ConfirmDeparted(
      onRoute: onRoute == freezed
          ? _value.onRoute
          : onRoute // ignore: cast_nullable_to_non_nullable
              as Function0<void>,
      sendMessage: sendMessage == freezed
          ? _value.sendMessage
          : sendMessage // ignore: cast_nullable_to_non_nullable
              as Function1<String, void>,
    ));
  }
}

/// @nodoc

class _$_ConfirmDeparted implements _ConfirmDeparted {
  const _$_ConfirmDeparted({required this.onRoute, required this.sendMessage});

  @override
  final Function0<void> onRoute;
  @override
  final Function1<String, void> sendMessage;

  @override
  String toString() {
    return 'InfoRequestEvent.confirmDeparted(onRoute: $onRoute, sendMessage: $sendMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfirmDeparted &&
            (identical(other.onRoute, onRoute) || other.onRoute == onRoute) &&
            (identical(other.sendMessage, sendMessage) ||
                other.sendMessage == sendMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onRoute, sendMessage);

  @JsonKey(ignore: true)
  @override
  _$$_ConfirmDepartedCopyWith<_$_ConfirmDeparted> get copyWith =>
      __$$_ConfirmDepartedCopyWithImpl<_$_ConfirmDeparted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LatLng pos) locationUpdated,
    required TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)
        confirmStarted,
    required TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)
        confirmDeparted,
    required TResult Function() confirmArrived,
  }) {
    return confirmDeparted(onRoute, sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
  }) {
    return confirmDeparted?.call(onRoute, sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
    required TResult orElse(),
  }) {
    if (confirmDeparted != null) {
      return confirmDeparted(onRoute, sendMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationUpdated value) locationUpdated,
    required TResult Function(_ConfirmStarted value) confirmStarted,
    required TResult Function(_ConfirmDeparted value) confirmDeparted,
    required TResult Function(_ConfirmArrived value) confirmArrived,
  }) {
    return confirmDeparted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
  }) {
    return confirmDeparted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
    required TResult orElse(),
  }) {
    if (confirmDeparted != null) {
      return confirmDeparted(this);
    }
    return orElse();
  }
}

abstract class _ConfirmDeparted implements InfoRequestEvent {
  const factory _ConfirmDeparted(
      {required final Function0<void> onRoute,
      required final Function1<String, void> sendMessage}) = _$_ConfirmDeparted;

  Function0<void> get onRoute;
  Function1<String, void> get sendMessage;
  @JsonKey(ignore: true)
  _$$_ConfirmDepartedCopyWith<_$_ConfirmDeparted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmArrivedCopyWith<$Res> {
  factory _$$_ConfirmArrivedCopyWith(
          _$_ConfirmArrived value, $Res Function(_$_ConfirmArrived) then) =
      __$$_ConfirmArrivedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConfirmArrivedCopyWithImpl<$Res>
    extends _$InfoRequestEventCopyWithImpl<$Res>
    implements _$$_ConfirmArrivedCopyWith<$Res> {
  __$$_ConfirmArrivedCopyWithImpl(
      _$_ConfirmArrived _value, $Res Function(_$_ConfirmArrived) _then)
      : super(_value, (v) => _then(v as _$_ConfirmArrived));

  @override
  _$_ConfirmArrived get _value => super._value as _$_ConfirmArrived;
}

/// @nodoc

class _$_ConfirmArrived implements _ConfirmArrived {
  const _$_ConfirmArrived();

  @override
  String toString() {
    return 'InfoRequestEvent.confirmArrived()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConfirmArrived);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LatLng pos) locationUpdated,
    required TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)
        confirmStarted,
    required TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)
        confirmDeparted,
    required TResult Function() confirmArrived,
  }) {
    return confirmArrived();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
  }) {
    return confirmArrived?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng pos)? locationUpdated,
    TResult Function(Function0<void> onRoute,
            Function2<String, String, void> sendMessage)?
        confirmStarted,
    TResult Function(
            Function0<void> onRoute, Function1<String, void> sendMessage)?
        confirmDeparted,
    TResult Function()? confirmArrived,
    required TResult orElse(),
  }) {
    if (confirmArrived != null) {
      return confirmArrived();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LocationUpdated value) locationUpdated,
    required TResult Function(_ConfirmStarted value) confirmStarted,
    required TResult Function(_ConfirmDeparted value) confirmDeparted,
    required TResult Function(_ConfirmArrived value) confirmArrived,
  }) {
    return confirmArrived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
  }) {
    return confirmArrived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LocationUpdated value)? locationUpdated,
    TResult Function(_ConfirmStarted value)? confirmStarted,
    TResult Function(_ConfirmDeparted value)? confirmDeparted,
    TResult Function(_ConfirmArrived value)? confirmArrived,
    required TResult orElse(),
  }) {
    if (confirmArrived != null) {
      return confirmArrived(this);
    }
    return orElse();
  }
}

abstract class _ConfirmArrived implements InfoRequestEvent {
  const factory _ConfirmArrived() = _$_ConfirmArrived;
}

/// @nodoc
mixin _$InfoRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoRequestStateCopyWith<$Res> {
  factory $InfoRequestStateCopyWith(
          InfoRequestState value, $Res Function(InfoRequestState) then) =
      _$InfoRequestStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InfoRequestStateCopyWithImpl<$Res>
    implements $InfoRequestStateCopyWith<$Res> {
  _$InfoRequestStateCopyWithImpl(this._value, this._then);

  final InfoRequestState _value;
  // ignore: unused_field
  final $Res Function(InfoRequestState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$InfoRequestStateCopyWithImpl<$Res>
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
    return 'InfoRequestState.initial()';
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
    required TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
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
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements InfoRequestState {
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
    extends _$InfoRequestStateCopyWithImpl<$Res>
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
    return 'InfoRequestState.loading()';
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
    required TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
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
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements InfoRequestState {
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
    extends _$InfoRequestStateCopyWithImpl<$Res>
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
    return 'InfoRequestState.failure()';
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
    required TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)
        success,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
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
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements InfoRequestState {
  const factory _Failure() = _$_Failure;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  $Res call(
      {IList<PaymentService> needToVerifyService,
      PendingRepairRequest record,
      int len,
      bool isReady});

  $PendingRepairRequestCopyWith<$Res> get record;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$InfoRequestStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? needToVerifyService = freezed,
    Object? record = freezed,
    Object? len = freezed,
    Object? isReady = freezed,
  }) {
    return _then(_$_Success(
      needToVerifyService: needToVerifyService == freezed
          ? _value.needToVerifyService
          : needToVerifyService // ignore: cast_nullable_to_non_nullable
              as IList<PaymentService>,
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as PendingRepairRequest,
      len: len == freezed
          ? _value.len
          : len // ignore: cast_nullable_to_non_nullable
              as int,
      isReady: isReady == freezed
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $PendingRepairRequestCopyWith<$Res> get record {
    return $PendingRepairRequestCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value));
    });
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(
      {required this.needToVerifyService,
      required this.record,
      required this.len,
      required this.isReady});

  @override
  final IList<PaymentService> needToVerifyService;
  @override
  final PendingRepairRequest record;
  @override
  final int len;
  @override
  final bool isReady;

  @override
  String toString() {
    return 'InfoRequestState.success(needToVerifyService: $needToVerifyService, record: $record, len: $len, isReady: $isReady)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality()
                .equals(other.needToVerifyService, needToVerifyService) &&
            const DeepCollectionEquality().equals(other.record, record) &&
            const DeepCollectionEquality().equals(other.len, len) &&
            const DeepCollectionEquality().equals(other.isReady, isReady));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(needToVerifyService),
      const DeepCollectionEquality().hash(record),
      const DeepCollectionEquality().hash(len),
      const DeepCollectionEquality().hash(isReady));

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
    required TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)
        success,
  }) {
    return success(needToVerifyService, record, len, isReady);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
  }) {
    return success?.call(needToVerifyService, record, len, isReady);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(IList<PaymentService> needToVerifyService,
            PendingRepairRequest record, int len, bool isReady)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(needToVerifyService, record, len, isReady);
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
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements InfoRequestState {
  const factory _Success(
      {required final IList<PaymentService> needToVerifyService,
      required final PendingRepairRequest record,
      required final int len,
      required final bool isReady}) = _$_Success;

  IList<PaymentService> get needToVerifyService;
  PendingRepairRequest get record;
  int get len;
  bool get isReady;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
