// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rating_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RatingData {
  int get rating => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get createdTime => throw _privateConstructorUsedError;
  DateTime get updatedTime => throw _privateConstructorUsedError;
  String get consumerName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingDataCopyWith<RatingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingDataCopyWith<$Res> {
  factory $RatingDataCopyWith(
          RatingData value, $Res Function(RatingData) then) =
      _$RatingDataCopyWithImpl<$Res>;
  $Res call(
      {int rating,
      String description,
      DateTime createdTime,
      DateTime updatedTime,
      String consumerName,
      String imageUrl});
}

/// @nodoc
class _$RatingDataCopyWithImpl<$Res> implements $RatingDataCopyWith<$Res> {
  _$RatingDataCopyWithImpl(this._value, this._then);

  final RatingData _value;
  // ignore: unused_field
  final $Res Function(RatingData) _then;

  @override
  $Res call({
    Object? rating = freezed,
    Object? description = freezed,
    Object? createdTime = freezed,
    Object? updatedTime = freezed,
    Object? consumerName = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumerName: consumerName == freezed
          ? _value.consumerName
          : consumerName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RatingDataCopyWith<$Res>
    implements $RatingDataCopyWith<$Res> {
  factory _$$_RatingDataCopyWith(
          _$_RatingData value, $Res Function(_$_RatingData) then) =
      __$$_RatingDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {int rating,
      String description,
      DateTime createdTime,
      DateTime updatedTime,
      String consumerName,
      String imageUrl});
}

/// @nodoc
class __$$_RatingDataCopyWithImpl<$Res> extends _$RatingDataCopyWithImpl<$Res>
    implements _$$_RatingDataCopyWith<$Res> {
  __$$_RatingDataCopyWithImpl(
      _$_RatingData _value, $Res Function(_$_RatingData) _then)
      : super(_value, (v) => _then(v as _$_RatingData));

  @override
  _$_RatingData get _value => super._value as _$_RatingData;

  @override
  $Res call({
    Object? rating = freezed,
    Object? description = freezed,
    Object? createdTime = freezed,
    Object? updatedTime = freezed,
    Object? consumerName = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_RatingData(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: createdTime == freezed
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedTime: updatedTime == freezed
          ? _value.updatedTime
          : updatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumerName: consumerName == freezed
          ? _value.consumerName
          : consumerName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RatingData implements _RatingData {
  _$_RatingData(
      {required this.rating,
      required this.description,
      required this.createdTime,
      required this.updatedTime,
      required this.consumerName,
      required this.imageUrl});

  @override
  final int rating;
  @override
  final String description;
  @override
  final DateTime createdTime;
  @override
  final DateTime updatedTime;
  @override
  final String consumerName;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'RatingData(rating: $rating, description: $description, createdTime: $createdTime, updatedTime: $updatedTime, consumerName: $consumerName, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingData &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.createdTime, createdTime) &&
            const DeepCollectionEquality()
                .equals(other.updatedTime, updatedTime) &&
            const DeepCollectionEquality()
                .equals(other.consumerName, consumerName) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(createdTime),
      const DeepCollectionEquality().hash(updatedTime),
      const DeepCollectionEquality().hash(consumerName),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_RatingDataCopyWith<_$_RatingData> get copyWith =>
      __$$_RatingDataCopyWithImpl<_$_RatingData>(this, _$identity);
}

abstract class _RatingData implements RatingData {
  factory _RatingData(
      {required final int rating,
      required final String description,
      required final DateTime createdTime,
      required final DateTime updatedTime,
      required final String consumerName,
      required final String imageUrl}) = _$_RatingData;

  @override
  int get rating;
  @override
  String get description;
  @override
  DateTime get createdTime;
  @override
  DateTime get updatedTime;
  @override
  String get consumerName;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_RatingDataCopyWith<_$_RatingData> get copyWith =>
      throw _privateConstructorUsedError;
}
