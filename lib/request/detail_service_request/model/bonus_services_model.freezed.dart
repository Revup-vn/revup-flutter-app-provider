// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bonus_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BonusServicesModel {
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BonusServicesModelCopyWith<BonusServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusServicesModelCopyWith<$Res> {
  factory $BonusServicesModelCopyWith(
          BonusServicesModel value, $Res Function(BonusServicesModel) then) =
      _$BonusServicesModelCopyWithImpl<$Res>;
  $Res call({String name, int price});
}

/// @nodoc
class _$BonusServicesModelCopyWithImpl<$Res>
    implements $BonusServicesModelCopyWith<$Res> {
  _$BonusServicesModelCopyWithImpl(this._value, this._then);

  final BonusServicesModel _value;
  // ignore: unused_field
  final $Res Function(BonusServicesModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_BonusServicesModelCopyWith<$Res>
    implements $BonusServicesModelCopyWith<$Res> {
  factory _$$_BonusServicesModelCopyWith(_$_BonusServicesModel value,
          $Res Function(_$_BonusServicesModel) then) =
      __$$_BonusServicesModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, int price});
}

/// @nodoc
class __$$_BonusServicesModelCopyWithImpl<$Res>
    extends _$BonusServicesModelCopyWithImpl<$Res>
    implements _$$_BonusServicesModelCopyWith<$Res> {
  __$$_BonusServicesModelCopyWithImpl(
      _$_BonusServicesModel _value, $Res Function(_$_BonusServicesModel) _then)
      : super(_value, (v) => _then(v as _$_BonusServicesModel));

  @override
  _$_BonusServicesModel get _value => super._value as _$_BonusServicesModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_BonusServicesModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BonusServicesModel implements _BonusServicesModel {
  const _$_BonusServicesModel({required this.name, required this.price});

  @override
  final String name;
  @override
  final int price;

  @override
  String toString() {
    return 'BonusServicesModel(name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BonusServicesModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$_BonusServicesModelCopyWith<_$_BonusServicesModel> get copyWith =>
      __$$_BonusServicesModelCopyWithImpl<_$_BonusServicesModel>(
          this, _$identity);
}

abstract class _BonusServicesModel implements BonusServicesModel {
  const factory _BonusServicesModel(
      {required final String name,
      required final int price}) = _$_BonusServicesModel;

  @override
  String get name;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_BonusServicesModelCopyWith<_$_BonusServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
