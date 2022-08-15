// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'record_rating_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecordRatingData {
  String get id => throw _privateConstructorUsedError;
  String get cid => throw _privateConstructorUsedError;
  ReportFeedback get feedback => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordRatingDataCopyWith<RecordRatingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordRatingDataCopyWith<$Res> {
  factory $RecordRatingDataCopyWith(
          RecordRatingData value, $Res Function(RecordRatingData) then) =
      _$RecordRatingDataCopyWithImpl<$Res>;
  $Res call({String id, String cid, ReportFeedback feedback});

  $ReportFeedbackCopyWith<$Res> get feedback;
}

/// @nodoc
class _$RecordRatingDataCopyWithImpl<$Res>
    implements $RecordRatingDataCopyWith<$Res> {
  _$RecordRatingDataCopyWithImpl(this._value, this._then);

  final RecordRatingData _value;
  // ignore: unused_field
  final $Res Function(RecordRatingData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cid = freezed,
    Object? feedback = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cid: cid == freezed
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      feedback: feedback == freezed
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as ReportFeedback,
    ));
  }

  @override
  $ReportFeedbackCopyWith<$Res> get feedback {
    return $ReportFeedbackCopyWith<$Res>(_value.feedback, (value) {
      return _then(_value.copyWith(feedback: value));
    });
  }
}

/// @nodoc
abstract class _$$_RecordRatingDataCopyWith<$Res>
    implements $RecordRatingDataCopyWith<$Res> {
  factory _$$_RecordRatingDataCopyWith(
          _$_RecordRatingData value, $Res Function(_$_RecordRatingData) then) =
      __$$_RecordRatingDataCopyWithImpl<$Res>;
  @override
  $Res call({String id, String cid, ReportFeedback feedback});

  @override
  $ReportFeedbackCopyWith<$Res> get feedback;
}

/// @nodoc
class __$$_RecordRatingDataCopyWithImpl<$Res>
    extends _$RecordRatingDataCopyWithImpl<$Res>
    implements _$$_RecordRatingDataCopyWith<$Res> {
  __$$_RecordRatingDataCopyWithImpl(
      _$_RecordRatingData _value, $Res Function(_$_RecordRatingData) _then)
      : super(_value, (v) => _then(v as _$_RecordRatingData));

  @override
  _$_RecordRatingData get _value => super._value as _$_RecordRatingData;

  @override
  $Res call({
    Object? id = freezed,
    Object? cid = freezed,
    Object? feedback = freezed,
  }) {
    return _then(_$_RecordRatingData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cid: cid == freezed
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      feedback: feedback == freezed
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as ReportFeedback,
    ));
  }
}

/// @nodoc

class _$_RecordRatingData implements _RecordRatingData {
  const _$_RecordRatingData(
      {required this.id, required this.cid, required this.feedback});

  @override
  final String id;
  @override
  final String cid;
  @override
  final ReportFeedback feedback;

  @override
  String toString() {
    return 'RecordRatingData(id: $id, cid: $cid, feedback: $feedback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecordRatingData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.cid, cid) &&
            const DeepCollectionEquality().equals(other.feedback, feedback));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(cid),
      const DeepCollectionEquality().hash(feedback));

  @JsonKey(ignore: true)
  @override
  _$$_RecordRatingDataCopyWith<_$_RecordRatingData> get copyWith =>
      __$$_RecordRatingDataCopyWithImpl<_$_RecordRatingData>(this, _$identity);
}

abstract class _RecordRatingData implements RecordRatingData {
  const factory _RecordRatingData(
      {required final String id,
      required final String cid,
      required final ReportFeedback feedback}) = _$_RecordRatingData;

  @override
  String get id;
  @override
  String get cid;
  @override
  ReportFeedback get feedback;
  @override
  @JsonKey(ignore: true)
  _$$_RecordRatingDataCopyWith<_$_RecordRatingData> get copyWith =>
      throw _privateConstructorUsedError;
}
