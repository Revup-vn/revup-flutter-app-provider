// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_repair_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestRepairMessage _$RequestRepairMessageFromJson(Map<String, dynamic> json) {
  return _RequestRepairMessage.fromJson(json);
}

/// @nodoc
mixin _$RequestRepairMessage {
  String get recordId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestRepairMessageCopyWith<RequestRepairMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestRepairMessageCopyWith<$Res> {
  factory $RequestRepairMessageCopyWith(RequestRepairMessage value,
          $Res Function(RequestRepairMessage) then) =
      _$RequestRepairMessageCopyWithImpl<$Res>;
  $Res call({String recordId});
}

/// @nodoc
class _$RequestRepairMessageCopyWithImpl<$Res>
    implements $RequestRepairMessageCopyWith<$Res> {
  _$RequestRepairMessageCopyWithImpl(this._value, this._then);

  final RequestRepairMessage _value;
  // ignore: unused_field
  final $Res Function(RequestRepairMessage) _then;

  @override
  $Res call({
    Object? recordId = freezed,
  }) {
    return _then(_value.copyWith(
      recordId: recordId == freezed
          ? _value.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RequestRepairMessageCopyWith<$Res>
    implements $RequestRepairMessageCopyWith<$Res> {
  factory _$$_RequestRepairMessageCopyWith(_$_RequestRepairMessage value,
          $Res Function(_$_RequestRepairMessage) then) =
      __$$_RequestRepairMessageCopyWithImpl<$Res>;
  @override
  $Res call({String recordId});
}

/// @nodoc
class __$$_RequestRepairMessageCopyWithImpl<$Res>
    extends _$RequestRepairMessageCopyWithImpl<$Res>
    implements _$$_RequestRepairMessageCopyWith<$Res> {
  __$$_RequestRepairMessageCopyWithImpl(_$_RequestRepairMessage _value,
      $Res Function(_$_RequestRepairMessage) _then)
      : super(_value, (v) => _then(v as _$_RequestRepairMessage));

  @override
  _$_RequestRepairMessage get _value => super._value as _$_RequestRepairMessage;

  @override
  $Res call({
    Object? recordId = freezed,
  }) {
    return _then(_$_RequestRepairMessage(
      recordId: recordId == freezed
          ? _value.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestRepairMessage implements _RequestRepairMessage {
  const _$_RequestRepairMessage({required this.recordId});

  factory _$_RequestRepairMessage.fromJson(Map<String, dynamic> json) =>
      _$$_RequestRepairMessageFromJson(json);

  @override
  final String recordId;

  @override
  String toString() {
    return 'RequestRepairMessage(recordId: $recordId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestRepairMessage &&
            const DeepCollectionEquality().equals(other.recordId, recordId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(recordId));

  @JsonKey(ignore: true)
  @override
  _$$_RequestRepairMessageCopyWith<_$_RequestRepairMessage> get copyWith =>
      __$$_RequestRepairMessageCopyWithImpl<_$_RequestRepairMessage>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestRepairMessageToJson(
      this,
    );
  }
}

abstract class _RequestRepairMessage implements RequestRepairMessage {
  const factory _RequestRepairMessage({required final String recordId}) =
      _$_RequestRepairMessage;

  factory _RequestRepairMessage.fromJson(Map<String, dynamic> json) =
      _$_RequestRepairMessage.fromJson;

  @override
  String get recordId;
  @override
  @JsonKey(ignore: true)
  _$$_RequestRepairMessageCopyWith<_$_RequestRepairMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
