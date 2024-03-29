// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'directions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Directions {
  LatLngBounds get bounds => throw _privateConstructorUsedError;
  List<PointLatLng> get polylinePoints => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DirectionsCopyWith<Directions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionsCopyWith<$Res> {
  factory $DirectionsCopyWith(
          Directions value, $Res Function(Directions) then) =
      _$DirectionsCopyWithImpl<$Res>;
  $Res call(
      {LatLngBounds bounds,
      List<PointLatLng> polylinePoints,
      int distance,
      int duration});
}

/// @nodoc
class _$DirectionsCopyWithImpl<$Res> implements $DirectionsCopyWith<$Res> {
  _$DirectionsCopyWithImpl(this._value, this._then);

  final Directions _value;
  // ignore: unused_field
  final $Res Function(Directions) _then;

  @override
  $Res call({
    Object? bounds = freezed,
    Object? polylinePoints = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      bounds: bounds == freezed
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds,
      polylinePoints: polylinePoints == freezed
          ? _value.polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PointLatLng>,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DirectionsCopyWith<$Res>
    implements $DirectionsCopyWith<$Res> {
  factory _$$_DirectionsCopyWith(
          _$_Directions value, $Res Function(_$_Directions) then) =
      __$$_DirectionsCopyWithImpl<$Res>;
  @override
  $Res call(
      {LatLngBounds bounds,
      List<PointLatLng> polylinePoints,
      int distance,
      int duration});
}

/// @nodoc
class __$$_DirectionsCopyWithImpl<$Res> extends _$DirectionsCopyWithImpl<$Res>
    implements _$$_DirectionsCopyWith<$Res> {
  __$$_DirectionsCopyWithImpl(
      _$_Directions _value, $Res Function(_$_Directions) _then)
      : super(_value, (v) => _then(v as _$_Directions));

  @override
  _$_Directions get _value => super._value as _$_Directions;

  @override
  $Res call({
    Object? bounds = freezed,
    Object? polylinePoints = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_Directions(
      bounds: bounds == freezed
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds,
      polylinePoints: polylinePoints == freezed
          ? _value._polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PointLatLng>,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Directions implements _Directions {
  const _$_Directions(
      {required this.bounds,
      required final List<PointLatLng> polylinePoints,
      required this.distance,
      required this.duration})
      : _polylinePoints = polylinePoints;

  @override
  final LatLngBounds bounds;
  final List<PointLatLng> _polylinePoints;
  @override
  List<PointLatLng> get polylinePoints {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polylinePoints);
  }

  @override
  final int distance;
  @override
  final int duration;

  @override
  String toString() {
    return 'Directions(bounds: $bounds, polylinePoints: $polylinePoints, distance: $distance, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Directions &&
            const DeepCollectionEquality().equals(other.bounds, bounds) &&
            const DeepCollectionEquality()
                .equals(other._polylinePoints, _polylinePoints) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bounds),
      const DeepCollectionEquality().hash(_polylinePoints),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_DirectionsCopyWith<_$_Directions> get copyWith =>
      __$$_DirectionsCopyWithImpl<_$_Directions>(this, _$identity);
}

abstract class _Directions implements Directions {
  const factory _Directions(
      {required final LatLngBounds bounds,
      required final List<PointLatLng> polylinePoints,
      required final int distance,
      required final int duration}) = _$_Directions;

  @override
  LatLngBounds get bounds;
  @override
  List<PointLatLng> get polylinePoints;
  @override
  int get distance;
  @override
  int get duration;
  @override
  @JsonKey(ignore: true)
  _$$_DirectionsCopyWith<_$_Directions> get copyWith =>
      throw _privateConstructorUsedError;
}
