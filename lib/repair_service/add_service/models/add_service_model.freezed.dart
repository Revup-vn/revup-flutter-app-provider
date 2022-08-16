// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddServiceModel {
  String get img => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  int get serviceFee => throw _privateConstructorUsedError;
  String get cate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddServiceModelCopyWith<AddServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddServiceModelCopyWith<$Res> {
  factory $AddServiceModelCopyWith(
          AddServiceModel value, $Res Function(AddServiceModel) then) =
      _$AddServiceModelCopyWithImpl<$Res>;
  $Res call({String img, String serviceName, int serviceFee, String cate});
}

/// @nodoc
class _$AddServiceModelCopyWithImpl<$Res>
    implements $AddServiceModelCopyWith<$Res> {
  _$AddServiceModelCopyWithImpl(this._value, this._then);

  final AddServiceModel _value;
  // ignore: unused_field
  final $Res Function(AddServiceModel) _then;

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
abstract class _$$_AddServiceModelCopyWith<$Res>
    implements $AddServiceModelCopyWith<$Res> {
  factory _$$_AddServiceModelCopyWith(
          _$_AddServiceModel value, $Res Function(_$_AddServiceModel) then) =
      __$$_AddServiceModelCopyWithImpl<$Res>;
  @override
  $Res call({String img, String serviceName, int serviceFee, String cate});
}

/// @nodoc
class __$$_AddServiceModelCopyWithImpl<$Res>
    extends _$AddServiceModelCopyWithImpl<$Res>
    implements _$$_AddServiceModelCopyWith<$Res> {
  __$$_AddServiceModelCopyWithImpl(
      _$_AddServiceModel _value, $Res Function(_$_AddServiceModel) _then)
      : super(_value, (v) => _then(v as _$_AddServiceModel));

  @override
  _$_AddServiceModel get _value => super._value as _$_AddServiceModel;

  @override
  $Res call({
    Object? img = freezed,
    Object? serviceName = freezed,
    Object? serviceFee = freezed,
    Object? cate = freezed,
  }) {
    return _then(_$_AddServiceModel(
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

class _$_AddServiceModel implements _AddServiceModel {
  const _$_AddServiceModel(
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
    return 'AddServiceModel(img: $img, serviceName: $serviceName, serviceFee: $serviceFee, cate: $cate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddServiceModel &&
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
  _$$_AddServiceModelCopyWith<_$_AddServiceModel> get copyWith =>
      __$$_AddServiceModelCopyWithImpl<_$_AddServiceModel>(this, _$identity);
}

abstract class _AddServiceModel implements AddServiceModel {
  const factory _AddServiceModel(
      {required final String img,
      required final String serviceName,
      required final int serviceFee,
      required final String cate}) = _$_AddServiceModel;

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
  _$$_AddServiceModelCopyWith<_$_AddServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
