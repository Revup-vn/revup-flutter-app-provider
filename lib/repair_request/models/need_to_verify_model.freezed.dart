// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'need_to_verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NeedToVerifyModel {
  String get serviceName => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  int? get quotePrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NeedToVerifyModelCopyWith<NeedToVerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NeedToVerifyModelCopyWith<$Res> {
  factory $NeedToVerifyModelCopyWith(
          NeedToVerifyModel value, $Res Function(NeedToVerifyModel) then) =
      _$NeedToVerifyModelCopyWithImpl<$Res>;
  $Res call({String serviceName, String desc, int? quotePrice});
}

/// @nodoc
class _$NeedToVerifyModelCopyWithImpl<$Res>
    implements $NeedToVerifyModelCopyWith<$Res> {
  _$NeedToVerifyModelCopyWithImpl(this._value, this._then);

  final NeedToVerifyModel _value;
  // ignore: unused_field
  final $Res Function(NeedToVerifyModel) _then;

  @override
  $Res call({
    Object? serviceName = freezed,
    Object? desc = freezed,
    Object? quotePrice = freezed,
  }) {
    return _then(_value.copyWith(
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      quotePrice: quotePrice == freezed
          ? _value.quotePrice
          : quotePrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_NeedToVerifyModelCopyWith<$Res>
    implements $NeedToVerifyModelCopyWith<$Res> {
  factory _$$_NeedToVerifyModelCopyWith(_$_NeedToVerifyModel value,
          $Res Function(_$_NeedToVerifyModel) then) =
      __$$_NeedToVerifyModelCopyWithImpl<$Res>;
  @override
  $Res call({String serviceName, String desc, int? quotePrice});
}

/// @nodoc
class __$$_NeedToVerifyModelCopyWithImpl<$Res>
    extends _$NeedToVerifyModelCopyWithImpl<$Res>
    implements _$$_NeedToVerifyModelCopyWith<$Res> {
  __$$_NeedToVerifyModelCopyWithImpl(
      _$_NeedToVerifyModel _value, $Res Function(_$_NeedToVerifyModel) _then)
      : super(_value, (v) => _then(v as _$_NeedToVerifyModel));

  @override
  _$_NeedToVerifyModel get _value => super._value as _$_NeedToVerifyModel;

  @override
  $Res call({
    Object? serviceName = freezed,
    Object? desc = freezed,
    Object? quotePrice = freezed,
  }) {
    return _then(_$_NeedToVerifyModel(
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      desc: desc == freezed
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      quotePrice: quotePrice == freezed
          ? _value.quotePrice
          : quotePrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_NeedToVerifyModel implements _NeedToVerifyModel {
  const _$_NeedToVerifyModel(
      {required this.serviceName, required this.desc, this.quotePrice});

  @override
  final String serviceName;
  @override
  final String desc;
  @override
  final int? quotePrice;

  @override
  String toString() {
    return 'NeedToVerifyModel(serviceName: $serviceName, desc: $desc, quotePrice: $quotePrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NeedToVerifyModel &&
            const DeepCollectionEquality()
                .equals(other.serviceName, serviceName) &&
            const DeepCollectionEquality().equals(other.desc, desc) &&
            const DeepCollectionEquality()
                .equals(other.quotePrice, quotePrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(desc),
      const DeepCollectionEquality().hash(quotePrice));

  @JsonKey(ignore: true)
  @override
  _$$_NeedToVerifyModelCopyWith<_$_NeedToVerifyModel> get copyWith =>
      __$$_NeedToVerifyModelCopyWithImpl<_$_NeedToVerifyModel>(
          this, _$identity);
}

abstract class _NeedToVerifyModel implements NeedToVerifyModel {
  const factory _NeedToVerifyModel(
      {required final String serviceName,
      required final String desc,
      final int? quotePrice}) = _$_NeedToVerifyModel;

  @override
  String get serviceName;
  @override
  String get desc;
  @override
  int? get quotePrice;
  @override
  @JsonKey(ignore: true)
  _$$_NeedToVerifyModelCopyWith<_$_NeedToVerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
