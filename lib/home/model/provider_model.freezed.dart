// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProviderModel {
  double get rating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProviderModelCopyWith<ProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderModelCopyWith<$Res> {
  factory $ProviderModelCopyWith(
          ProviderModel value, $Res Function(ProviderModel) then) =
      _$ProviderModelCopyWithImpl<$Res>;
  $Res call({double rating});
}

/// @nodoc
class _$ProviderModelCopyWithImpl<$Res>
    implements $ProviderModelCopyWith<$Res> {
  _$ProviderModelCopyWithImpl(this._value, this._then);

  final ProviderModel _value;
  // ignore: unused_field
  final $Res Function(ProviderModel) _then;

  @override
  $Res call({
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_ProviderModelCopyWith<$Res>
    implements $ProviderModelCopyWith<$Res> {
  factory _$$_ProviderModelCopyWith(
          _$_ProviderModel value, $Res Function(_$_ProviderModel) then) =
      __$$_ProviderModelCopyWithImpl<$Res>;
  @override
  $Res call({double rating});
}

/// @nodoc
class __$$_ProviderModelCopyWithImpl<$Res>
    extends _$ProviderModelCopyWithImpl<$Res>
    implements _$$_ProviderModelCopyWith<$Res> {
  __$$_ProviderModelCopyWithImpl(
      _$_ProviderModel _value, $Res Function(_$_ProviderModel) _then)
      : super(_value, (v) => _then(v as _$_ProviderModel));

  @override
  _$_ProviderModel get _value => super._value as _$_ProviderModel;

  @override
  $Res call({
    Object? rating = freezed,
  }) {
    return _then(_$_ProviderModel(
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ProviderModel implements _ProviderModel {
  const _$_ProviderModel({required this.rating});

  @override
  final double rating;

  @override
  String toString() {
    return 'ProviderModel(rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProviderModel &&
            const DeepCollectionEquality().equals(other.rating, rating));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(rating));

  @JsonKey(ignore: true)
  @override
  _$$_ProviderModelCopyWith<_$_ProviderModel> get copyWith =>
      __$$_ProviderModelCopyWithImpl<_$_ProviderModel>(this, _$identity);
}

abstract class _ProviderModel implements ProviderModel {
  const factory _ProviderModel({required final double rating}) =
      _$_ProviderModel;

  @override
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$_ProviderModelCopyWith<_$_ProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
