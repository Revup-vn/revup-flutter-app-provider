// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_autocomplete_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceAutocomplete _$PlaceAutocompleteFromJson(Map<String, dynamic> json) {
  return _PlaceAutocomplete.fromJson(json);
}

/// @nodoc
mixin _$PlaceAutocomplete {
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_id')
  String get placeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceAutocompleteCopyWith<PlaceAutocomplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceAutocompleteCopyWith<$Res> {
  factory $PlaceAutocompleteCopyWith(
          PlaceAutocomplete value, $Res Function(PlaceAutocomplete) then) =
      _$PlaceAutocompleteCopyWithImpl<$Res>;
  $Res call({String description, @JsonKey(name: 'place_id') String placeId});
}

/// @nodoc
class _$PlaceAutocompleteCopyWithImpl<$Res>
    implements $PlaceAutocompleteCopyWith<$Res> {
  _$PlaceAutocompleteCopyWithImpl(this._value, this._then);

  final PlaceAutocomplete _value;
  // ignore: unused_field
  final $Res Function(PlaceAutocomplete) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? placeId = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PlaceAutocompleteCopyWith<$Res>
    implements $PlaceAutocompleteCopyWith<$Res> {
  factory _$$_PlaceAutocompleteCopyWith(_$_PlaceAutocomplete value,
          $Res Function(_$_PlaceAutocomplete) then) =
      __$$_PlaceAutocompleteCopyWithImpl<$Res>;
  @override
  $Res call({String description, @JsonKey(name: 'place_id') String placeId});
}

/// @nodoc
class __$$_PlaceAutocompleteCopyWithImpl<$Res>
    extends _$PlaceAutocompleteCopyWithImpl<$Res>
    implements _$$_PlaceAutocompleteCopyWith<$Res> {
  __$$_PlaceAutocompleteCopyWithImpl(
      _$_PlaceAutocomplete _value, $Res Function(_$_PlaceAutocomplete) _then)
      : super(_value, (v) => _then(v as _$_PlaceAutocomplete));

  @override
  _$_PlaceAutocomplete get _value => super._value as _$_PlaceAutocomplete;

  @override
  $Res call({
    Object? description = freezed,
    Object? placeId = freezed,
  }) {
    return _then(_$_PlaceAutocomplete(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaceAutocomplete implements _PlaceAutocomplete {
  const _$_PlaceAutocomplete(
      {required this.description,
      @JsonKey(name: 'place_id') required this.placeId});

  factory _$_PlaceAutocomplete.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceAutocompleteFromJson(json);

  @override
  final String description;
  @override
  @JsonKey(name: 'place_id')
  final String placeId;

  @override
  String toString() {
    return 'PlaceAutocomplete(description: $description, placeId: $placeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceAutocomplete &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.placeId, placeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(placeId));

  @JsonKey(ignore: true)
  @override
  _$$_PlaceAutocompleteCopyWith<_$_PlaceAutocomplete> get copyWith =>
      __$$_PlaceAutocompleteCopyWithImpl<_$_PlaceAutocomplete>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceAutocompleteToJson(
      this,
    );
  }
}

abstract class _PlaceAutocomplete implements PlaceAutocomplete {
  const factory _PlaceAutocomplete(
          {required final String description,
          @JsonKey(name: 'place_id') required final String placeId}) =
      _$_PlaceAutocomplete;

  factory _PlaceAutocomplete.fromJson(Map<String, dynamic> json) =
      _$_PlaceAutocomplete.fromJson;

  @override
  String get description;
  @override
  @JsonKey(name: 'place_id')
  String get placeId;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceAutocompleteCopyWith<_$_PlaceAutocomplete> get copyWith =>
      throw _privateConstructorUsedError;
}
