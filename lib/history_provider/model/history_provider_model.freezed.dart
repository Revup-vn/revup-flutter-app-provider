// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryProviderModel {
  bool get isComplete => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  DateTime get serviceStartBooking => throw _privateConstructorUsedError;
  String get orderStatusNotification => throw _privateConstructorUsedError;
  AppUser get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryProviderModelCopyWith<HistoryProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryProviderModelCopyWith<$Res> {
  factory $HistoryProviderModelCopyWith(HistoryProviderModel value,
          $Res Function(HistoryProviderModel) then) =
      _$HistoryProviderModelCopyWithImpl<$Res>;
  $Res call(
      {bool isComplete,
      String orderNumber,
      String vehicleType,
      String serviceName,
      DateTime serviceStartBooking,
      String orderStatusNotification,
      AppUser user});

  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class _$HistoryProviderModelCopyWithImpl<$Res>
    implements $HistoryProviderModelCopyWith<$Res> {
  _$HistoryProviderModelCopyWithImpl(this._value, this._then);

  final HistoryProviderModel _value;
  // ignore: unused_field
  final $Res Function(HistoryProviderModel) _then;

  @override
  $Res call({
    Object? isComplete = freezed,
    Object? orderNumber = freezed,
    Object? vehicleType = freezed,
    Object? serviceName = freezed,
    Object? serviceStartBooking = freezed,
    Object? orderStatusNotification = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isComplete: isComplete == freezed
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      orderNumber: orderNumber == freezed
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceStartBooking: serviceStartBooking == freezed
          ? _value.serviceStartBooking
          : serviceStartBooking // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderStatusNotification: orderStatusNotification == freezed
          ? _value.orderStatusNotification
          : orderStatusNotification // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
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
abstract class _$$_HistoryProviderModelCopyWith<$Res>
    implements $HistoryProviderModelCopyWith<$Res> {
  factory _$$_HistoryProviderModelCopyWith(_$_HistoryProviderModel value,
          $Res Function(_$_HistoryProviderModel) then) =
      __$$_HistoryProviderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isComplete,
      String orderNumber,
      String vehicleType,
      String serviceName,
      DateTime serviceStartBooking,
      String orderStatusNotification,
      AppUser user});

  @override
  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_HistoryProviderModelCopyWithImpl<$Res>
    extends _$HistoryProviderModelCopyWithImpl<$Res>
    implements _$$_HistoryProviderModelCopyWith<$Res> {
  __$$_HistoryProviderModelCopyWithImpl(_$_HistoryProviderModel _value,
      $Res Function(_$_HistoryProviderModel) _then)
      : super(_value, (v) => _then(v as _$_HistoryProviderModel));

  @override
  _$_HistoryProviderModel get _value => super._value as _$_HistoryProviderModel;

  @override
  $Res call({
    Object? isComplete = freezed,
    Object? orderNumber = freezed,
    Object? vehicleType = freezed,
    Object? serviceName = freezed,
    Object? serviceStartBooking = freezed,
    Object? orderStatusNotification = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_HistoryProviderModel(
      isComplete: isComplete == freezed
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      orderNumber: orderNumber == freezed
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceStartBooking: serviceStartBooking == freezed
          ? _value.serviceStartBooking
          : serviceStartBooking // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderStatusNotification: orderStatusNotification == freezed
          ? _value.orderStatusNotification
          : orderStatusNotification // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ));
  }
}

/// @nodoc

class _$_HistoryProviderModel implements _HistoryProviderModel {
  const _$_HistoryProviderModel(
      {required this.isComplete,
      required this.orderNumber,
      required this.vehicleType,
      required this.serviceName,
      required this.serviceStartBooking,
      required this.orderStatusNotification,
      required this.user});

  @override
  final bool isComplete;
  @override
  final String orderNumber;
  @override
  final String vehicleType;
  @override
  final String serviceName;
  @override
  final DateTime serviceStartBooking;
  @override
  final String orderStatusNotification;
  @override
  final AppUser user;

  @override
  String toString() {
    return 'HistoryProviderModel(isComplete: $isComplete, orderNumber: $orderNumber, vehicleType: $vehicleType, serviceName: $serviceName, serviceStartBooking: $serviceStartBooking, orderStatusNotification: $orderStatusNotification, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryProviderModel &&
            const DeepCollectionEquality()
                .equals(other.isComplete, isComplete) &&
            const DeepCollectionEquality()
                .equals(other.orderNumber, orderNumber) &&
            const DeepCollectionEquality()
                .equals(other.vehicleType, vehicleType) &&
            const DeepCollectionEquality()
                .equals(other.serviceName, serviceName) &&
            const DeepCollectionEquality()
                .equals(other.serviceStartBooking, serviceStartBooking) &&
            const DeepCollectionEquality().equals(
                other.orderStatusNotification, orderStatusNotification) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isComplete),
      const DeepCollectionEquality().hash(orderNumber),
      const DeepCollectionEquality().hash(vehicleType),
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(serviceStartBooking),
      const DeepCollectionEquality().hash(orderStatusNotification),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryProviderModelCopyWith<_$_HistoryProviderModel> get copyWith =>
      __$$_HistoryProviderModelCopyWithImpl<_$_HistoryProviderModel>(
          this, _$identity);
}

abstract class _HistoryProviderModel implements HistoryProviderModel {
  const factory _HistoryProviderModel(
      {required final bool isComplete,
      required final String orderNumber,
      required final String vehicleType,
      required final String serviceName,
      required final DateTime serviceStartBooking,
      required final String orderStatusNotification,
      required final AppUser user}) = _$_HistoryProviderModel;

  @override
  bool get isComplete;
  @override
  String get orderNumber;
  @override
  String get vehicleType;
  @override
  String get serviceName;
  @override
  DateTime get serviceStartBooking;
  @override
  String get orderStatusNotification;
  @override
  AppUser get user;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryProviderModelCopyWith<_$_HistoryProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
