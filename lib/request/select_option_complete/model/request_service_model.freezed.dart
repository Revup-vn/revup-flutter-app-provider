// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestServiceModel {
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestServiceModelCopyWith<RequestServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestServiceModelCopyWith<$Res> {
  factory $RequestServiceModelCopyWith(
          RequestServiceModel value, $Res Function(RequestServiceModel) then) =
      _$RequestServiceModelCopyWithImpl<$Res>;
  $Res call({String name, int price});
}

/// @nodoc
class _$RequestServiceModelCopyWithImpl<$Res>
    implements $RequestServiceModelCopyWith<$Res> {
  _$RequestServiceModelCopyWithImpl(this._value, this._then);

  final RequestServiceModel _value;
  // ignore: unused_field
  final $Res Function(RequestServiceModel) _then;

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
abstract class _$$_RequestServiceModelCopyWith<$Res>
    implements $RequestServiceModelCopyWith<$Res> {
  factory _$$_RequestServiceModelCopyWith(_$_RequestServiceModel value,
          $Res Function(_$_RequestServiceModel) then) =
      __$$_RequestServiceModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, int price});
}

/// @nodoc
class __$$_RequestServiceModelCopyWithImpl<$Res>
    extends _$RequestServiceModelCopyWithImpl<$Res>
    implements _$$_RequestServiceModelCopyWith<$Res> {
  __$$_RequestServiceModelCopyWithImpl(_$_RequestServiceModel _value,
      $Res Function(_$_RequestServiceModel) _then)
      : super(_value, (v) => _then(v as _$_RequestServiceModel));

  @override
  _$_RequestServiceModel get _value => super._value as _$_RequestServiceModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_RequestServiceModel(
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

class _$_RequestServiceModel implements _RequestServiceModel {
  const _$_RequestServiceModel({required this.name, required this.price});

  @override
  final String name;
  @override
  final int price;

  @override
  String toString() {
    return 'RequestServiceModel(name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestServiceModel &&
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
  _$$_RequestServiceModelCopyWith<_$_RequestServiceModel> get copyWith =>
      __$$_RequestServiceModelCopyWithImpl<_$_RequestServiceModel>(
          this, _$identity);
}

abstract class _RequestServiceModel implements RequestServiceModel {
  const factory _RequestServiceModel(
      {required final String name,
      required final int price}) = _$_RequestServiceModel;

  @override
  String get name;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_RequestServiceModelCopyWith<_$_RequestServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
