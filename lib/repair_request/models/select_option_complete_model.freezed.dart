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
  List<PendingServiceModel> get unpaidServices =>
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
  $Res call({List<PendingServiceModel> unpaidServices});
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
    Object? unpaidServices = freezed,
  }) {
    return _then(_value.copyWith(
      unpaidServices: unpaidServices == freezed
          ? _value.unpaidServices
          : unpaidServices // ignore: cast_nullable_to_non_nullable
              as List<PendingServiceModel>,
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
  $Res call({List<PendingServiceModel> unpaidServices});
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
    Object? unpaidServices = freezed,
  }) {
    return _then(_$_SelectOptionCompleteModel(
      unpaidServices: unpaidServices == freezed
          ? _value._unpaidServices
          : unpaidServices // ignore: cast_nullable_to_non_nullable
              as List<PendingServiceModel>,
    ));
  }
}

/// @nodoc

class _$_SelectOptionCompleteModel implements _SelectOptionCompleteModel {
  const _$_SelectOptionCompleteModel(
      {required final List<PendingServiceModel> unpaidServices})
      : _unpaidServices = unpaidServices;

  final List<PendingServiceModel> _unpaidServices;
  @override
  List<PendingServiceModel> get unpaidServices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unpaidServices);
  }

  @override
  String toString() {
    return 'SelectOptionCompleteModel(unpaidServices: $unpaidServices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectOptionCompleteModel &&
            const DeepCollectionEquality()
                .equals(other._unpaidServices, _unpaidServices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_unpaidServices));

  @JsonKey(ignore: true)
  @override
  _$$_SelectOptionCompleteModelCopyWith<_$_SelectOptionCompleteModel>
      get copyWith => __$$_SelectOptionCompleteModelCopyWithImpl<
          _$_SelectOptionCompleteModel>(this, _$identity);
}

abstract class _SelectOptionCompleteModel implements SelectOptionCompleteModel {
  const factory _SelectOptionCompleteModel(
          {required final List<PendingServiceModel> unpaidServices}) =
      _$_SelectOptionCompleteModel;

  @override
  List<PendingServiceModel> get unpaidServices;
  @override
  @JsonKey(ignore: true)
  _$$_SelectOptionCompleteModelCopyWith<_$_SelectOptionCompleteModel>
      get copyWith => throw _privateConstructorUsedError;
}
