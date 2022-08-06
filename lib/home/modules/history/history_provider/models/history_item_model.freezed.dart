// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'history_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HistoryItemModel {
  String get orderNumber => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  DateTime get serviceStartBooking => throw _privateConstructorUsedError;
  String get orderStatusNotification => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryItemModelCopyWith<HistoryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryItemModelCopyWith<$Res> {
  factory $HistoryItemModelCopyWith(
          HistoryItemModel value, $Res Function(HistoryItemModel) then) =
      _$HistoryItemModelCopyWithImpl<$Res>;
  $Res call(
      {String orderNumber,
      String vehicleType,
      String serviceName,
      DateTime serviceStartBooking,
      String orderStatusNotification,
      UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$HistoryItemModelCopyWithImpl<$Res>
    implements $HistoryItemModelCopyWith<$Res> {
  _$HistoryItemModelCopyWithImpl(this._value, this._then);

  final HistoryItemModel _value;
  // ignore: unused_field
  final $Res Function(HistoryItemModel) _then;

  @override
  $Res call({
    Object? orderNumber = freezed,
    Object? vehicleType = freezed,
    Object? serviceName = freezed,
    Object? serviceStartBooking = freezed,
    Object? orderStatusNotification = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
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
              as UserModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_HistoryItemModelCopyWith<$Res>
    implements $HistoryItemModelCopyWith<$Res> {
  factory _$$_HistoryItemModelCopyWith(
          _$_HistoryItemModel value, $Res Function(_$_HistoryItemModel) then) =
      __$$_HistoryItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String orderNumber,
      String vehicleType,
      String serviceName,
      DateTime serviceStartBooking,
      String orderStatusNotification,
      UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_HistoryItemModelCopyWithImpl<$Res>
    extends _$HistoryItemModelCopyWithImpl<$Res>
    implements _$$_HistoryItemModelCopyWith<$Res> {
  __$$_HistoryItemModelCopyWithImpl(
      _$_HistoryItemModel _value, $Res Function(_$_HistoryItemModel) _then)
      : super(_value, (v) => _then(v as _$_HistoryItemModel));

  @override
  _$_HistoryItemModel get _value => super._value as _$_HistoryItemModel;

  @override
  $Res call({
    Object? orderNumber = freezed,
    Object? vehicleType = freezed,
    Object? serviceName = freezed,
    Object? serviceStartBooking = freezed,
    Object? orderStatusNotification = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_HistoryItemModel(
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
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_HistoryItemModel implements _HistoryItemModel {
  const _$_HistoryItemModel(
      {required this.orderNumber,
      required this.vehicleType,
      required this.serviceName,
      required this.serviceStartBooking,
      required this.orderStatusNotification,
      required this.user});

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
  final UserModel user;

  @override
  String toString() {
    return 'HistoryItemModel(orderNumber: $orderNumber, vehicleType: $vehicleType, serviceName: $serviceName, serviceStartBooking: $serviceStartBooking, orderStatusNotification: $orderStatusNotification, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryItemModel &&
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
      const DeepCollectionEquality().hash(orderNumber),
      const DeepCollectionEquality().hash(vehicleType),
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(serviceStartBooking),
      const DeepCollectionEquality().hash(orderStatusNotification),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryItemModelCopyWith<_$_HistoryItemModel> get copyWith =>
      __$$_HistoryItemModelCopyWithImpl<_$_HistoryItemModel>(this, _$identity);
}

abstract class _HistoryItemModel implements HistoryItemModel {
  const factory _HistoryItemModel(
      {required final String orderNumber,
      required final String vehicleType,
      required final String serviceName,
      required final DateTime serviceStartBooking,
      required final String orderStatusNotification,
      required final UserModel user}) = _$_HistoryItemModel;

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
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryItemModelCopyWith<_$_HistoryItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
