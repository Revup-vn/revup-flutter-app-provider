// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceData {
  String get name => throw _privateConstructorUsedError;
  int get serviceFee => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  List<PaymentProduct> get products => throw _privateConstructorUsedError;
  bool get isOptional => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceDataCopyWith<ServiceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDataCopyWith<$Res> {
  factory $ServiceDataCopyWith(
          ServiceData value, $Res Function(ServiceData) then) =
      _$ServiceDataCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int serviceFee,
      String imageURL,
      List<PaymentProduct> products,
      bool isOptional});
}

/// @nodoc
class _$ServiceDataCopyWithImpl<$Res> implements $ServiceDataCopyWith<$Res> {
  _$ServiceDataCopyWithImpl(this._value, this._then);

  final ServiceData _value;
  // ignore: unused_field
  final $Res Function(ServiceData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? serviceFee = freezed,
    Object? imageURL = freezed,
    Object? products = freezed,
    Object? isOptional = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      serviceFee: serviceFee == freezed
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as int,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PaymentProduct>,
      isOptional: isOptional == freezed
          ? _value.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ServiceDataCopyWith<$Res>
    implements $ServiceDataCopyWith<$Res> {
  factory _$$_ServiceDataCopyWith(
          _$_ServiceData value, $Res Function(_$_ServiceData) then) =
      __$$_ServiceDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int serviceFee,
      String imageURL,
      List<PaymentProduct> products,
      bool isOptional});
}

/// @nodoc
class __$$_ServiceDataCopyWithImpl<$Res> extends _$ServiceDataCopyWithImpl<$Res>
    implements _$$_ServiceDataCopyWith<$Res> {
  __$$_ServiceDataCopyWithImpl(
      _$_ServiceData _value, $Res Function(_$_ServiceData) _then)
      : super(_value, (v) => _then(v as _$_ServiceData));

  @override
  _$_ServiceData get _value => super._value as _$_ServiceData;

  @override
  $Res call({
    Object? name = freezed,
    Object? serviceFee = freezed,
    Object? imageURL = freezed,
    Object? products = freezed,
    Object? isOptional = freezed,
  }) {
    return _then(_$_ServiceData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      serviceFee: serviceFee == freezed
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as int,
      imageURL: imageURL == freezed
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PaymentProduct>,
      isOptional: isOptional == freezed
          ? _value.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ServiceData implements _ServiceData {
  _$_ServiceData(
      {required this.name,
      required this.serviceFee,
      required this.imageURL,
      required final List<PaymentProduct> products,
      required this.isOptional})
      : _products = products;

  @override
  final String name;
  @override
  final int serviceFee;
  @override
  final String imageURL;
  final List<PaymentProduct> _products;
  @override
  List<PaymentProduct> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final bool isOptional;

  @override
  String toString() {
    return 'ServiceData(name: $name, serviceFee: $serviceFee, imageURL: $imageURL, products: $products, isOptional: $isOptional)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.serviceFee, serviceFee) &&
            const DeepCollectionEquality().equals(other.imageURL, imageURL) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.isOptional, isOptional));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(serviceFee),
      const DeepCollectionEquality().hash(imageURL),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(isOptional));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceDataCopyWith<_$_ServiceData> get copyWith =>
      __$$_ServiceDataCopyWithImpl<_$_ServiceData>(this, _$identity);
}

abstract class _ServiceData implements ServiceData {
  factory _ServiceData(
      {required final String name,
      required final int serviceFee,
      required final String imageURL,
      required final List<PaymentProduct> products,
      required final bool isOptional}) = _$_ServiceData;

  @override
  String get name;
  @override
  int get serviceFee;
  @override
  String get imageURL;
  @override
  List<PaymentProduct> get products;
  @override
  bool get isOptional;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceDataCopyWith<_$_ServiceData> get copyWith =>
      throw _privateConstructorUsedError;
}
