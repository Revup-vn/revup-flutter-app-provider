// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceDetails _$PlaceDetailsFromJson(Map<String, dynamic> json) {
  return _PlaceDetails.fromJson(json);
}

/// @nodoc
mixin _$PlaceDetails {
  @JsonKey(name: 'place_id')
  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_address')
  String get name => throw _privateConstructorUsedError;
  Geometry get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceDetailsCopyWith<PlaceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailsCopyWith<$Res> {
  factory $PlaceDetailsCopyWith(
          PlaceDetails value, $Res Function(PlaceDetails) then) =
      _$PlaceDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'place_id') String placeId,
      @JsonKey(name: 'formatted_address') String name,
      Geometry geometry});

  $GeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$PlaceDetailsCopyWithImpl<$Res> implements $PlaceDetailsCopyWith<$Res> {
  _$PlaceDetailsCopyWithImpl(this._value, this._then);

  final PlaceDetails _value;
  // ignore: unused_field
  final $Res Function(PlaceDetails) _then;

  @override
  $Res call({
    Object? placeId = freezed,
    Object? name = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
    ));
  }

  @override
  $GeometryCopyWith<$Res> get geometry {
    return $GeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value));
    });
  }
}

/// @nodoc
abstract class _$$_PlaceDetailsCopyWith<$Res>
    implements $PlaceDetailsCopyWith<$Res> {
  factory _$$_PlaceDetailsCopyWith(
          _$_PlaceDetails value, $Res Function(_$_PlaceDetails) then) =
      __$$_PlaceDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'place_id') String placeId,
      @JsonKey(name: 'formatted_address') String name,
      Geometry geometry});

  @override
  $GeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$_PlaceDetailsCopyWithImpl<$Res>
    extends _$PlaceDetailsCopyWithImpl<$Res>
    implements _$$_PlaceDetailsCopyWith<$Res> {
  __$$_PlaceDetailsCopyWithImpl(
      _$_PlaceDetails _value, $Res Function(_$_PlaceDetails) _then)
      : super(_value, (v) => _then(v as _$_PlaceDetails));

  @override
  _$_PlaceDetails get _value => super._value as _$_PlaceDetails;

  @override
  $Res call({
    Object? placeId = freezed,
    Object? name = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_$_PlaceDetails(
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaceDetails implements _PlaceDetails {
  const _$_PlaceDetails(
      {@JsonKey(name: 'place_id') required this.placeId,
      @JsonKey(name: 'formatted_address') required this.name,
      required this.geometry});

  factory _$_PlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceDetailsFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String placeId;
  @override
  @JsonKey(name: 'formatted_address')
  final String name;
  @override
  final Geometry geometry;

  @override
  String toString() {
    return 'PlaceDetails(placeId: $placeId, name: $name, geometry: $geometry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDetails &&
            const DeepCollectionEquality().equals(other.placeId, placeId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.geometry, geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(placeId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(geometry));

  @JsonKey(ignore: true)
  @override
  _$$_PlaceDetailsCopyWith<_$_PlaceDetails> get copyWith =>
      __$$_PlaceDetailsCopyWithImpl<_$_PlaceDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceDetailsToJson(
      this,
    );
  }
}

abstract class _PlaceDetails implements PlaceDetails {
  const factory _PlaceDetails(
      {@JsonKey(name: 'place_id') required final String placeId,
      @JsonKey(name: 'formatted_address') required final String name,
      required final Geometry geometry}) = _$_PlaceDetails;

  factory _PlaceDetails.fromJson(Map<String, dynamic> json) =
      _$_PlaceDetails.fromJson;

  @override
  @JsonKey(name: 'place_id')
  String get placeId;
  @override
  @JsonKey(name: 'formatted_address')
  String get name;
  @override
  Geometry get geometry;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDetailsCopyWith<_$_PlaceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
