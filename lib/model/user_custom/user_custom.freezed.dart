// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_custom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserCustom {
  int get skinId => throw _privateConstructorUsedError;
  int get dailyQuizCountGoal => throw _privateConstructorUsedError;
  int get dailyDurationGoal => throw _privateConstructorUsedError;
  NotificationTime? get selectNotificationTime =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCustomCopyWith<UserCustom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCustomCopyWith<$Res> {
  factory $UserCustomCopyWith(
          UserCustom value, $Res Function(UserCustom) then) =
      _$UserCustomCopyWithImpl<$Res, UserCustom>;
  @useResult
  $Res call(
      {int skinId,
      int dailyQuizCountGoal,
      int dailyDurationGoal,
      NotificationTime? selectNotificationTime});

  $NotificationTimeCopyWith<$Res>? get selectNotificationTime;
}

/// @nodoc
class _$UserCustomCopyWithImpl<$Res, $Val extends UserCustom>
    implements $UserCustomCopyWith<$Res> {
  _$UserCustomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skinId = null,
    Object? dailyQuizCountGoal = null,
    Object? dailyDurationGoal = null,
    Object? selectNotificationTime = freezed,
  }) {
    return _then(_value.copyWith(
      skinId: null == skinId
          ? _value.skinId
          : skinId // ignore: cast_nullable_to_non_nullable
              as int,
      dailyQuizCountGoal: null == dailyQuizCountGoal
          ? _value.dailyQuizCountGoal
          : dailyQuizCountGoal // ignore: cast_nullable_to_non_nullable
              as int,
      dailyDurationGoal: null == dailyDurationGoal
          ? _value.dailyDurationGoal
          : dailyDurationGoal // ignore: cast_nullable_to_non_nullable
              as int,
      selectNotificationTime: freezed == selectNotificationTime
          ? _value.selectNotificationTime
          : selectNotificationTime // ignore: cast_nullable_to_non_nullable
              as NotificationTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationTimeCopyWith<$Res>? get selectNotificationTime {
    if (_value.selectNotificationTime == null) {
      return null;
    }

    return $NotificationTimeCopyWith<$Res>(_value.selectNotificationTime!,
        (value) {
      return _then(_value.copyWith(selectNotificationTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCustomCopyWith<$Res>
    implements $UserCustomCopyWith<$Res> {
  factory _$$_UserCustomCopyWith(
          _$_UserCustom value, $Res Function(_$_UserCustom) then) =
      __$$_UserCustomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int skinId,
      int dailyQuizCountGoal,
      int dailyDurationGoal,
      NotificationTime? selectNotificationTime});

  @override
  $NotificationTimeCopyWith<$Res>? get selectNotificationTime;
}

/// @nodoc
class __$$_UserCustomCopyWithImpl<$Res>
    extends _$UserCustomCopyWithImpl<$Res, _$_UserCustom>
    implements _$$_UserCustomCopyWith<$Res> {
  __$$_UserCustomCopyWithImpl(
      _$_UserCustom _value, $Res Function(_$_UserCustom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skinId = null,
    Object? dailyQuizCountGoal = null,
    Object? dailyDurationGoal = null,
    Object? selectNotificationTime = freezed,
  }) {
    return _then(_$_UserCustom(
      skinId: null == skinId
          ? _value.skinId
          : skinId // ignore: cast_nullable_to_non_nullable
              as int,
      dailyQuizCountGoal: null == dailyQuizCountGoal
          ? _value.dailyQuizCountGoal
          : dailyQuizCountGoal // ignore: cast_nullable_to_non_nullable
              as int,
      dailyDurationGoal: null == dailyDurationGoal
          ? _value.dailyDurationGoal
          : dailyDurationGoal // ignore: cast_nullable_to_non_nullable
              as int,
      selectNotificationTime: freezed == selectNotificationTime
          ? _value.selectNotificationTime
          : selectNotificationTime // ignore: cast_nullable_to_non_nullable
              as NotificationTime?,
    ));
  }
}

/// @nodoc

class _$_UserCustom implements _UserCustom {
  const _$_UserCustom(
      {this.skinId = 0,
      this.dailyQuizCountGoal = 10,
      this.dailyDurationGoal = 10,
      this.selectNotificationTime});

  @override
  @JsonKey()
  final int skinId;
  @override
  @JsonKey()
  final int dailyQuizCountGoal;
  @override
  @JsonKey()
  final int dailyDurationGoal;
  @override
  final NotificationTime? selectNotificationTime;

  @override
  String toString() {
    return 'UserCustom(skinId: $skinId, dailyQuizCountGoal: $dailyQuizCountGoal, dailyDurationGoal: $dailyDurationGoal, selectNotificationTime: $selectNotificationTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCustom &&
            (identical(other.skinId, skinId) || other.skinId == skinId) &&
            (identical(other.dailyQuizCountGoal, dailyQuizCountGoal) ||
                other.dailyQuizCountGoal == dailyQuizCountGoal) &&
            (identical(other.dailyDurationGoal, dailyDurationGoal) ||
                other.dailyDurationGoal == dailyDurationGoal) &&
            (identical(other.selectNotificationTime, selectNotificationTime) ||
                other.selectNotificationTime == selectNotificationTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, skinId, dailyQuizCountGoal,
      dailyDurationGoal, selectNotificationTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCustomCopyWith<_$_UserCustom> get copyWith =>
      __$$_UserCustomCopyWithImpl<_$_UserCustom>(this, _$identity);
}

abstract class _UserCustom implements UserCustom {
  const factory _UserCustom(
      {final int skinId,
      final int dailyQuizCountGoal,
      final int dailyDurationGoal,
      final NotificationTime? selectNotificationTime}) = _$_UserCustom;

  @override
  int get skinId;
  @override
  int get dailyQuizCountGoal;
  @override
  int get dailyDurationGoal;
  @override
  NotificationTime? get selectNotificationTime;
  @override
  @JsonKey(ignore: true)
  _$$_UserCustomCopyWith<_$_UserCustom> get copyWith =>
      throw _privateConstructorUsedError;
}
