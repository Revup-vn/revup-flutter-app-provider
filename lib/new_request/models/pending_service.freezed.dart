// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pending_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PendingService {
  String get serviceName => throw _privateConstructorUsedError;
  int get moneyAmount => throw _privateConstructorUsedError;
  List<PaymentProduct> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PendingServiceCopyWith<PendingService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingServiceCopyWith<$Res> {
  factory $PendingServiceCopyWith(
          PendingService value, $Res Function(PendingService) then) =
      _$PendingServiceCopyWithImpl<$Res>;
  $Res call(
      {String serviceName, int moneyAmount, List<PaymentProduct> products});
}

/// @nodoc
class _$PendingServiceCopyWithImpl<$Res>
    implements $PendingServiceCopyWith<$Res> {
  _$PendingServiceCopyWithImpl(this._value, this._then);

  final PendingService _value;
  // ignore: unused_field
  final $Res Function(PendingService) _then;

  @override
  $Res call({
    Object? serviceName = freezed,
    Object? moneyAmount = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      moneyAmount: moneyAmount == freezed
          ? _value.moneyAmount
          : moneyAmount // ignore: cast_nullable_to_non_nullable
              as int,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PaymentProduct>,
    ));
  }
}

/// @nodoc
abstract class _$$_PendingServiceCopyWith<$Res>
    implements $PendingServiceCopyWith<$Res> {
  factory _$$_PendingServiceCopyWith(
          _$_PendingService value, $Res Function(_$_PendingService) then) =
      __$$_PendingServiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String serviceName, int moneyAmount, List<PaymentProduct> products});
}

/// @nodoc
class __$$_PendingServiceCopyWithImpl<$Res>
    extends _$PendingServiceCopyWithImpl<$Res>
    implements _$$_PendingServiceCopyWith<$Res> {
  __$$_PendingServiceCopyWithImpl(
      _$_PendingService _value, $Res Function(_$_PendingService) _then)
      : super(_value, (v) => _then(v as _$_PendingService));

  @override
  _$_PendingService get _value => super._value as _$_PendingService;

  @override
  $Res call({
    Object? serviceName = freezed,
    Object? moneyAmount = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_PendingService(
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      moneyAmount: moneyAmount == freezed
          ? _value.moneyAmount
          : moneyAmount // ignore: cast_nullable_to_non_nullable
              as int,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<PaymentProduct>,
    ));
  }
}

/// @nodoc

class _$_PendingService implements _PendingService {
  const _$_PendingService(
      {required this.serviceName,
      required this.moneyAmount,
      required final List<PaymentProduct> products})
      : _products = products;

  @override
  final String serviceName;
  @override
  final int moneyAmount;
  final List<PaymentProduct> _products;
  @override
  List<PaymentProduct> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'PendingService(serviceName: $serviceName, moneyAmount: $moneyAmount, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PendingService &&
            const DeepCollectionEquality()
                .equals(other.serviceName, serviceName) &&
            const DeepCollectionEquality()
                .equals(other.moneyAmount, moneyAmount) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serviceName),
      const DeepCollectionEquality().hash(moneyAmount),
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  _$$_PendingServiceCopyWith<_$_PendingService> get copyWith =>
      __$$_PendingServiceCopyWithImpl<_$_PendingService>(this, _$identity);
}

abstract class _PendingService implements PendingService {
  const factory _PendingService(
      {required final String serviceName,
      required final int moneyAmount,
      required final List<PaymentProduct> products}) = _$_PendingService;

  @override
  String get serviceName;
  @override
  int get moneyAmount;
  @override
  List<PaymentProduct> get products;
  @override
  @JsonKey(ignore: true)
  _$$_PendingServiceCopyWith<_$_PendingService> get copyWith =>
      throw _privateConstructorUsedError;
}
