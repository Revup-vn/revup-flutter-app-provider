// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDetailModel {
  String get vehicleType => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get nameVehicleType => throw _privateConstructorUsedError;
  int get totalServiceFee => throw _privateConstructorUsedError;
  int get feeTransport => throw _privateConstructorUsedError;
  int get intoMoney => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailModelCopyWith<OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailModelCopyWith<$Res> {
  factory $OrderDetailModelCopyWith(
          OrderDetailModel value, $Res Function(OrderDetailModel) then) =
      _$OrderDetailModelCopyWithImpl<$Res>;
  $Res call(
      {String vehicleType,
      String serviceName,
      String address,
      String nameVehicleType,
      int totalServiceFee,
      int feeTransport,
      int intoMoney});
}

/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._value, this._then);

  final OrderDetailModel _value;
  // ignore: unused_field
  final $Res Function(OrderDetailModel) _then;

  @override
  $Res call({
    Object? vehicleType = freezed,
    Object? serviceName = freezed,
    Object? address = freezed,
    Object? nameVehicleType = freezed,
    Object? totalServiceFee = freezed,
    Object? feeTransport = freezed,
    Object? intoMoney = freezed,
  }) {
    return _then(_value.copyWith(
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      nameVehicleType: nameVehicleType == freezed
          ? _value.nameVehicleType
          : nameVehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      totalServiceFee: totalServiceFee == freezed
          ? _value.totalServiceFee
          : totalServiceFee // ignore: cast_nullable_to_non_nullable
              as int,
      feeTransport: feeTransport == freezed
          ? _value.feeTransport
          : feeTransport // ignore: cast_nullable_to_non_nullable
              as int,
      intoMoney: intoMoney == freezed
          ? _value.intoMoney
          : intoMoney // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderDetailModelCopyWith<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  factory _$$_OrderDetailModelCopyWith(
          _$_OrderDetailModel value, $Res Function(_$_OrderDetailModel) then) =
      __$$_OrderDetailModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String vehicleType,
      String serviceName,
      String address,
      String nameVehicleType,
      int totalServiceFee,
      int feeTransport,
      int intoMoney});
}

/// @nodoc
class __$$_OrderDetailModelCopyWithImpl<$Res>
    extends _$OrderDetailModelCopyWithImpl<$Res>
    implements _$$_OrderDetailModelCopyWith<$Res> {
  __$$_OrderDetailModelCopyWithImpl(
      _$_OrderDetailModel _value, $Res Function(_$_OrderDetailModel) _then)
      : super(_value, (v) => _then(v as _$_OrderDetailModel));

  @override
  _$_OrderDetailModel get _value => super._value as _$_OrderDetailModel;

  @override
  $Res call({
    Object? vehicleType = freezed,
    Object? serviceName = freezed,
    Object? address = freezed,
    Object? nameVehicleType = freezed,
    Object? totalServiceFee = freezed,
    Object? feeTransport = freezed,
    Object? intoMoney = freezed,
  }) {
    return _then(_$_OrderDetailModel(
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      nameVehicleType: nameVehicleType == freezed
          ? _value.nameVehicleType
          : nameVehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      totalServiceFee: totalServiceFee == freezed
          ? _value.totalServiceFee
          : totalServiceFee // ignore: cast_nullable_to_non_nullable
              as int,
      feeTransport: feeTransport == freezed
          ? _value.feeTransport
          : feeTransport // ignore: cast_nullable_to_non_nullable
              as int,
      intoMoney: intoMoney == freezed
          ? _value.intoMoney
          : intoMoney // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OrderDetailModel implements _OrderDetailModel {
  const _$_OrderDetailModel(
      {required this.vehicleType,
      required this.serviceName,
      required this.address,
      required this.nameVehicleType,
      required this.totalServiceFee,
      required this.feeTransport,
      required this.intoMoney});

  @override
  final String vehicleType;
  @override
  final String serviceName;
  @override
  final String address;
  @override
  final String nameVehicleType;
  @override
  final int totalServiceFee;
  @override
  final int feeTransport;
  @override
  final int intoMoney;

  @override
  String toString() {
    return 'OrderDetailModel(vehicleType: $vehicleType, serviceName: $serviceName, address: $address, nameVehicleType: $nameVehicleType, totalServiceFee: $totalServiceFee, feeTransport: $feeTransport, intoMoney: $intoMoney)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetailModel &&
            const DeepCollectionEquality()
                .equals(other.vehicleType, vehicleType) &&
            const DeepCollectionEquality()
                .equals(other.serviceName, serviceName) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.nameVehicleType, nameVehicleType) &&
            const DeepCollectionEquality()
                .equals(other.totalServiceFee, totalServiceFee) &&
            const DeepCollectionEquality()
                .equals(other.feeTransport, feeTransport) &&
            const DeepCollectionEquality().equals(other.intoMoney, intoMoney));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(vehicleType),
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(nameVehicleType),
      const DeepCollectionEquality().hash(totalServiceFee),
      const DeepCollectionEquality().hash(feeTransport),
      const DeepCollectionEquality().hash(intoMoney));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDetailModelCopyWith<_$_OrderDetailModel> get copyWith =>
      __$$_OrderDetailModelCopyWithImpl<_$_OrderDetailModel>(this, _$identity);
}

abstract class _OrderDetailModel implements OrderDetailModel {
  const factory _OrderDetailModel(
      {required final String vehicleType,
      required final String serviceName,
      required final String address,
      required final String nameVehicleType,
      required final int totalServiceFee,
      required final int feeTransport,
      required final int intoMoney}) = _$_OrderDetailModel;

  @override
  String get vehicleType;
  @override
  String get serviceName;
  @override
  String get address;
  @override
  String get nameVehicleType;
  @override
  int get totalServiceFee;
  @override
  int get feeTransport;
  @override
  int get intoMoney;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailModelCopyWith<_$_OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
