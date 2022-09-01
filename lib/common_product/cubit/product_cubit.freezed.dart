// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(File img) addImgSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(File img)? addImgSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(File img)? addImgSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddImgSuccess value) addImgSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddImgSuccess value)? addImgSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddImgSuccess value)? addImgSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res> implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  final ProductState _value;
  // ignore: unused_field
  final $Res Function(ProductState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$ProductStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ProductState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(File img) addImgSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(File img)? addImgSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(File img)? addImgSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddImgSuccess value) addImgSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddImgSuccess value)? addImgSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddImgSuccess value)? addImgSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_AddImgSuccessCopyWith<$Res> {
  factory _$$_AddImgSuccessCopyWith(
          _$_AddImgSuccess value, $Res Function(_$_AddImgSuccess) then) =
      __$$_AddImgSuccessCopyWithImpl<$Res>;
  $Res call({File img});
}

/// @nodoc
class __$$_AddImgSuccessCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res>
    implements _$$_AddImgSuccessCopyWith<$Res> {
  __$$_AddImgSuccessCopyWithImpl(
      _$_AddImgSuccess _value, $Res Function(_$_AddImgSuccess) _then)
      : super(_value, (v) => _then(v as _$_AddImgSuccess));

  @override
  _$_AddImgSuccess get _value => super._value as _$_AddImgSuccess;

  @override
  $Res call({
    Object? img = freezed,
  }) {
    return _then(_$_AddImgSuccess(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_AddImgSuccess implements _AddImgSuccess {
  const _$_AddImgSuccess({required this.img});

  @override
  final File img;

  @override
  String toString() {
    return 'ProductState.addImgSuccess(img: $img)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddImgSuccess &&
            const DeepCollectionEquality().equals(other.img, img));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(img));

  @JsonKey(ignore: true)
  @override
  _$$_AddImgSuccessCopyWith<_$_AddImgSuccess> get copyWith =>
      __$$_AddImgSuccessCopyWithImpl<_$_AddImgSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(File img) addImgSuccess,
  }) {
    return addImgSuccess(img);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(File img)? addImgSuccess,
  }) {
    return addImgSuccess?.call(img);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(File img)? addImgSuccess,
    required TResult orElse(),
  }) {
    if (addImgSuccess != null) {
      return addImgSuccess(img);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddImgSuccess value) addImgSuccess,
  }) {
    return addImgSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddImgSuccess value)? addImgSuccess,
  }) {
    return addImgSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddImgSuccess value)? addImgSuccess,
    required TResult orElse(),
  }) {
    if (addImgSuccess != null) {
      return addImgSuccess(this);
    }
    return orElse();
  }
}

abstract class _AddImgSuccess implements ProductState {
  const factory _AddImgSuccess({required final File img}) = _$_AddImgSuccess;

  File get img;
  @JsonKey(ignore: true)
  _$$_AddImgSuccessCopyWith<_$_AddImgSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
