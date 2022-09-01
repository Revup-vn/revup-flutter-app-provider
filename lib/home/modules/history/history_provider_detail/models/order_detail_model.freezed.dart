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
  int get vehicleType => throw _privateConstructorUsedError;
  List<String> get serviceName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get totalServiceFee => throw _privateConstructorUsedError;
  int get feeTransport => throw _privateConstructorUsedError;

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
      {int vehicleType,
      List<String> serviceName,
      String address,
      int totalServiceFee,
      int feeTransport});
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
    Object? totalServiceFee = freezed,
    Object? feeTransport = freezed,
  }) {
    return _then(_value.copyWith(
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as int,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      totalServiceFee: totalServiceFee == freezed
          ? _value.totalServiceFee
          : totalServiceFee // ignore: cast_nullable_to_non_nullable
              as int,
      feeTransport: feeTransport == freezed
          ? _value.feeTransport
          : feeTransport // ignore: cast_nullable_to_non_nullable
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
      {int vehicleType,
      List<String> serviceName,
      String address,
      int totalServiceFee,
      int feeTransport});
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
    Object? totalServiceFee = freezed,
    Object? feeTransport = freezed,
  }) {
    return _then(_$_OrderDetailModel(
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as int,
      serviceName: serviceName == freezed
          ? _value._serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      totalServiceFee: totalServiceFee == freezed
          ? _value.totalServiceFee
          : totalServiceFee // ignore: cast_nullable_to_non_nullable
              as int,
      feeTransport: feeTransport == freezed
          ? _value.feeTransport
          : feeTransport // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OrderDetailModel implements _OrderDetailModel {
  const _$_OrderDetailModel(
      {required this.vehicleType,
      required final List<String> serviceName,
      required this.address,
      required this.totalServiceFee,
      required this.feeTransport})
      : _serviceName = serviceName;

  @override
  final int vehicleType;
  final List<String> _serviceName;
  @override
  List<String> get serviceName {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceName);
  }

  @override
  final String address;
  @override
  final int totalServiceFee;
  @override
  final int feeTransport;

  @override
  String toString() {
    return 'OrderDetailModel(vehicleType: $vehicleType, serviceName: $serviceName, address: $address, totalServiceFee: $totalServiceFee, feeTransport: $feeTransport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetailModel &&
            const DeepCollectionEquality()
                .equals(other.vehicleType, vehicleType) &&
            const DeepCollectionEquality()
                .equals(other._serviceName, _serviceName) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.totalServiceFee, totalServiceFee) &&
            const DeepCollectionEquality()
                .equals(other.feeTransport, feeTransport));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(vehicleType),
      const DeepCollectionEquality().hash(_serviceName),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(totalServiceFee),
      const DeepCollectionEquality().hash(feeTransport));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDetailModelCopyWith<_$_OrderDetailModel> get copyWith =>
      __$$_OrderDetailModelCopyWithImpl<_$_OrderDetailModel>(this, _$identity);
}

abstract class _OrderDetailModel implements OrderDetailModel {
  const factory _OrderDetailModel(
      {required final int vehicleType,
      required final List<String> serviceName,
      required final String address,
      required final int totalServiceFee,
      required final int feeTransport}) = _$_OrderDetailModel;

  @override
  int get vehicleType;
  @override
  List<String> get serviceName;
  @override
  String get address;
  @override
  int get totalServiceFee;
  @override
  int get feeTransport;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailModelCopyWith<_$_OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
