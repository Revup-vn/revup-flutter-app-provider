// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'servicerawdata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServiceRawData {
  String get name => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  int get cate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String imgUrl, String feeRange, int cate)
        service,
    required TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)
        product,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String imgUrl, String feeRange, int cate)?
        service,
    TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)?
        product,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String imgUrl, String feeRange, int cate)?
        service,
    TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)?
        product,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_service value) service,
    required TResult Function(_product value) product,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_service value)? service,
    TResult Function(_product value)? product,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_service value)? service,
    TResult Function(_product value)? product,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceRawDataCopyWith<ServiceRawData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRawDataCopyWith<$Res> {
  factory $ServiceRawDataCopyWith(
          ServiceRawData value, $Res Function(ServiceRawData) then) =
      _$ServiceRawDataCopyWithImpl<$Res>;
  $Res call({String name, String imgUrl, int cate});
}

/// @nodoc
class _$ServiceRawDataCopyWithImpl<$Res>
    implements $ServiceRawDataCopyWith<$Res> {
  _$ServiceRawDataCopyWithImpl(this._value, this._then);

  final ServiceRawData _value;
  // ignore: unused_field
  final $Res Function(ServiceRawData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? imgUrl = freezed,
    Object? cate = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cate: cate == freezed
          ? _value.cate
          : cate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_serviceCopyWith<$Res>
    implements $ServiceRawDataCopyWith<$Res> {
  factory _$$_serviceCopyWith(
          _$_service value, $Res Function(_$_service) then) =
      __$$_serviceCopyWithImpl<$Res>;
  @override
  $Res call({String name, String imgUrl, String feeRange, int cate});
}

/// @nodoc
class __$$_serviceCopyWithImpl<$Res> extends _$ServiceRawDataCopyWithImpl<$Res>
    implements _$$_serviceCopyWith<$Res> {
  __$$_serviceCopyWithImpl(_$_service _value, $Res Function(_$_service) _then)
      : super(_value, (v) => _then(v as _$_service));

  @override
  _$_service get _value => super._value as _$_service;

  @override
  $Res call({
    Object? name = freezed,
    Object? imgUrl = freezed,
    Object? feeRange = freezed,
    Object? cate = freezed,
  }) {
    return _then(_$_service(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      feeRange: feeRange == freezed
          ? _value.feeRange
          : feeRange // ignore: cast_nullable_to_non_nullable
              as String,
      cate: cate == freezed
          ? _value.cate
          : cate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_service implements _service {
  _$_service(
      {required this.name,
      required this.imgUrl,
      required this.feeRange,
      required this.cate});

  @override
  final String name;
  @override
  final String imgUrl;
  @override
  final String feeRange;
  @override
  final int cate;

  @override
  String toString() {
    return 'ServiceRawData.service(name: $name, imgUrl: $imgUrl, feeRange: $feeRange, cate: $cate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_service &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.feeRange, feeRange) &&
            const DeepCollectionEquality().equals(other.cate, cate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(feeRange),
      const DeepCollectionEquality().hash(cate));

  @JsonKey(ignore: true)
  @override
  _$$_serviceCopyWith<_$_service> get copyWith =>
      __$$_serviceCopyWithImpl<_$_service>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String imgUrl, String feeRange, int cate)
        service,
    required TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)
        product,
  }) {
    return service(name, imgUrl, feeRange, cate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String imgUrl, String feeRange, int cate)?
        service,
    TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)?
        product,
  }) {
    return service?.call(name, imgUrl, feeRange, cate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String imgUrl, String feeRange, int cate)?
        service,
    TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)?
        product,
    required TResult orElse(),
  }) {
    if (service != null) {
      return service(name, imgUrl, feeRange, cate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_service value) service,
    required TResult Function(_product value) product,
  }) {
    return service(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_service value)? service,
    TResult Function(_product value)? product,
  }) {
    return service?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_service value)? service,
    TResult Function(_product value)? product,
    required TResult orElse(),
  }) {
    if (service != null) {
      return service(this);
    }
    return orElse();
  }
}

abstract class _service implements ServiceRawData {
  factory _service(
      {required final String name,
      required final String imgUrl,
      required final String feeRange,
      required final int cate}) = _$_service;

  @override
  String get name;
  @override
  String get imgUrl;
  String get feeRange;
  @override
  int get cate;
  @override
  @JsonKey(ignore: true)
  _$$_serviceCopyWith<_$_service> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_productCopyWith<$Res>
    implements $ServiceRawDataCopyWith<$Res> {
  factory _$$_productCopyWith(
          _$_product value, $Res Function(_$_product) then) =
      __$$_productCopyWithImpl<$Res>;
  @override
  $Res call({String name, String imgUrl, int fee, String sName, int cate});
}

/// @nodoc
class __$$_productCopyWithImpl<$Res> extends _$ServiceRawDataCopyWithImpl<$Res>
    implements _$$_productCopyWith<$Res> {
  __$$_productCopyWithImpl(_$_product _value, $Res Function(_$_product) _then)
      : super(_value, (v) => _then(v as _$_product));

  @override
  _$_product get _value => super._value as _$_product;

  @override
  $Res call({
    Object? name = freezed,
    Object? imgUrl = freezed,
    Object? fee = freezed,
    Object? sName = freezed,
    Object? cate = freezed,
  }) {
    return _then(_$_product(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
      sName: sName == freezed
          ? _value.sName
          : sName // ignore: cast_nullable_to_non_nullable
              as String,
      cate: cate == freezed
          ? _value.cate
          : cate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_product implements _product {
  _$_product(
      {required this.name,
      required this.imgUrl,
      required this.fee,
      required this.sName,
      required this.cate});

  @override
  final String name;
  @override
  final String imgUrl;
  @override
  final int fee;
  @override
  final String sName;
  @override
  final int cate;

  @override
  String toString() {
    return 'ServiceRawData.product(name: $name, imgUrl: $imgUrl, fee: $fee, sName: $sName, cate: $cate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_product &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.sName, sName) &&
            const DeepCollectionEquality().equals(other.cate, cate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(sName),
      const DeepCollectionEquality().hash(cate));

  @JsonKey(ignore: true)
  @override
  _$$_productCopyWith<_$_product> get copyWith =>
      __$$_productCopyWithImpl<_$_product>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String imgUrl, String feeRange, int cate)
        service,
    required TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)
        product,
  }) {
    return product(name, imgUrl, fee, sName, cate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, String imgUrl, String feeRange, int cate)?
        service,
    TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)?
        product,
  }) {
    return product?.call(name, imgUrl, fee, sName, cate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String imgUrl, String feeRange, int cate)?
        service,
    TResult Function(
            String name, String imgUrl, int fee, String sName, int cate)?
        product,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(name, imgUrl, fee, sName, cate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_service value) service,
    required TResult Function(_product value) product,
  }) {
    return product(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_service value)? service,
    TResult Function(_product value)? product,
  }) {
    return product?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_service value)? service,
    TResult Function(_product value)? product,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(this);
    }
    return orElse();
  }
}

abstract class _product implements ServiceRawData {
  factory _product(
      {required final String name,
      required final String imgUrl,
      required final int fee,
      required final String sName,
      required final int cate}) = _$_product;

  @override
  String get name;
  @override
  String get imgUrl;
  int get fee;
  String get sName;
  @override
  int get cate;
  @override
  @JsonKey(ignore: true)
  _$$_productCopyWith<_$_product> get copyWith =>
      throw _privateConstructorUsedError;
}
