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
  String get orderNumber => throw _privateConstructorUsedError;
  int get vehicleType => throw _privateConstructorUsedError;
  DateTime get timeCreated => throw _privateConstructorUsedError;
  int get orderStatus => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;

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
      {String orderNumber,
      int vehicleType,
      DateTime timeCreated,
      int orderStatus,
      String userName,
      String imgUrl});
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
    Object? orderNumber = freezed,
    Object? vehicleType = freezed,
    Object? timeCreated = freezed,
    Object? orderStatus = freezed,
    Object? userName = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      orderNumber: orderNumber == freezed
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as int,
      timeCreated: timeCreated == freezed
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as int,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
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
      {String orderNumber,
      int vehicleType,
      DateTime timeCreated,
      int orderStatus,
      String userName,
      String imgUrl});
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
    Object? orderNumber = freezed,
    Object? vehicleType = freezed,
    Object? timeCreated = freezed,
    Object? orderStatus = freezed,
    Object? userName = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_$_HistoryProviderModel(
      orderNumber: orderNumber == freezed
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as int,
      timeCreated: timeCreated == freezed
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as int,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HistoryProviderModel implements _HistoryProviderModel {
  const _$_HistoryProviderModel(
      {required this.orderNumber,
      required this.vehicleType,
      required this.timeCreated,
      required this.orderStatus,
      required this.userName,
      required this.imgUrl});

  @override
  final String orderNumber;
  @override
  final int vehicleType;
  @override
  final DateTime timeCreated;
  @override
  final int orderStatus;
  @override
  final String userName;
  @override
  final String imgUrl;

  @override
  String toString() {
    return 'HistoryProviderModel(orderNumber: $orderNumber, vehicleType: $vehicleType, timeCreated: $timeCreated, orderStatus: $orderStatus, userName: $userName, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryProviderModel &&
            const DeepCollectionEquality()
                .equals(other.orderNumber, orderNumber) &&
            const DeepCollectionEquality()
                .equals(other.vehicleType, vehicleType) &&
            const DeepCollectionEquality()
                .equals(other.timeCreated, timeCreated) &&
            const DeepCollectionEquality()
                .equals(other.orderStatus, orderStatus) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderNumber),
      const DeepCollectionEquality().hash(vehicleType),
      const DeepCollectionEquality().hash(timeCreated),
      const DeepCollectionEquality().hash(orderStatus),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(imgUrl));

  @JsonKey(ignore: true)
  @override
  _$$_HistoryProviderModelCopyWith<_$_HistoryProviderModel> get copyWith =>
      __$$_HistoryProviderModelCopyWithImpl<_$_HistoryProviderModel>(
          this, _$identity);
}

abstract class _HistoryProviderModel implements HistoryProviderModel {
  const factory _HistoryProviderModel(
      {required final String orderNumber,
      required final int vehicleType,
      required final DateTime timeCreated,
      required final int orderStatus,
      required final String userName,
      required final String imgUrl}) = _$_HistoryProviderModel;

  @override
  String get orderNumber;
  @override
  int get vehicleType;
  @override
  DateTime get timeCreated;
  @override
  int get orderStatus;
  @override
  String get userName;
  @override
  String get imgUrl;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryProviderModelCopyWith<_$_HistoryProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
