// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddProductModel {
  String get imageUrl => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get productFee => throw _privateConstructorUsedError;
  String get des => throw _privateConstructorUsedError;
  String get sName => throw _privateConstructorUsedError;
  String get cate => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddProductModelCopyWith<AddProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductModelCopyWith<$Res> {
  factory $AddProductModelCopyWith(
          AddProductModel value, $Res Function(AddProductModel) then) =
      _$AddProductModelCopyWithImpl<$Res>;
  $Res call(
      {String imageUrl,
      String productName,
      int productFee,
      String des,
      String sName,
      String cate,
      bool isActive});
}

/// @nodoc
class _$AddProductModelCopyWithImpl<$Res>
    implements $AddProductModelCopyWith<$Res> {
  _$AddProductModelCopyWithImpl(this._value, this._then);

  final AddProductModel _value;
  // ignore: unused_field
  final $Res Function(AddProductModel) _then;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? productName = freezed,
    Object? productFee = freezed,
    Object? des = freezed,
    Object? sName = freezed,
    Object? cate = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productFee: productFee == freezed
          ? _value.productFee
          : productFee // ignore: cast_nullable_to_non_nullable
              as int,
      des: des == freezed
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String,
      sName: sName == freezed
          ? _value.sName
          : sName // ignore: cast_nullable_to_non_nullable
              as String,
      cate: cate == freezed
          ? _value.cate
          : cate // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AddProductModelCopyWith<$Res>
    implements $AddProductModelCopyWith<$Res> {
  factory _$$_AddProductModelCopyWith(
          _$_AddProductModel value, $Res Function(_$_AddProductModel) then) =
      __$$_AddProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String imageUrl,
      String productName,
      int productFee,
      String des,
      String sName,
      String cate,
      bool isActive});
}

/// @nodoc
class __$$_AddProductModelCopyWithImpl<$Res>
    extends _$AddProductModelCopyWithImpl<$Res>
    implements _$$_AddProductModelCopyWith<$Res> {
  __$$_AddProductModelCopyWithImpl(
      _$_AddProductModel _value, $Res Function(_$_AddProductModel) _then)
      : super(_value, (v) => _then(v as _$_AddProductModel));

  @override
  _$_AddProductModel get _value => super._value as _$_AddProductModel;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? productName = freezed,
    Object? productFee = freezed,
    Object? des = freezed,
    Object? sName = freezed,
    Object? cate = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_AddProductModel(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productFee: productFee == freezed
          ? _value.productFee
          : productFee // ignore: cast_nullable_to_non_nullable
              as int,
      des: des == freezed
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String,
      sName: sName == freezed
          ? _value.sName
          : sName // ignore: cast_nullable_to_non_nullable
              as String,
      cate: cate == freezed
          ? _value.cate
          : cate // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddProductModel implements _AddProductModel {
  _$_AddProductModel(
      {required this.imageUrl,
      required this.productName,
      required this.productFee,
      required this.des,
      required this.sName,
      required this.cate,
      required this.isActive});

  @override
  final String imageUrl;
  @override
  final String productName;
  @override
  final int productFee;
  @override
  final String des;
  @override
  final String sName;
  @override
  final String cate;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'AddProductModel(imageUrl: $imageUrl, productName: $productName, productFee: $productFee, des: $des, sName: $sName, cate: $cate, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddProductModel &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality()
                .equals(other.productFee, productFee) &&
            const DeepCollectionEquality().equals(other.des, des) &&
            const DeepCollectionEquality().equals(other.sName, sName) &&
            const DeepCollectionEquality().equals(other.cate, cate) &&
            const DeepCollectionEquality().equals(other.isActive, isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(productFee),
      const DeepCollectionEquality().hash(des),
      const DeepCollectionEquality().hash(sName),
      const DeepCollectionEquality().hash(cate),
      const DeepCollectionEquality().hash(isActive));

  @JsonKey(ignore: true)
  @override
  _$$_AddProductModelCopyWith<_$_AddProductModel> get copyWith =>
      __$$_AddProductModelCopyWithImpl<_$_AddProductModel>(this, _$identity);
}

abstract class _AddProductModel implements AddProductModel {
  factory _AddProductModel(
      {required final String imageUrl,
      required final String productName,
      required final int productFee,
      required final String des,
      required final String sName,
      required final String cate,
      required final bool isActive}) = _$_AddProductModel;

  @override
  String get imageUrl;
  @override
  String get productName;
  @override
  int get productFee;
  @override
  String get des;
  @override
  String get sName;
  @override
  String get cate;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_AddProductModelCopyWith<_$_AddProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
