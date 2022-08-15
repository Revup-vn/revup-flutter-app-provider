// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceModel {
  String get providerID => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  int get sortType => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceModelCopyWith<ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceModelCopyWith<$Res> {
  factory $ServiceModelCopyWith(
          ServiceModel value, $Res Function(ServiceModel) then) =
      _$ServiceModelCopyWithImpl<$Res>;
  $Res call(
      {String providerID,
      String serviceName,
      int sortType,
      String price,
      String imageUrl});
}

/// @nodoc
class _$ServiceModelCopyWithImpl<$Res> implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._value, this._then);

  final ServiceModel _value;
  // ignore: unused_field
  final $Res Function(ServiceModel) _then;

  @override
  $Res call({
    Object? providerID = freezed,
    Object? serviceName = freezed,
    Object? sortType = freezed,
    Object? price = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      providerID: providerID == freezed
          ? _value.providerID
          : providerID // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      sortType: sortType == freezed
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ServiceModelCopyWith<$Res>
    implements $ServiceModelCopyWith<$Res> {
  factory _$$_ServiceModelCopyWith(
          _$_ServiceModel value, $Res Function(_$_ServiceModel) then) =
      __$$_ServiceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String providerID,
      String serviceName,
      int sortType,
      String price,
      String imageUrl});
}

/// @nodoc
class __$$_ServiceModelCopyWithImpl<$Res>
    extends _$ServiceModelCopyWithImpl<$Res>
    implements _$$_ServiceModelCopyWith<$Res> {
  __$$_ServiceModelCopyWithImpl(
      _$_ServiceModel _value, $Res Function(_$_ServiceModel) _then)
      : super(_value, (v) => _then(v as _$_ServiceModel));

  @override
  _$_ServiceModel get _value => super._value as _$_ServiceModel;

  @override
  $Res call({
    Object? providerID = freezed,
    Object? serviceName = freezed,
    Object? sortType = freezed,
    Object? price = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_ServiceModel(
      providerID: providerID == freezed
          ? _value.providerID
          : providerID // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      sortType: sortType == freezed
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServiceModel implements _ServiceModel {
  _$_ServiceModel(
      {required this.providerID,
      required this.serviceName,
      required this.sortType,
      required this.price,
      required this.imageUrl});

  @override
  final String providerID;
  @override
  final String serviceName;
  @override
  final int sortType;
  @override
  final String price;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'ServiceModel(providerID: $providerID, serviceName: $serviceName, sortType: $sortType, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceModel &&
            const DeepCollectionEquality()
                .equals(other.providerID, providerID) &&
            const DeepCollectionEquality()
                .equals(other.serviceName, serviceName) &&
            const DeepCollectionEquality().equals(other.sortType, sortType) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(providerID),
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(sortType),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceModelCopyWith<_$_ServiceModel> get copyWith =>
      __$$_ServiceModelCopyWithImpl<_$_ServiceModel>(this, _$identity);
}

abstract class _ServiceModel implements ServiceModel {
  factory _ServiceModel(
      {required final String providerID,
      required final String serviceName,
      required final int sortType,
      required final String price,
      required final String imageUrl}) = _$_ServiceModel;

  @override
  String get providerID;
  @override
  String get serviceName;
  @override
  int get sortType;
  @override
  String get price;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceModelCopyWith<_$_ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
