// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'directions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DirectionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LatLng origin, LatLng destination) directions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng origin, LatLng destination)? directions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng origin, LatLng destination)? directions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Directions value) directions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Directions value)? directions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Directions value)? directions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionsEventCopyWith<$Res> {
  factory $DirectionsEventCopyWith(
          DirectionsEvent value, $Res Function(DirectionsEvent) then) =
      _$DirectionsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectionsEventCopyWithImpl<$Res>
    implements $DirectionsEventCopyWith<$Res> {
  _$DirectionsEventCopyWithImpl(this._value, this._then);

  final DirectionsEvent _value;
  // ignore: unused_field
  final $Res Function(DirectionsEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$DirectionsEventCopyWithImpl<$Res>
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
    return 'DirectionsEvent.started()';
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
    required TResult Function(LatLng origin, LatLng destination) directions,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng origin, LatLng destination)? directions,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng origin, LatLng destination)? directions,
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
    required TResult Function(_Directions value) directions,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Directions value)? directions,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Directions value)? directions,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DirectionsEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_DirectionsCopyWith<$Res> {
  factory _$$_DirectionsCopyWith(
          _$_Directions value, $Res Function(_$_Directions) then) =
      __$$_DirectionsCopyWithImpl<$Res>;
  $Res call({LatLng origin, LatLng destination});
}

/// @nodoc
class __$$_DirectionsCopyWithImpl<$Res>
    extends _$DirectionsEventCopyWithImpl<$Res>
    implements _$$_DirectionsCopyWith<$Res> {
  __$$_DirectionsCopyWithImpl(
      _$_Directions _value, $Res Function(_$_Directions) _then)
      : super(_value, (v) => _then(v as _$_Directions));

  @override
  _$_Directions get _value => super._value as _$_Directions;

  @override
  $Res call({
    Object? origin = freezed,
    Object? destination = freezed,
  }) {
    return _then(_$_Directions(
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as LatLng,
      destination: destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_Directions implements _Directions {
  const _$_Directions({required this.origin, required this.destination});

  @override
  final LatLng origin;
  @override
  final LatLng destination;

  @override
  String toString() {
    return 'DirectionsEvent.directions(origin: $origin, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Directions &&
            const DeepCollectionEquality().equals(other.origin, origin) &&
            const DeepCollectionEquality()
                .equals(other.destination, destination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(origin),
      const DeepCollectionEquality().hash(destination));

  @JsonKey(ignore: true)
  @override
  _$$_DirectionsCopyWith<_$_Directions> get copyWith =>
      __$$_DirectionsCopyWithImpl<_$_Directions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(LatLng origin, LatLng destination) directions,
  }) {
    return directions(origin, destination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng origin, LatLng destination)? directions,
  }) {
    return directions?.call(origin, destination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(LatLng origin, LatLng destination)? directions,
    required TResult orElse(),
  }) {
    if (directions != null) {
      return directions(origin, destination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Directions value) directions,
  }) {
    return directions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Directions value)? directions,
  }) {
    return directions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Directions value)? directions,
    required TResult orElse(),
  }) {
    if (directions != null) {
      return directions(this);
    }
    return orElse();
  }
}

abstract class _Directions implements DirectionsEvent {
  const factory _Directions(
      {required final LatLng origin,
      required final LatLng destination}) = _$_Directions;

  LatLng get origin;
  LatLng get destination;
  @JsonKey(ignore: true)
  _$$_DirectionsCopyWith<_$_Directions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DirectionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Directions directions) directionsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Directions directions)? directionsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Directions directions)? directionsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DirectionsLoaded value) directionsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectionsLoaded value)? directionsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectionsLoaded value)? directionsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionsStateCopyWith<$Res> {
  factory $DirectionsStateCopyWith(
          DirectionsState value, $Res Function(DirectionsState) then) =
      _$DirectionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DirectionsStateCopyWithImpl<$Res>
    implements $DirectionsStateCopyWith<$Res> {
  _$DirectionsStateCopyWithImpl(this._value, this._then);

  final DirectionsState _value;
  // ignore: unused_field
  final $Res Function(DirectionsState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$DirectionsStateCopyWithImpl<$Res>
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
    return 'DirectionsState.initial()';
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
    required TResult Function(Directions directions) directionsLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Directions directions)? directionsLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Directions directions)? directionsLoaded,
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
    required TResult Function(_DirectionsLoaded value) directionsLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectionsLoaded value)? directionsLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectionsLoaded value)? directionsLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DirectionsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_DirectionsLoadedCopyWith<$Res> {
  factory _$$_DirectionsLoadedCopyWith(
          _$_DirectionsLoaded value, $Res Function(_$_DirectionsLoaded) then) =
      __$$_DirectionsLoadedCopyWithImpl<$Res>;
  $Res call({Directions directions});

  $DirectionsCopyWith<$Res> get directions;
}

/// @nodoc
class __$$_DirectionsLoadedCopyWithImpl<$Res>
    extends _$DirectionsStateCopyWithImpl<$Res>
    implements _$$_DirectionsLoadedCopyWith<$Res> {
  __$$_DirectionsLoadedCopyWithImpl(
      _$_DirectionsLoaded _value, $Res Function(_$_DirectionsLoaded) _then)
      : super(_value, (v) => _then(v as _$_DirectionsLoaded));

  @override
  _$_DirectionsLoaded get _value => super._value as _$_DirectionsLoaded;

  @override
  $Res call({
    Object? directions = freezed,
  }) {
    return _then(_$_DirectionsLoaded(
      directions: directions == freezed
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as Directions,
    ));
  }

  @override
  $DirectionsCopyWith<$Res> get directions {
    return $DirectionsCopyWith<$Res>(_value.directions, (value) {
      return _then(_value.copyWith(directions: value));
    });
  }
}

/// @nodoc

class _$_DirectionsLoaded implements _DirectionsLoaded {
  const _$_DirectionsLoaded({required this.directions});

  @override
  final Directions directions;

  @override
  String toString() {
    return 'DirectionsState.directionsLoaded(directions: $directions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectionsLoaded &&
            const DeepCollectionEquality()
                .equals(other.directions, directions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(directions));

  @JsonKey(ignore: true)
  @override
  _$$_DirectionsLoadedCopyWith<_$_DirectionsLoaded> get copyWith =>
      __$$_DirectionsLoadedCopyWithImpl<_$_DirectionsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Directions directions) directionsLoaded,
  }) {
    return directionsLoaded(directions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Directions directions)? directionsLoaded,
  }) {
    return directionsLoaded?.call(directions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Directions directions)? directionsLoaded,
    required TResult orElse(),
  }) {
    if (directionsLoaded != null) {
      return directionsLoaded(directions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DirectionsLoaded value) directionsLoaded,
  }) {
    return directionsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectionsLoaded value)? directionsLoaded,
  }) {
    return directionsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DirectionsLoaded value)? directionsLoaded,
    required TResult orElse(),
  }) {
    if (directionsLoaded != null) {
      return directionsLoaded(this);
    }
    return orElse();
  }
}

abstract class _DirectionsLoaded implements DirectionsState {
  const factory _DirectionsLoaded({required final Directions directions}) =
      _$_DirectionsLoaded;

  Directions get directions;
  @JsonKey(ignore: true)
  _$$_DirectionsLoadedCopyWith<_$_DirectionsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
