// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_primary_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePrimaryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IVector<String> ads) initial,
    required TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)
        loaded,
    required TResult Function(
            AppUser user, IList<MyServiceData> listService, IVector<String> ads)
        recentOrderEmpty,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OrderEmpty value) recentOrderEmpty,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePrimaryStateCopyWith<$Res> {
  factory $HomePrimaryStateCopyWith(
          HomePrimaryState value, $Res Function(HomePrimaryState) then) =
      _$HomePrimaryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePrimaryStateCopyWithImpl<$Res>
    implements $HomePrimaryStateCopyWith<$Res> {
  _$HomePrimaryStateCopyWithImpl(this._value, this._then);

  final HomePrimaryState _value;
  // ignore: unused_field
  final $Res Function(HomePrimaryState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  $Res call({IVector<String> ads});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomePrimaryStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? ads = freezed,
  }) {
    return _then(_$_Initial(
      ads: ads == freezed
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as IVector<String>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.ads});

  @override
  final IVector<String> ads;

  @override
  String toString() {
    return 'HomePrimaryState.initial(ads: $ads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.ads, ads));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ads));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IVector<String> ads) initial,
    required TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)
        loaded,
    required TResult Function(
            AppUser user, IList<MyServiceData> listService, IVector<String> ads)
        recentOrderEmpty,
    required TResult Function() loading,
  }) {
    return initial(ads);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
  }) {
    return initial?.call(ads);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(ads);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OrderEmpty value) recentOrderEmpty,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomePrimaryState {
  const factory _Initial({required final IVector<String> ads}) = _$_Initial;

  IVector<String> get ads;
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  $Res call(
      {AppUser user,
      RecentOrderData recentOrder,
      IList<MyServiceData> listService,
      IVector<String> ads});

  $AppUserCopyWith<$Res> get user;
  $RecentOrderDataCopyWith<$Res> get recentOrder;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res> extends _$HomePrimaryStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? user = freezed,
    Object? recentOrder = freezed,
    Object? listService = freezed,
    Object? ads = freezed,
  }) {
    return _then(_$_Loaded(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
      recentOrder: recentOrder == freezed
          ? _value.recentOrder
          : recentOrder // ignore: cast_nullable_to_non_nullable
              as RecentOrderData,
      listService: listService == freezed
          ? _value.listService
          : listService // ignore: cast_nullable_to_non_nullable
              as IList<MyServiceData>,
      ads: ads == freezed
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as IVector<String>,
    ));
  }

  @override
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $RecentOrderDataCopyWith<$Res> get recentOrder {
    return $RecentOrderDataCopyWith<$Res>(_value.recentOrder, (value) {
      return _then(_value.copyWith(recentOrder: value));
    });
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required this.user,
      required this.recentOrder,
      required this.listService,
      required this.ads});

  @override
  final AppUser user;
  @override
  final RecentOrderData recentOrder;
  @override
  final IList<MyServiceData> listService;
  @override
  final IVector<String> ads;

  @override
  String toString() {
    return 'HomePrimaryState.loaded(user: $user, recentOrder: $recentOrder, listService: $listService, ads: $ads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.recentOrder, recentOrder) &&
            const DeepCollectionEquality()
                .equals(other.listService, listService) &&
            const DeepCollectionEquality().equals(other.ads, ads));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(recentOrder),
      const DeepCollectionEquality().hash(listService),
      const DeepCollectionEquality().hash(ads));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IVector<String> ads) initial,
    required TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)
        loaded,
    required TResult Function(
            AppUser user, IList<MyServiceData> listService, IVector<String> ads)
        recentOrderEmpty,
    required TResult Function() loading,
  }) {
    return loaded(user, recentOrder, listService, ads);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
  }) {
    return loaded?.call(user, recentOrder, listService, ads);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user, recentOrder, listService, ads);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OrderEmpty value) recentOrderEmpty,
    required TResult Function(_Loading value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements HomePrimaryState {
  const factory _Loaded(
      {required final AppUser user,
      required final RecentOrderData recentOrder,
      required final IList<MyServiceData> listService,
      required final IVector<String> ads}) = _$_Loaded;

  AppUser get user;
  RecentOrderData get recentOrder;
  IList<MyServiceData> get listService;
  IVector<String> get ads;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OrderEmptyCopyWith<$Res> {
  factory _$$_OrderEmptyCopyWith(
          _$_OrderEmpty value, $Res Function(_$_OrderEmpty) then) =
      __$$_OrderEmptyCopyWithImpl<$Res>;
  $Res call(
      {AppUser user, IList<MyServiceData> listService, IVector<String> ads});

  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_OrderEmptyCopyWithImpl<$Res>
    extends _$HomePrimaryStateCopyWithImpl<$Res>
    implements _$$_OrderEmptyCopyWith<$Res> {
  __$$_OrderEmptyCopyWithImpl(
      _$_OrderEmpty _value, $Res Function(_$_OrderEmpty) _then)
      : super(_value, (v) => _then(v as _$_OrderEmpty));

  @override
  _$_OrderEmpty get _value => super._value as _$_OrderEmpty;

  @override
  $Res call({
    Object? user = freezed,
    Object? listService = freezed,
    Object? ads = freezed,
  }) {
    return _then(_$_OrderEmpty(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
      listService: listService == freezed
          ? _value.listService
          : listService // ignore: cast_nullable_to_non_nullable
              as IList<MyServiceData>,
      ads: ads == freezed
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as IVector<String>,
    ));
  }

  @override
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_OrderEmpty implements _OrderEmpty {
  const _$_OrderEmpty(
      {required this.user, required this.listService, required this.ads});

  @override
  final AppUser user;
  @override
  final IList<MyServiceData> listService;
  @override
  final IVector<String> ads;

  @override
  String toString() {
    return 'HomePrimaryState.recentOrderEmpty(user: $user, listService: $listService, ads: $ads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderEmpty &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.listService, listService) &&
            const DeepCollectionEquality().equals(other.ads, ads));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(listService),
      const DeepCollectionEquality().hash(ads));

  @JsonKey(ignore: true)
  @override
  _$$_OrderEmptyCopyWith<_$_OrderEmpty> get copyWith =>
      __$$_OrderEmptyCopyWithImpl<_$_OrderEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(IVector<String> ads) initial,
    required TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)
        loaded,
    required TResult Function(
            AppUser user, IList<MyServiceData> listService, IVector<String> ads)
        recentOrderEmpty,
    required TResult Function() loading,
  }) {
    return recentOrderEmpty(user, listService, ads);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
  }) {
    return recentOrderEmpty?.call(user, listService, ads);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (recentOrderEmpty != null) {
      return recentOrderEmpty(user, listService, ads);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OrderEmpty value) recentOrderEmpty,
    required TResult Function(_Loading value) loading,
  }) {
    return recentOrderEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
  }) {
    return recentOrderEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (recentOrderEmpty != null) {
      return recentOrderEmpty(this);
    }
    return orElse();
  }
}

abstract class _OrderEmpty implements HomePrimaryState {
  const factory _OrderEmpty(
      {required final AppUser user,
      required final IList<MyServiceData> listService,
      required final IVector<String> ads}) = _$_OrderEmpty;

  AppUser get user;
  IList<MyServiceData> get listService;
  IVector<String> get ads;
  @JsonKey(ignore: true)
  _$$_OrderEmptyCopyWith<_$_OrderEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$HomePrimaryStateCopyWithImpl<$Res>
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
    return 'HomePrimaryState.loading()';
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
    required TResult Function(IVector<String> ads) initial,
    required TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)
        loaded,
    required TResult Function(
            AppUser user, IList<MyServiceData> listService, IVector<String> ads)
        recentOrderEmpty,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(IVector<String> ads)? initial,
    TResult Function(AppUser user, RecentOrderData recentOrder,
            IList<MyServiceData> listService, IVector<String> ads)?
        loaded,
    TResult Function(AppUser user, IList<MyServiceData> listService,
            IVector<String> ads)?
        recentOrderEmpty,
    TResult Function()? loading,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_OrderEmpty value) recentOrderEmpty,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_OrderEmpty value)? recentOrderEmpty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomePrimaryState {
  const factory _Loading() = _$_Loading;
}
