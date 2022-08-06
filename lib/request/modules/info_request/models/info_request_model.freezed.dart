// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'info_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InfoRequestModel {
  AppUser get user => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  int get feeTransport => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get totalService => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InfoRequestModelCopyWith<InfoRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoRequestModelCopyWith<$Res> {
  factory $InfoRequestModelCopyWith(
          InfoRequestModel value, $Res Function(InfoRequestModel) then) =
      _$InfoRequestModelCopyWithImpl<$Res>;
  $Res call(
      {AppUser user,
      double distance,
      int feeTransport,
      String vehicleType,
      String message,
      int totalService});

  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class _$InfoRequestModelCopyWithImpl<$Res>
    implements $InfoRequestModelCopyWith<$Res> {
  _$InfoRequestModelCopyWithImpl(this._value, this._then);

  final InfoRequestModel _value;
  // ignore: unused_field
  final $Res Function(InfoRequestModel) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? distance = freezed,
    Object? feeTransport = freezed,
    Object? vehicleType = freezed,
    Object? message = freezed,
    Object? totalService = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      feeTransport: feeTransport == freezed
          ? _value.feeTransport
          : feeTransport // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalService: totalService == freezed
          ? _value.totalService
          : totalService // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_InfoRequestModelCopyWith<$Res>
    implements $InfoRequestModelCopyWith<$Res> {
  factory _$$_InfoRequestModelCopyWith(
          _$_InfoRequestModel value, $Res Function(_$_InfoRequestModel) then) =
      __$$_InfoRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {AppUser user,
      double distance,
      int feeTransport,
      String vehicleType,
      String message,
      int totalService});

  @override
  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_InfoRequestModelCopyWithImpl<$Res>
    extends _$InfoRequestModelCopyWithImpl<$Res>
    implements _$$_InfoRequestModelCopyWith<$Res> {
  __$$_InfoRequestModelCopyWithImpl(
      _$_InfoRequestModel _value, $Res Function(_$_InfoRequestModel) _then)
      : super(_value, (v) => _then(v as _$_InfoRequestModel));

  @override
  _$_InfoRequestModel get _value => super._value as _$_InfoRequestModel;

  @override
  $Res call({
    Object? user = freezed,
    Object? distance = freezed,
    Object? feeTransport = freezed,
    Object? vehicleType = freezed,
    Object? message = freezed,
    Object? totalService = freezed,
  }) {
    return _then(_$_InfoRequestModel(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      feeTransport: feeTransport == freezed
          ? _value.feeTransport
          : feeTransport // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalService: totalService == freezed
          ? _value.totalService
          : totalService // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_InfoRequestModel implements _InfoRequestModel {
  const _$_InfoRequestModel(
      {required this.user,
      required this.distance,
      required this.feeTransport,
      required this.vehicleType,
      required this.message,
      required this.totalService});

  @override
  final AppUser user;
  @override
  final double distance;
  @override
  final int feeTransport;
  @override
  final String vehicleType;
  @override
  final String message;
  @override
  final int totalService;

  @override
  String toString() {
    return 'InfoRequestModel(user: $user, distance: $distance, feeTransport: $feeTransport, vehicleType: $vehicleType, message: $message, totalService: $totalService)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfoRequestModel &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality()
                .equals(other.feeTransport, feeTransport) &&
            const DeepCollectionEquality()
                .equals(other.vehicleType, vehicleType) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.totalService, totalService));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(feeTransport),
      const DeepCollectionEquality().hash(vehicleType),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(totalService));

  @JsonKey(ignore: true)
  @override
  _$$_InfoRequestModelCopyWith<_$_InfoRequestModel> get copyWith =>
      __$$_InfoRequestModelCopyWithImpl<_$_InfoRequestModel>(this, _$identity);
}

abstract class _InfoRequestModel implements InfoRequestModel {
  const factory _InfoRequestModel(
      {required final AppUser user,
      required final double distance,
      required final int feeTransport,
      required final String vehicleType,
      required final String message,
      required final int totalService}) = _$_InfoRequestModel;

  @override
  AppUser get user;
  @override
  double get distance;
  @override
  int get feeTransport;
  @override
  String get vehicleType;
  @override
  String get message;
  @override
  int get totalService;
  @override
  @JsonKey(ignore: true)
  _$$_InfoRequestModelCopyWith<_$_InfoRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
