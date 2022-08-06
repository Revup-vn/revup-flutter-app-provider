// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationProviderModel {
  String get orderStatusNotification => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  DateTime get serviceStartBooking => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationProviderModelCopyWith<NotificationProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationProviderModelCopyWith<$Res> {
  factory $NotificationProviderModelCopyWith(NotificationProviderModel value,
          $Res Function(NotificationProviderModel) then) =
      _$NotificationProviderModelCopyWithImpl<$Res>;
  $Res call(
      {String orderStatusNotification,
      String orderNumber,
      DateTime serviceStartBooking});
}

/// @nodoc
class _$NotificationProviderModelCopyWithImpl<$Res>
    implements $NotificationProviderModelCopyWith<$Res> {
  _$NotificationProviderModelCopyWithImpl(this._value, this._then);

  final NotificationProviderModel _value;
  // ignore: unused_field
  final $Res Function(NotificationProviderModel) _then;

  @override
  $Res call({
    Object? orderStatusNotification = freezed,
    Object? orderNumber = freezed,
    Object? serviceStartBooking = freezed,
  }) {
    return _then(_value.copyWith(
      orderStatusNotification: orderStatusNotification == freezed
          ? _value.orderStatusNotification
          : orderStatusNotification // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: orderNumber == freezed
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      serviceStartBooking: serviceStartBooking == freezed
          ? _value.serviceStartBooking
          : serviceStartBooking // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationProviderModelCopyWith<$Res>
    implements $NotificationProviderModelCopyWith<$Res> {
  factory _$$_NotificationProviderModelCopyWith(
          _$_NotificationProviderModel value,
          $Res Function(_$_NotificationProviderModel) then) =
      __$$_NotificationProviderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String orderStatusNotification,
      String orderNumber,
      DateTime serviceStartBooking});
}

/// @nodoc
class __$$_NotificationProviderModelCopyWithImpl<$Res>
    extends _$NotificationProviderModelCopyWithImpl<$Res>
    implements _$$_NotificationProviderModelCopyWith<$Res> {
  __$$_NotificationProviderModelCopyWithImpl(
      _$_NotificationProviderModel _value,
      $Res Function(_$_NotificationProviderModel) _then)
      : super(_value, (v) => _then(v as _$_NotificationProviderModel));

  @override
  _$_NotificationProviderModel get _value =>
      super._value as _$_NotificationProviderModel;

  @override
  $Res call({
    Object? orderStatusNotification = freezed,
    Object? orderNumber = freezed,
    Object? serviceStartBooking = freezed,
  }) {
    return _then(_$_NotificationProviderModel(
      orderStatusNotification: orderStatusNotification == freezed
          ? _value.orderStatusNotification
          : orderStatusNotification // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: orderNumber == freezed
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      serviceStartBooking: serviceStartBooking == freezed
          ? _value.serviceStartBooking
          : serviceStartBooking // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_NotificationProviderModel implements _NotificationProviderModel {
  const _$_NotificationProviderModel(
      {required this.orderStatusNotification,
      required this.orderNumber,
      required this.serviceStartBooking});

  @override
  final String orderStatusNotification;
  @override
  final String orderNumber;
  @override
  final DateTime serviceStartBooking;

  @override
  String toString() {
    return 'NotificationProviderModel(orderStatusNotification: $orderStatusNotification, orderNumber: $orderNumber, serviceStartBooking: $serviceStartBooking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationProviderModel &&
            const DeepCollectionEquality().equals(
                other.orderStatusNotification, orderStatusNotification) &&
            const DeepCollectionEquality()
                .equals(other.orderNumber, orderNumber) &&
            const DeepCollectionEquality()
                .equals(other.serviceStartBooking, serviceStartBooking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderStatusNotification),
      const DeepCollectionEquality().hash(orderNumber),
      const DeepCollectionEquality().hash(serviceStartBooking));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationProviderModelCopyWith<_$_NotificationProviderModel>
      get copyWith => __$$_NotificationProviderModelCopyWithImpl<
          _$_NotificationProviderModel>(this, _$identity);
}

abstract class _NotificationProviderModel implements NotificationProviderModel {
  const factory _NotificationProviderModel(
          {required final String orderStatusNotification,
          required final String orderNumber,
          required final DateTime serviceStartBooking}) =
      _$_NotificationProviderModel;

  @override
  String get orderStatusNotification;
  @override
  String get orderNumber;
  @override
  DateTime get serviceStartBooking;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationProviderModelCopyWith<_$_NotificationProviderModel>
      get copyWith => throw _privateConstructorUsedError;
}
