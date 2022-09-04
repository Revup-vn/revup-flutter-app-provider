// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateServiceModel {
  String get img => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  int get serviceFee => throw _privateConstructorUsedError;
  String get cate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateServiceModelCopyWith<UpdateServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateServiceModelCopyWith<$Res> {
  factory $UpdateServiceModelCopyWith(
          UpdateServiceModel value, $Res Function(UpdateServiceModel) then) =
      _$UpdateServiceModelCopyWithImpl<$Res>;
  $Res call({String img, String serviceName, int serviceFee, String cate});
}

/// @nodoc
class _$UpdateServiceModelCopyWithImpl<$Res>
    implements $UpdateServiceModelCopyWith<$Res> {
  _$UpdateServiceModelCopyWithImpl(this._value, this._then);

  final UpdateServiceModel _value;
  // ignore: unused_field
  final $Res Function(UpdateServiceModel) _then;

  @override
  $Res call({
    Object? img = freezed,
    Object? serviceName = freezed,
    Object? serviceFee = freezed,
    Object? cate = freezed,
  }) {
    return _then(_value.copyWith(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceFee: serviceFee == freezed
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as int,
      cate: cate == freezed
          ? _value.cate
          : cate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UpdateServiceModelCopyWith<$Res>
    implements $UpdateServiceModelCopyWith<$Res> {
  factory _$$_UpdateServiceModelCopyWith(_$_UpdateServiceModel value,
          $Res Function(_$_UpdateServiceModel) then) =
      __$$_UpdateServiceModelCopyWithImpl<$Res>;
  @override
  $Res call({String img, String serviceName, int serviceFee, String cate});
}

/// @nodoc
class __$$_UpdateServiceModelCopyWithImpl<$Res>
    extends _$UpdateServiceModelCopyWithImpl<$Res>
    implements _$$_UpdateServiceModelCopyWith<$Res> {
  __$$_UpdateServiceModelCopyWithImpl(
      _$_UpdateServiceModel _value, $Res Function(_$_UpdateServiceModel) _then)
      : super(_value, (v) => _then(v as _$_UpdateServiceModel));

  @override
  _$_UpdateServiceModel get _value => super._value as _$_UpdateServiceModel;

  @override
  $Res call({
    Object? img = freezed,
    Object? serviceName = freezed,
    Object? serviceFee = freezed,
    Object? cate = freezed,
  }) {
    return _then(_$_UpdateServiceModel(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceFee: serviceFee == freezed
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as int,
      cate: cate == freezed
          ? _value.cate
          : cate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateServiceModel implements _UpdateServiceModel {
  const _$_UpdateServiceModel(
      {required this.img,
      required this.serviceName,
      required this.serviceFee,
      required this.cate});

  @override
  final String img;
  @override
  final String serviceName;
  @override
  final int serviceFee;
  @override
  final String cate;

  @override
  String toString() {
    return 'UpdateServiceModel(img: $img, serviceName: $serviceName, serviceFee: $serviceFee, cate: $cate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateServiceModel &&
            const DeepCollectionEquality().equals(other.img, img) &&
            const DeepCollectionEquality()
                .equals(other.serviceName, serviceName) &&
            const DeepCollectionEquality()
                .equals(other.serviceFee, serviceFee) &&
            const DeepCollectionEquality().equals(other.cate, cate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(img),
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(serviceFee),
      const DeepCollectionEquality().hash(cate));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateServiceModelCopyWith<_$_UpdateServiceModel> get copyWith =>
      __$$_UpdateServiceModelCopyWithImpl<_$_UpdateServiceModel>(
          this, _$identity);
}

abstract class _UpdateServiceModel implements UpdateServiceModel {
  const factory _UpdateServiceModel(
      {required final String img,
      required final String serviceName,
      required final int serviceFee,
      required final String cate}) = _$_UpdateServiceModel;

  @override
  String get img;
  @override
  String get serviceName;
  @override
  int get serviceFee;
  @override
  String get cate;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateServiceModelCopyWith<_$_UpdateServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
