// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'select_option_complete_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectOptionCompleteModel {
  List<RequestServiceModel> get requestServiceModel =>
      throw _privateConstructorUsedError;
  List<BonusServicesModel> get bonusServicesModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectOptionCompleteModelCopyWith<SelectOptionCompleteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectOptionCompleteModelCopyWith<$Res> {
  factory $SelectOptionCompleteModelCopyWith(SelectOptionCompleteModel value,
          $Res Function(SelectOptionCompleteModel) then) =
      _$SelectOptionCompleteModelCopyWithImpl<$Res>;
  $Res call(
      {List<RequestServiceModel> requestServiceModel,
      List<BonusServicesModel> bonusServicesModel});
}

/// @nodoc
class _$SelectOptionCompleteModelCopyWithImpl<$Res>
    implements $SelectOptionCompleteModelCopyWith<$Res> {
  _$SelectOptionCompleteModelCopyWithImpl(this._value, this._then);

  final SelectOptionCompleteModel _value;
  // ignore: unused_field
  final $Res Function(SelectOptionCompleteModel) _then;

  @override
  $Res call({
    Object? requestServiceModel = freezed,
    Object? bonusServicesModel = freezed,
  }) {
    return _then(_value.copyWith(
      requestServiceModel: requestServiceModel == freezed
          ? _value.requestServiceModel
          : requestServiceModel // ignore: cast_nullable_to_non_nullable
              as List<RequestServiceModel>,
      bonusServicesModel: bonusServicesModel == freezed
          ? _value.bonusServicesModel
          : bonusServicesModel // ignore: cast_nullable_to_non_nullable
              as List<BonusServicesModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_SelectOptionCompleteModelCopyWith<$Res>
    implements $SelectOptionCompleteModelCopyWith<$Res> {
  factory _$$_SelectOptionCompleteModelCopyWith(
          _$_SelectOptionCompleteModel value,
          $Res Function(_$_SelectOptionCompleteModel) then) =
      __$$_SelectOptionCompleteModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<RequestServiceModel> requestServiceModel,
      List<BonusServicesModel> bonusServicesModel});
}

/// @nodoc
class __$$_SelectOptionCompleteModelCopyWithImpl<$Res>
    extends _$SelectOptionCompleteModelCopyWithImpl<$Res>
    implements _$$_SelectOptionCompleteModelCopyWith<$Res> {
  __$$_SelectOptionCompleteModelCopyWithImpl(
      _$_SelectOptionCompleteModel _value,
      $Res Function(_$_SelectOptionCompleteModel) _then)
      : super(_value, (v) => _then(v as _$_SelectOptionCompleteModel));

  @override
  _$_SelectOptionCompleteModel get _value =>
      super._value as _$_SelectOptionCompleteModel;

  @override
  $Res call({
    Object? requestServiceModel = freezed,
    Object? bonusServicesModel = freezed,
  }) {
    return _then(_$_SelectOptionCompleteModel(
      requestServiceModel: requestServiceModel == freezed
          ? _value._requestServiceModel
          : requestServiceModel // ignore: cast_nullable_to_non_nullable
              as List<RequestServiceModel>,
      bonusServicesModel: bonusServicesModel == freezed
          ? _value._bonusServicesModel
          : bonusServicesModel // ignore: cast_nullable_to_non_nullable
              as List<BonusServicesModel>,
    ));
  }
}

/// @nodoc

class _$_SelectOptionCompleteModel implements _SelectOptionCompleteModel {
  const _$_SelectOptionCompleteModel(
      {required final List<RequestServiceModel> requestServiceModel,
      required final List<BonusServicesModel> bonusServicesModel})
      : _requestServiceModel = requestServiceModel,
        _bonusServicesModel = bonusServicesModel;

  final List<RequestServiceModel> _requestServiceModel;
  @override
  List<RequestServiceModel> get requestServiceModel {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requestServiceModel);
  }

  final List<BonusServicesModel> _bonusServicesModel;
  @override
  List<BonusServicesModel> get bonusServicesModel {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusServicesModel);
  }

  @override
  String toString() {
    return 'SelectOptionCompleteModel(requestServiceModel: $requestServiceModel, bonusServicesModel: $bonusServicesModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectOptionCompleteModel &&
            const DeepCollectionEquality()
                .equals(other._requestServiceModel, _requestServiceModel) &&
            const DeepCollectionEquality()
                .equals(other._bonusServicesModel, _bonusServicesModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_requestServiceModel),
      const DeepCollectionEquality().hash(_bonusServicesModel));

  @JsonKey(ignore: true)
  @override
  _$$_SelectOptionCompleteModelCopyWith<_$_SelectOptionCompleteModel>
      get copyWith => __$$_SelectOptionCompleteModelCopyWithImpl<
          _$_SelectOptionCompleteModel>(this, _$identity);
}

abstract class _SelectOptionCompleteModel implements SelectOptionCompleteModel {
  const factory _SelectOptionCompleteModel(
          {required final List<RequestServiceModel> requestServiceModel,
          required final List<BonusServicesModel> bonusServicesModel}) =
      _$_SelectOptionCompleteModel;

  @override
  List<RequestServiceModel> get requestServiceModel;
  @override
  List<BonusServicesModel> get bonusServicesModel;
  @override
  @JsonKey(ignore: true)
  _$$_SelectOptionCompleteModelCopyWith<_$_SelectOptionCompleteModel>
      get copyWith => throw _privateConstructorUsedError;
}
