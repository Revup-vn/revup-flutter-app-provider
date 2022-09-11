// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PendingRepairRequest record,
            Function0<void> onRoute, Function1<String, void> sendMessage)
        accepted,
    required TResult Function(PendingRepairRequest record,
            Function0<void> onRoute, Function1<String, void> sendMessage)
        decline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        accepted,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        decline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        accepted,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        decline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Accepted value) accepted,
    required TResult Function(_Decline value) decline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Accepted value)? accepted,
    TResult Function(_Decline value)? decline,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Accepted value)? accepted,
    TResult Function(_Decline value)? decline,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRequestEventCopyWith<$Res> {
  factory $NewRequestEventCopyWith(
          NewRequestEvent value, $Res Function(NewRequestEvent) then) =
      _$NewRequestEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewRequestEventCopyWithImpl<$Res>
    implements $NewRequestEventCopyWith<$Res> {
  _$NewRequestEventCopyWithImpl(this._value, this._then);

  final NewRequestEvent _value;
  // ignore: unused_field
  final $Res Function(NewRequestEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$NewRequestEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'NewRequestEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PendingRepairRequest record,
            Function0<void> onRoute, Function1<String, void> sendMessage)
        accepted,
    required TResult Function(PendingRepairRequest record,
            Function0<void> onRoute, Function1<String, void> sendMessage)
        decline,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        accepted,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        decline,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        accepted,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        decline,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Accepted value) accepted,
    required TResult Function(_Decline value) decline,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Accepted value)? accepted,
    TResult Function(_Decline value)? decline,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Accepted value)? accepted,
    TResult Function(_Decline value)? decline,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NewRequestEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_AcceptedCopyWith<$Res> {
  factory _$$_AcceptedCopyWith(
          _$_Accepted value, $Res Function(_$_Accepted) then) =
      __$$_AcceptedCopyWithImpl<$Res>;
  $Res call(
      {PendingRepairRequest record,
      Function0<void> onRoute,
      Function1<String, void> sendMessage});

  $PendingRepairRequestCopyWith<$Res> get record;
}

/// @nodoc
class __$$_AcceptedCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res>
    implements _$$_AcceptedCopyWith<$Res> {
  __$$_AcceptedCopyWithImpl(
      _$_Accepted _value, $Res Function(_$_Accepted) _then)
      : super(_value, (v) => _then(v as _$_Accepted));

  @override
  _$_Accepted get _value => super._value as _$_Accepted;

  @override
  $Res call({
    Object? record = freezed,
    Object? onRoute = freezed,
    Object? sendMessage = freezed,
  }) {
    return _then(_$_Accepted(
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as PendingRepairRequest,
      onRoute: onRoute == freezed
          ? _value.onRoute
          : onRoute // ignore: cast_nullable_to_non_nullable
              as Function0<void>,
      sendMessage: sendMessage == freezed
          ? _value.sendMessage
          : sendMessage // ignore: cast_nullable_to_non_nullable
              as Function1<String, void>,
    ));
  }

  @override
  $PendingRepairRequestCopyWith<$Res> get record {
    return $PendingRepairRequestCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value));
    });
  }
}

/// @nodoc

class _$_Accepted implements _Accepted {
  const _$_Accepted(
      {required this.record, required this.onRoute, required this.sendMessage});

  @override
  final PendingRepairRequest record;
  @override
  final Function0<void> onRoute;
  @override
  final Function1<String, void> sendMessage;

  @override
  String toString() {
    return 'NewRequestEvent.accepted(record: $record, onRoute: $onRoute, sendMessage: $sendMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Accepted &&
            const DeepCollectionEquality().equals(other.record, record) &&
            (identical(other.onRoute, onRoute) || other.onRoute == onRoute) &&
            (identical(other.sendMessage, sendMessage) ||
                other.sendMessage == sendMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(record), onRoute, sendMessage);

  @JsonKey(ignore: true)
  @override
  _$$_AcceptedCopyWith<_$_Accepted> get copyWith =>
      __$$_AcceptedCopyWithImpl<_$_Accepted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PendingRepairRequest record,
            Function0<void> onRoute, Function1<String, void> sendMessage)
        accepted,
    required TResult Function(PendingRepairRequest record,
            Function0<void> onRoute, Function1<String, void> sendMessage)
        decline,
  }) {
    return accepted(record, onRoute, sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        accepted,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        decline,
  }) {
    return accepted?.call(record, onRoute, sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        accepted,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        decline,
    required TResult orElse(),
  }) {
    if (accepted != null) {
      return accepted(record, onRoute, sendMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Accepted value) accepted,
    required TResult Function(_Decline value) decline,
  }) {
    return accepted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Accepted value)? accepted,
    TResult Function(_Decline value)? decline,
  }) {
    return accepted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Accepted value)? accepted,
    TResult Function(_Decline value)? decline,
    required TResult orElse(),
  }) {
    if (accepted != null) {
      return accepted(this);
    }
    return orElse();
  }
}

abstract class _Accepted implements NewRequestEvent {
  const factory _Accepted(
      {required final PendingRepairRequest record,
      required final Function0<void> onRoute,
      required final Function1<String, void> sendMessage}) = _$_Accepted;

  PendingRepairRequest get record;
  Function0<void> get onRoute;
  Function1<String, void> get sendMessage;
  @JsonKey(ignore: true)
  _$$_AcceptedCopyWith<_$_Accepted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeclineCopyWith<$Res> {
  factory _$$_DeclineCopyWith(
          _$_Decline value, $Res Function(_$_Decline) then) =
      __$$_DeclineCopyWithImpl<$Res>;
  $Res call(
      {PendingRepairRequest record,
      Function0<void> onRoute,
      Function1<String, void> sendMessage});

  $PendingRepairRequestCopyWith<$Res> get record;
}

/// @nodoc
class __$$_DeclineCopyWithImpl<$Res> extends _$NewRequestEventCopyWithImpl<$Res>
    implements _$$_DeclineCopyWith<$Res> {
  __$$_DeclineCopyWithImpl(_$_Decline _value, $Res Function(_$_Decline) _then)
      : super(_value, (v) => _then(v as _$_Decline));

  @override
  _$_Decline get _value => super._value as _$_Decline;

  @override
  $Res call({
    Object? record = freezed,
    Object? onRoute = freezed,
    Object? sendMessage = freezed,
  }) {
    return _then(_$_Decline(
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as PendingRepairRequest,
      onRoute: onRoute == freezed
          ? _value.onRoute
          : onRoute // ignore: cast_nullable_to_non_nullable
              as Function0<void>,
      sendMessage: sendMessage == freezed
          ? _value.sendMessage
          : sendMessage // ignore: cast_nullable_to_non_nullable
              as Function1<String, void>,
    ));
  }

  @override
  $PendingRepairRequestCopyWith<$Res> get record {
    return $PendingRepairRequestCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value));
    });
  }
}

/// @nodoc

class _$_Decline implements _Decline {
  const _$_Decline(
      {required this.record, required this.onRoute, required this.sendMessage});

  @override
  final PendingRepairRequest record;
  @override
  final Function0<void> onRoute;
  @override
  final Function1<String, void> sendMessage;

  @override
  String toString() {
    return 'NewRequestEvent.decline(record: $record, onRoute: $onRoute, sendMessage: $sendMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Decline &&
            const DeepCollectionEquality().equals(other.record, record) &&
            (identical(other.onRoute, onRoute) || other.onRoute == onRoute) &&
            (identical(other.sendMessage, sendMessage) ||
                other.sendMessage == sendMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(record), onRoute, sendMessage);

  @JsonKey(ignore: true)
  @override
  _$$_DeclineCopyWith<_$_Decline> get copyWith =>
      __$$_DeclineCopyWithImpl<_$_Decline>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(PendingRepairRequest record,
            Function0<void> onRoute, Function1<String, void> sendMessage)
        accepted,
    required TResult Function(PendingRepairRequest record,
            Function0<void> onRoute, Function1<String, void> sendMessage)
        decline,
  }) {
    return decline(record, onRoute, sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        accepted,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        decline,
  }) {
    return decline?.call(record, onRoute, sendMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        accepted,
    TResult Function(PendingRepairRequest record, Function0<void> onRoute,
            Function1<String, void> sendMessage)?
        decline,
    required TResult orElse(),
  }) {
    if (decline != null) {
      return decline(record, onRoute, sendMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Accepted value) accepted,
    required TResult Function(_Decline value) decline,
  }) {
    return decline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Accepted value)? accepted,
    TResult Function(_Decline value)? decline,
  }) {
    return decline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Accepted value)? accepted,
    TResult Function(_Decline value)? decline,
    required TResult orElse(),
  }) {
    if (decline != null) {
      return decline(this);
    }
    return orElse();
  }
}

abstract class _Decline implements NewRequestEvent {
  const factory _Decline(
      {required final PendingRepairRequest record,
      required final Function0<void> onRoute,
      required final Function1<String, void> sendMessage}) = _$_Decline;

  PendingRepairRequest get record;
  Function0<void> get onRoute;
  Function1<String, void> get sendMessage;
  @JsonKey(ignore: true)
  _$$_DeclineCopyWith<_$_Decline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRequestStateCopyWith<$Res> {
  factory $NewRequestStateCopyWith(
          NewRequestState value, $Res Function(NewRequestState) then) =
      _$NewRequestStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewRequestStateCopyWithImpl<$Res>
    implements $NewRequestStateCopyWith<$Res> {
  _$NewRequestStateCopyWithImpl(this._value, this._then);

  final NewRequestState _value;
  // ignore: unused_field
  final $Res Function(NewRequestState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$NewRequestStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'NewRequestState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NewRequestState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$NewRequestStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'NewRequestState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NewRequestState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res> extends _$NewRequestStateCopyWithImpl<$Res>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, (v) => _then(v as _$_Failure));

  @override
  _$_Failure get _value => super._value as _$_Failure;
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure();

  @override
  String toString() {
    return 'NewRequestState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Failure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)
        success,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements NewRequestState {
  const factory _Failure() = _$_Failure;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  $Res call(
      {Directions directions,
      Marker fromMarker,
      Marker toMarker,
      AppUser consumer,
      PendingRepairRequest record,
      List<PendingServiceModel> pendingService,
      List<NeedToVerifyModel> needToVerifyService,
      int pendingAmount,
      int len});

  $DirectionsCopyWith<$Res> get directions;
  $AppUserCopyWith<$Res> get consumer;
  $PendingRepairRequestCopyWith<$Res> get record;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res> extends _$NewRequestStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? directions = freezed,
    Object? fromMarker = freezed,
    Object? toMarker = freezed,
    Object? consumer = freezed,
    Object? record = freezed,
    Object? pendingService = freezed,
    Object? needToVerifyService = freezed,
    Object? pendingAmount = freezed,
    Object? len = freezed,
  }) {
    return _then(_$_Success(
      directions: directions == freezed
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as Directions,
      fromMarker: fromMarker == freezed
          ? _value.fromMarker
          : fromMarker // ignore: cast_nullable_to_non_nullable
              as Marker,
      toMarker: toMarker == freezed
          ? _value.toMarker
          : toMarker // ignore: cast_nullable_to_non_nullable
              as Marker,
      consumer: consumer == freezed
          ? _value.consumer
          : consumer // ignore: cast_nullable_to_non_nullable
              as AppUser,
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as PendingRepairRequest,
      pendingService: pendingService == freezed
          ? _value._pendingService
          : pendingService // ignore: cast_nullable_to_non_nullable
              as List<PendingServiceModel>,
      needToVerifyService: needToVerifyService == freezed
          ? _value._needToVerifyService
          : needToVerifyService // ignore: cast_nullable_to_non_nullable
              as List<NeedToVerifyModel>,
      pendingAmount: pendingAmount == freezed
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as int,
      len: len == freezed
          ? _value.len
          : len // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $DirectionsCopyWith<$Res> get directions {
    return $DirectionsCopyWith<$Res>(_value.directions, (value) {
      return _then(_value.copyWith(directions: value));
    });
  }

  @override
  $AppUserCopyWith<$Res> get consumer {
    return $AppUserCopyWith<$Res>(_value.consumer, (value) {
      return _then(_value.copyWith(consumer: value));
    });
  }

  @override
  $PendingRepairRequestCopyWith<$Res> get record {
    return $PendingRepairRequestCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value));
    });
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(
      {required this.directions,
      required this.fromMarker,
      required this.toMarker,
      required this.consumer,
      required this.record,
      required final List<PendingServiceModel> pendingService,
      required final List<NeedToVerifyModel> needToVerifyService,
      required this.pendingAmount,
      required this.len})
      : _pendingService = pendingService,
        _needToVerifyService = needToVerifyService;

  @override
  final Directions directions;
  @override
  final Marker fromMarker;
  @override
  final Marker toMarker;
  @override
  final AppUser consumer;
  @override
  final PendingRepairRequest record;
  final List<PendingServiceModel> _pendingService;
  @override
  List<PendingServiceModel> get pendingService {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingService);
  }

  final List<NeedToVerifyModel> _needToVerifyService;
  @override
  List<NeedToVerifyModel> get needToVerifyService {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_needToVerifyService);
  }

  @override
  final int pendingAmount;
  @override
  final int len;

  @override
  String toString() {
    return 'NewRequestState.success(directions: $directions, fromMarker: $fromMarker, toMarker: $toMarker, consumer: $consumer, record: $record, pendingService: $pendingService, needToVerifyService: $needToVerifyService, pendingAmount: $pendingAmount, len: $len)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality()
                .equals(other.directions, directions) &&
            const DeepCollectionEquality()
                .equals(other.fromMarker, fromMarker) &&
            const DeepCollectionEquality().equals(other.toMarker, toMarker) &&
            const DeepCollectionEquality().equals(other.consumer, consumer) &&
            const DeepCollectionEquality().equals(other.record, record) &&
            const DeepCollectionEquality()
                .equals(other._pendingService, _pendingService) &&
            const DeepCollectionEquality()
                .equals(other._needToVerifyService, _needToVerifyService) &&
            const DeepCollectionEquality()
                .equals(other.pendingAmount, pendingAmount) &&
            const DeepCollectionEquality().equals(other.len, len));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(directions),
      const DeepCollectionEquality().hash(fromMarker),
      const DeepCollectionEquality().hash(toMarker),
      const DeepCollectionEquality().hash(consumer),
      const DeepCollectionEquality().hash(record),
      const DeepCollectionEquality().hash(_pendingService),
      const DeepCollectionEquality().hash(_needToVerifyService),
      const DeepCollectionEquality().hash(pendingAmount),
      const DeepCollectionEquality().hash(len));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() failure,
    required TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)
        success,
  }) {
    return success(directions, fromMarker, toMarker, consumer, record,
        pendingService, needToVerifyService, pendingAmount, len);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
  }) {
    return success?.call(directions, fromMarker, toMarker, consumer, record,
        pendingService, needToVerifyService, pendingAmount, len);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? failure,
    TResult Function(
            Directions directions,
            Marker fromMarker,
            Marker toMarker,
            AppUser consumer,
            PendingRepairRequest record,
            List<PendingServiceModel> pendingService,
            List<NeedToVerifyModel> needToVerifyService,
            int pendingAmount,
            int len)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(directions, fromMarker, toMarker, consumer, record,
          pendingService, needToVerifyService, pendingAmount, len);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements NewRequestState {
  const factory _Success(
      {required final Directions directions,
      required final Marker fromMarker,
      required final Marker toMarker,
      required final AppUser consumer,
      required final PendingRepairRequest record,
      required final List<PendingServiceModel> pendingService,
      required final List<NeedToVerifyModel> needToVerifyService,
      required final int pendingAmount,
      required final int len}) = _$_Success;

  Directions get directions;
  Marker get fromMarker;
  Marker get toMarker;
  AppUser get consumer;
  PendingRepairRequest get record;
  List<PendingServiceModel> get pendingService;
  List<NeedToVerifyModel> get needToVerifyService;
  int get pendingAmount;
  int get len;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
