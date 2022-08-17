// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paid_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaidServicesModel {
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaidServicesModelCopyWith<PaidServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaidServicesModelCopyWith<$Res> {
  factory $PaidServicesModelCopyWith(
          PaidServicesModel value, $Res Function(PaidServicesModel) then) =
      _$PaidServicesModelCopyWithImpl<$Res>;
  $Res call({String name, int price});
}

/// @nodoc
class _$PaidServicesModelCopyWithImpl<$Res>
    implements $PaidServicesModelCopyWith<$Res> {
  _$PaidServicesModelCopyWithImpl(this._value, this._then);

  final PaidServicesModel _value;
  // ignore: unused_field
  final $Res Function(PaidServicesModel) _then;

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
abstract class _$$_PaidServicesModelCopyWith<$Res>
    implements $PaidServicesModelCopyWith<$Res> {
  factory _$$_PaidServicesModelCopyWith(_$_PaidServicesModel value,
          $Res Function(_$_PaidServicesModel) then) =
      __$$_PaidServicesModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, int price});
}

/// @nodoc
class __$$_PaidServicesModelCopyWithImpl<$Res>
    extends _$PaidServicesModelCopyWithImpl<$Res>
    implements _$$_PaidServicesModelCopyWith<$Res> {
  __$$_PaidServicesModelCopyWithImpl(
      _$_PaidServicesModel _value, $Res Function(_$_PaidServicesModel) _then)
      : super(_value, (v) => _then(v as _$_PaidServicesModel));

  @override
  _$_PaidServicesModel get _value => super._value as _$_PaidServicesModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_PaidServicesModel(
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

class _$_PaidServicesModel implements _PaidServicesModel {
  const _$_PaidServicesModel({required this.name, required this.price});

  @override
  final String name;
  @override
  final int price;

  @override
  String toString() {
    return 'PaidServicesModel(name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaidServicesModel &&
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
  _$$_PaidServicesModelCopyWith<_$_PaidServicesModel> get copyWith =>
      __$$_PaidServicesModelCopyWithImpl<_$_PaidServicesModel>(
          this, _$identity);
}

abstract class _PaidServicesModel implements PaidServicesModel {
  const factory _PaidServicesModel(
      {required final String name,
      required final int price}) = _$_PaidServicesModel;

  @override
  String get name;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_PaidServicesModelCopyWith<_$_PaidServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
