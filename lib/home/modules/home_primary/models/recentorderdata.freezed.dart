// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recentorderdata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentOrderData {
  String get providerName => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get serviceType => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentOrderDataCopyWith<RecentOrderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentOrderDataCopyWith<$Res> {
  factory $RecentOrderDataCopyWith(
          RecentOrderData value, $Res Function(RecentOrderData) then) =
      _$RecentOrderDataCopyWithImpl<$Res>;
  $Res call(
      {String providerName,
      String imageUrl,
      int serviceType,
      DateTime created,
      int rating});
}

/// @nodoc
class _$RecentOrderDataCopyWithImpl<$Res>
    implements $RecentOrderDataCopyWith<$Res> {
  _$RecentOrderDataCopyWithImpl(this._value, this._then);

  final RecentOrderData _value;
  // ignore: unused_field
  final $Res Function(RecentOrderData) _then;

  @override
  $Res call({
    Object? providerName = freezed,
    Object? imageUrl = freezed,
    Object? serviceType = freezed,
    Object? created = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      providerName: providerName == freezed
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: serviceType == freezed
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as int,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RecentOrderDataCopyWith<$Res>
    implements $RecentOrderDataCopyWith<$Res> {
  factory _$$_RecentOrderDataCopyWith(
          _$_RecentOrderData value, $Res Function(_$_RecentOrderData) then) =
      __$$_RecentOrderDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String providerName,
      String imageUrl,
      int serviceType,
      DateTime created,
      int rating});
}

/// @nodoc
class __$$_RecentOrderDataCopyWithImpl<$Res>
    extends _$RecentOrderDataCopyWithImpl<$Res>
    implements _$$_RecentOrderDataCopyWith<$Res> {
  __$$_RecentOrderDataCopyWithImpl(
      _$_RecentOrderData _value, $Res Function(_$_RecentOrderData) _then)
      : super(_value, (v) => _then(v as _$_RecentOrderData));

  @override
  _$_RecentOrderData get _value => super._value as _$_RecentOrderData;

  @override
  $Res call({
    Object? providerName = freezed,
    Object? imageUrl = freezed,
    Object? serviceType = freezed,
    Object? created = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$_RecentOrderData(
      providerName: providerName == freezed
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: serviceType == freezed
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as int,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RecentOrderData implements _RecentOrderData {
  _$_RecentOrderData(
      {required this.providerName,
      required this.imageUrl,
      required this.serviceType,
      required this.created,
      required this.rating});

  @override
  final String providerName;
  @override
  final String imageUrl;
  @override
  final int serviceType;
  @override
  final DateTime created;
  @override
  final int rating;

  @override
  String toString() {
    return 'RecentOrderData(providerName: $providerName, imageUrl: $imageUrl, serviceType: $serviceType, created: $created, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentOrderData &&
            const DeepCollectionEquality()
                .equals(other.providerName, providerName) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.serviceType, serviceType) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.rating, rating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(providerName),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(serviceType),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(rating));

  @JsonKey(ignore: true)
  @override
  _$$_RecentOrderDataCopyWith<_$_RecentOrderData> get copyWith =>
      __$$_RecentOrderDataCopyWithImpl<_$_RecentOrderData>(this, _$identity);
}

abstract class _RecentOrderData implements RecentOrderData {
  factory _RecentOrderData(
      {required final String providerName,
      required final String imageUrl,
      required final int serviceType,
      required final DateTime created,
      required final int rating}) = _$_RecentOrderData;

  @override
  String get providerName;
  @override
  String get imageUrl;
  @override
  int get serviceType;
  @override
  DateTime get created;
  @override
  int get rating;
  @override
  @JsonKey(ignore: true)
  _$$_RecentOrderDataCopyWith<_$_RecentOrderData> get copyWith =>
      throw _privateConstructorUsedError;
}
