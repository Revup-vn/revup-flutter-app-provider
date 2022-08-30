// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'commonservice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonService {
  String get sName => throw _privateConstructorUsedError;
  int get sFee => throw _privateConstructorUsedError;
  String get sImg => throw _privateConstructorUsedError;
  List<RepairProduct> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonServiceCopyWith<CommonService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonServiceCopyWith<$Res> {
  factory $CommonServiceCopyWith(
          CommonService value, $Res Function(CommonService) then) =
      _$CommonServiceCopyWithImpl<$Res>;
  $Res call(
      {String sName, int sFee, String sImg, List<RepairProduct> products});
}

/// @nodoc
class _$CommonServiceCopyWithImpl<$Res>
    implements $CommonServiceCopyWith<$Res> {
  _$CommonServiceCopyWithImpl(this._value, this._then);

  final CommonService _value;
  // ignore: unused_field
  final $Res Function(CommonService) _then;

  @override
  $Res call({
    Object? sName = freezed,
    Object? sFee = freezed,
    Object? sImg = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      sName: sName == freezed
          ? _value.sName
          : sName // ignore: cast_nullable_to_non_nullable
              as String,
      sFee: sFee == freezed
          ? _value.sFee
          : sFee // ignore: cast_nullable_to_non_nullable
              as int,
      sImg: sImg == freezed
          ? _value.sImg
          : sImg // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<RepairProduct>,
    ));
  }
}

/// @nodoc
abstract class _$$_CommonServiceCopyWith<$Res>
    implements $CommonServiceCopyWith<$Res> {
  factory _$$_CommonServiceCopyWith(
          _$_CommonService value, $Res Function(_$_CommonService) then) =
      __$$_CommonServiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String sName, int sFee, String sImg, List<RepairProduct> products});
}

/// @nodoc
class __$$_CommonServiceCopyWithImpl<$Res>
    extends _$CommonServiceCopyWithImpl<$Res>
    implements _$$_CommonServiceCopyWith<$Res> {
  __$$_CommonServiceCopyWithImpl(
      _$_CommonService _value, $Res Function(_$_CommonService) _then)
      : super(_value, (v) => _then(v as _$_CommonService));

  @override
  _$_CommonService get _value => super._value as _$_CommonService;

  @override
  $Res call({
    Object? sName = freezed,
    Object? sFee = freezed,
    Object? sImg = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_CommonService(
      sName: sName == freezed
          ? _value.sName
          : sName // ignore: cast_nullable_to_non_nullable
              as String,
      sFee: sFee == freezed
          ? _value.sFee
          : sFee // ignore: cast_nullable_to_non_nullable
              as int,
      sImg: sImg == freezed
          ? _value.sImg
          : sImg // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<RepairProduct>,
    ));
  }
}

/// @nodoc

class _$_CommonService implements _CommonService {
  _$_CommonService(
      {required this.sName,
      required this.sFee,
      required this.sImg,
      required final List<RepairProduct> products})
      : _products = products;

  @override
  final String sName;
  @override
  final int sFee;
  @override
  final String sImg;
  final List<RepairProduct> _products;
  @override
  List<RepairProduct> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CommonService(sName: $sName, sFee: $sFee, sImg: $sImg, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonService &&
            const DeepCollectionEquality().equals(other.sName, sName) &&
            const DeepCollectionEquality().equals(other.sFee, sFee) &&
            const DeepCollectionEquality().equals(other.sImg, sImg) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sName),
      const DeepCollectionEquality().hash(sFee),
      const DeepCollectionEquality().hash(sImg),
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  _$$_CommonServiceCopyWith<_$_CommonService> get copyWith =>
      __$$_CommonServiceCopyWithImpl<_$_CommonService>(this, _$identity);
}

abstract class _CommonService implements CommonService {
  factory _CommonService(
      {required final String sName,
      required final int sFee,
      required final String sImg,
      required final List<RepairProduct> products}) = _$_CommonService;

  @override
  String get sName;
  @override
  int get sFee;
  @override
  String get sImg;
  @override
  List<RepairProduct> get products;
  @override
  @JsonKey(ignore: true)
  _$$_CommonServiceCopyWith<_$_CommonService> get copyWith =>
      throw _privateConstructorUsedError;
}
