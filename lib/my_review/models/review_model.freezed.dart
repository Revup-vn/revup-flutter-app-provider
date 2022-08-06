// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewModel {
  UserModel get user => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  DateTime get commentedData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res>;
  $Res call(
      {UserModel user, String comment, int rating, DateTime commentedData});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res> implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  final ReviewModel _value;
  // ignore: unused_field
  final $Res Function(ReviewModel) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? comment = freezed,
    Object? rating = freezed,
    Object? commentedData = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      commentedData: commentedData == freezed
          ? _value.commentedData
          : commentedData // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReviewModelCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$_ReviewModelCopyWith(
          _$_ReviewModel value, $Res Function(_$_ReviewModel) then) =
      __$$_ReviewModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserModel user, String comment, int rating, DateTime commentedData});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ReviewModelCopyWithImpl<$Res> extends _$ReviewModelCopyWithImpl<$Res>
    implements _$$_ReviewModelCopyWith<$Res> {
  __$$_ReviewModelCopyWithImpl(
      _$_ReviewModel _value, $Res Function(_$_ReviewModel) _then)
      : super(_value, (v) => _then(v as _$_ReviewModel));

  @override
  _$_ReviewModel get _value => super._value as _$_ReviewModel;

  @override
  $Res call({
    Object? user = freezed,
    Object? comment = freezed,
    Object? rating = freezed,
    Object? commentedData = freezed,
  }) {
    return _then(_$_ReviewModel(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      commentedData: commentedData == freezed
          ? _value.commentedData
          : commentedData // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ReviewModel implements _ReviewModel {
  const _$_ReviewModel(
      {required this.user,
      required this.comment,
      required this.rating,
      required this.commentedData});

  @override
  final UserModel user;
  @override
  final String comment;
  @override
  final int rating;
  @override
  final DateTime commentedData;

  @override
  String toString() {
    return 'ReviewModel(user: $user, comment: $comment, rating: $rating, commentedData: $commentedData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewModel &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality()
                .equals(other.commentedData, commentedData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(commentedData));

  @JsonKey(ignore: true)
  @override
  _$$_ReviewModelCopyWith<_$_ReviewModel> get copyWith =>
      __$$_ReviewModelCopyWithImpl<_$_ReviewModel>(this, _$identity);
}

abstract class _ReviewModel implements ReviewModel {
  const factory _ReviewModel(
      {required final UserModel user,
      required final String comment,
      required final int rating,
      required final DateTime commentedData}) = _$_ReviewModel;

  @override
  UserModel get user;
  @override
  String get comment;
  @override
  int get rating;
  @override
  DateTime get commentedData;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewModelCopyWith<_$_ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
