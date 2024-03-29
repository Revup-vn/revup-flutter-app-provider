// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repair_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepairRecordModel {
  List<PendingServiceModel> get requestServiceModel =>
      throw _privateConstructorUsedError;
  List<PaidServicesModel> get bonusServicesModel =>
      throw _privateConstructorUsedError;
  int get feeTransport => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepairRecordModelCopyWith<RepairRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairRecordModelCopyWith<$Res> {
  factory $RepairRecordModelCopyWith(
          RepairRecordModel value, $Res Function(RepairRecordModel) then) =
      _$RepairRecordModelCopyWithImpl<$Res>;
  $Res call(
      {List<PendingServiceModel> requestServiceModel,
      List<PaidServicesModel> bonusServicesModel,
      int feeTransport});
}

/// @nodoc
class _$RepairRecordModelCopyWithImpl<$Res>
    implements $RepairRecordModelCopyWith<$Res> {
  _$RepairRecordModelCopyWithImpl(this._value, this._then);

  final RepairRecordModel _value;
  // ignore: unused_field
  final $Res Function(RepairRecordModel) _then;

  @override
  $Res call({
    Object? requestServiceModel = freezed,
    Object? bonusServicesModel = freezed,
    Object? feeTransport = freezed,
  }) {
    return _then(_value.copyWith(
      requestServiceModel: requestServiceModel == freezed
          ? _value.requestServiceModel
          : requestServiceModel // ignore: cast_nullable_to_non_nullable
              as List<PendingServiceModel>,
      bonusServicesModel: bonusServicesModel == freezed
          ? _value.bonusServicesModel
          : bonusServicesModel // ignore: cast_nullable_to_non_nullable
              as List<PaidServicesModel>,
      feeTransport: feeTransport == freezed
          ? _value.feeTransport
          : feeTransport // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RepairRecordModelCopyWith<$Res>
    implements $RepairRecordModelCopyWith<$Res> {
  factory _$$_RepairRecordModelCopyWith(_$_RepairRecordModel value,
          $Res Function(_$_RepairRecordModel) then) =
      __$$_RepairRecordModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<PendingServiceModel> requestServiceModel,
      List<PaidServicesModel> bonusServicesModel,
      int feeTransport});
}

/// @nodoc
class __$$_RepairRecordModelCopyWithImpl<$Res>
    extends _$RepairRecordModelCopyWithImpl<$Res>
    implements _$$_RepairRecordModelCopyWith<$Res> {
  __$$_RepairRecordModelCopyWithImpl(
      _$_RepairRecordModel _value, $Res Function(_$_RepairRecordModel) _then)
      : super(_value, (v) => _then(v as _$_RepairRecordModel));

  @override
  _$_RepairRecordModel get _value => super._value as _$_RepairRecordModel;

  @override
  $Res call({
    Object? requestServiceModel = freezed,
    Object? bonusServicesModel = freezed,
    Object? feeTransport = freezed,
  }) {
    return _then(_$_RepairRecordModel(
      requestServiceModel: requestServiceModel == freezed
          ? _value._requestServiceModel
          : requestServiceModel // ignore: cast_nullable_to_non_nullable
              as List<PendingServiceModel>,
      bonusServicesModel: bonusServicesModel == freezed
          ? _value._bonusServicesModel
          : bonusServicesModel // ignore: cast_nullable_to_non_nullable
              as List<PaidServicesModel>,
      feeTransport: feeTransport == freezed
          ? _value.feeTransport
          : feeTransport // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RepairRecordModel implements _RepairRecordModel {
  const _$_RepairRecordModel(
      {required final List<PendingServiceModel> requestServiceModel,
      required final List<PaidServicesModel> bonusServicesModel,
      required this.feeTransport})
      : _requestServiceModel = requestServiceModel,
        _bonusServicesModel = bonusServicesModel;

  final List<PendingServiceModel> _requestServiceModel;
  @override
  List<PendingServiceModel> get requestServiceModel {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestServiceModel);
  }

  final List<PaidServicesModel> _bonusServicesModel;
  @override
  List<PaidServicesModel> get bonusServicesModel {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusServicesModel);
  }

  @override
  final int feeTransport;

  @override
  String toString() {
    return 'RepairRecordModel(requestServiceModel: $requestServiceModel, bonusServicesModel: $bonusServicesModel, feeTransport: $feeTransport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepairRecordModel &&
            const DeepCollectionEquality()
                .equals(other._requestServiceModel, _requestServiceModel) &&
            const DeepCollectionEquality()
                .equals(other._bonusServicesModel, _bonusServicesModel) &&
            const DeepCollectionEquality()
                .equals(other.feeTransport, feeTransport));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_requestServiceModel),
      const DeepCollectionEquality().hash(_bonusServicesModel),
      const DeepCollectionEquality().hash(feeTransport));

  @JsonKey(ignore: true)
  @override
  _$$_RepairRecordModelCopyWith<_$_RepairRecordModel> get copyWith =>
      __$$_RepairRecordModelCopyWithImpl<_$_RepairRecordModel>(
          this, _$identity);
}

abstract class _RepairRecordModel implements RepairRecordModel {
  const factory _RepairRecordModel(
      {required final List<PendingServiceModel> requestServiceModel,
      required final List<PaidServicesModel> bonusServicesModel,
      required final int feeTransport}) = _$_RepairRecordModel;

  @override
  List<PendingServiceModel> get requestServiceModel;
  @override
  List<PaidServicesModel> get bonusServicesModel;
  @override
  int get feeTransport;
  @override
  @JsonKey(ignore: true)
  _$$_RepairRecordModelCopyWith<_$_RepairRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
