// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'myservicedata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyServiceData {
  String get name => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  int get fee => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyServiceDataCopyWith<MyServiceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyServiceDataCopyWith<$Res> {
  factory $MyServiceDataCopyWith(
          MyServiceData value, $Res Function(MyServiceData) then) =
      _$MyServiceDataCopyWithImpl<$Res>;
  $Res call({String name, String imgUrl, int fee});
}

/// @nodoc
class _$MyServiceDataCopyWithImpl<$Res>
    implements $MyServiceDataCopyWith<$Res> {
  _$MyServiceDataCopyWithImpl(this._value, this._then);

  final MyServiceData _value;
  // ignore: unused_field
  final $Res Function(MyServiceData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? imgUrl = freezed,
    Object? fee = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_MyServiceDataCopyWith<$Res>
    implements $MyServiceDataCopyWith<$Res> {
  factory _$$_MyServiceDataCopyWith(
          _$_MyServiceData value, $Res Function(_$_MyServiceData) then) =
      __$$_MyServiceDataCopyWithImpl<$Res>;
  @override
  $Res call({String name, String imgUrl, int fee});
}

/// @nodoc
class __$$_MyServiceDataCopyWithImpl<$Res>
    extends _$MyServiceDataCopyWithImpl<$Res>
    implements _$$_MyServiceDataCopyWith<$Res> {
  __$$_MyServiceDataCopyWithImpl(
      _$_MyServiceData _value, $Res Function(_$_MyServiceData) _then)
      : super(_value, (v) => _then(v as _$_MyServiceData));

  @override
  _$_MyServiceData get _value => super._value as _$_MyServiceData;

  @override
  $Res call({
    Object? name = freezed,
    Object? imgUrl = freezed,
    Object? fee = freezed,
  }) {
    return _then(_$_MyServiceData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MyServiceData implements _MyServiceData {
  _$_MyServiceData(
      {required this.name, required this.imgUrl, required this.fee});

  @override
  final String name;
  @override
  final String imgUrl;
  @override
  final int fee;

  @override
  String toString() {
    return 'MyServiceData(name: $name, imgUrl: $imgUrl, fee: $fee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyServiceData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl) &&
            const DeepCollectionEquality().equals(other.fee, fee));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imgUrl),
      const DeepCollectionEquality().hash(fee));

  @JsonKey(ignore: true)
  @override
  _$$_MyServiceDataCopyWith<_$_MyServiceData> get copyWith =>
      __$$_MyServiceDataCopyWithImpl<_$_MyServiceData>(this, _$identity);
}

abstract class _MyServiceData implements MyServiceData {
  factory _MyServiceData(
      {required final String name,
      required final String imgUrl,
      required final int fee}) = _$_MyServiceData;

  @override
  String get name;
  @override
  String get imgUrl;
  @override
  int get fee;
  @override
  @JsonKey(ignore: true)
  _$$_MyServiceDataCopyWith<_$_MyServiceData> get copyWith =>
      throw _privateConstructorUsedError;
}
