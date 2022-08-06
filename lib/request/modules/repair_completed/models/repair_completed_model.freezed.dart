// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repair_completed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepairCompletedModel {
  int get collectMoneyCustomers => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  int get totalService => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepairCompletedModelCopyWith<RepairCompletedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairCompletedModelCopyWith<$Res> {
  factory $RepairCompletedModelCopyWith(RepairCompletedModel value,
          $Res Function(RepairCompletedModel) then) =
      _$RepairCompletedModelCopyWithImpl<$Res>;
  $Res call({int collectMoneyCustomers, String vehicleType, int totalService});
}

/// @nodoc
class _$RepairCompletedModelCopyWithImpl<$Res>
    implements $RepairCompletedModelCopyWith<$Res> {
  _$RepairCompletedModelCopyWithImpl(this._value, this._then);

  final RepairCompletedModel _value;
  // ignore: unused_field
  final $Res Function(RepairCompletedModel) _then;

  @override
  $Res call({
    Object? collectMoneyCustomers = freezed,
    Object? vehicleType = freezed,
    Object? totalService = freezed,
  }) {
    return _then(_value.copyWith(
      collectMoneyCustomers: collectMoneyCustomers == freezed
          ? _value.collectMoneyCustomers
          : collectMoneyCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      totalService: totalService == freezed
          ? _value.totalService
          : totalService // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RepairCompletedModelCopyWith<$Res>
    implements $RepairCompletedModelCopyWith<$Res> {
  factory _$$_RepairCompletedModelCopyWith(_$_RepairCompletedModel value,
          $Res Function(_$_RepairCompletedModel) then) =
      __$$_RepairCompletedModelCopyWithImpl<$Res>;
  @override
  $Res call({int collectMoneyCustomers, String vehicleType, int totalService});
}

/// @nodoc
class __$$_RepairCompletedModelCopyWithImpl<$Res>
    extends _$RepairCompletedModelCopyWithImpl<$Res>
    implements _$$_RepairCompletedModelCopyWith<$Res> {
  __$$_RepairCompletedModelCopyWithImpl(_$_RepairCompletedModel _value,
      $Res Function(_$_RepairCompletedModel) _then)
      : super(_value, (v) => _then(v as _$_RepairCompletedModel));

  @override
  _$_RepairCompletedModel get _value => super._value as _$_RepairCompletedModel;

  @override
  $Res call({
    Object? collectMoneyCustomers = freezed,
    Object? vehicleType = freezed,
    Object? totalService = freezed,
  }) {
    return _then(_$_RepairCompletedModel(
      collectMoneyCustomers: collectMoneyCustomers == freezed
          ? _value.collectMoneyCustomers
          : collectMoneyCustomers // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleType: vehicleType == freezed
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      totalService: totalService == freezed
          ? _value.totalService
          : totalService // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RepairCompletedModel implements _RepairCompletedModel {
  const _$_RepairCompletedModel(
      {required this.collectMoneyCustomers,
      required this.vehicleType,
      required this.totalService});

  @override
  final int collectMoneyCustomers;
  @override
  final String vehicleType;
  @override
  final int totalService;

  @override
  String toString() {
    return 'RepairCompletedModel(collectMoneyCustomers: $collectMoneyCustomers, vehicleType: $vehicleType, totalService: $totalService)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepairCompletedModel &&
            const DeepCollectionEquality()
                .equals(other.collectMoneyCustomers, collectMoneyCustomers) &&
            const DeepCollectionEquality()
                .equals(other.vehicleType, vehicleType) &&
            const DeepCollectionEquality()
                .equals(other.totalService, totalService));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(collectMoneyCustomers),
      const DeepCollectionEquality().hash(vehicleType),
      const DeepCollectionEquality().hash(totalService));

  @JsonKey(ignore: true)
  @override
  _$$_RepairCompletedModelCopyWith<_$_RepairCompletedModel> get copyWith =>
      __$$_RepairCompletedModelCopyWithImpl<_$_RepairCompletedModel>(
          this, _$identity);
}

abstract class _RepairCompletedModel implements RepairCompletedModel {
  const factory _RepairCompletedModel(
      {required final int collectMoneyCustomers,
      required final String vehicleType,
      required final int totalService}) = _$_RepairCompletedModel;

  @override
  int get collectMoneyCustomers;
  @override
  String get vehicleType;
  @override
  int get totalService;
  @override
  @JsonKey(ignore: true)
  _$$_RepairCompletedModelCopyWith<_$_RepairCompletedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
