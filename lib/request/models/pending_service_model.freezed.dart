// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pending_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PendingServiceModel {
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PendingServiceModelCopyWith<PendingServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingServiceModelCopyWith<$Res> {
  factory $PendingServiceModelCopyWith(
          PendingServiceModel value, $Res Function(PendingServiceModel) then) =
      _$PendingServiceModelCopyWithImpl<$Res>;
  $Res call({String name, int price});
}

/// @nodoc
class _$PendingServiceModelCopyWithImpl<$Res>
    implements $PendingServiceModelCopyWith<$Res> {
  _$PendingServiceModelCopyWithImpl(this._value, this._then);

  final PendingServiceModel _value;
  // ignore: unused_field
  final $Res Function(PendingServiceModel) _then;

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
abstract class _$$_PendingServiceModelCopyWith<$Res>
    implements $PendingServiceModelCopyWith<$Res> {
  factory _$$_PendingServiceModelCopyWith(_$_PendingServiceModel value,
          $Res Function(_$_PendingServiceModel) then) =
      __$$_PendingServiceModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, int price});
}

/// @nodoc
class __$$_PendingServiceModelCopyWithImpl<$Res>
    extends _$PendingServiceModelCopyWithImpl<$Res>
    implements _$$_PendingServiceModelCopyWith<$Res> {
  __$$_PendingServiceModelCopyWithImpl(_$_PendingServiceModel _value,
      $Res Function(_$_PendingServiceModel) _then)
      : super(_value, (v) => _then(v as _$_PendingServiceModel));

  @override
  _$_PendingServiceModel get _value => super._value as _$_PendingServiceModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_PendingServiceModel(
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

class _$_PendingServiceModel implements _PendingServiceModel {
  const _$_PendingServiceModel({required this.name, required this.price});

  @override
  final String name;
  @override
  final int price;

  @override
  String toString() {
    return 'PendingServiceModel(name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PendingServiceModel &&
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
  _$$_PendingServiceModelCopyWith<_$_PendingServiceModel> get copyWith =>
      __$$_PendingServiceModelCopyWithImpl<_$_PendingServiceModel>(
          this, _$identity);
}

abstract class _PendingServiceModel implements PendingServiceModel {
  const factory _PendingServiceModel(
      {required final String name,
      required final int price}) = _$_PendingServiceModel;

  @override
  String get name;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_PendingServiceModelCopyWith<_$_PendingServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
