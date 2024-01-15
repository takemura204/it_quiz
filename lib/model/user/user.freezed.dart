// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
//ユーザー基本情報
  String get uid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get birthDay => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError; //ユーザーのカスタム設定
  int get themeId => throw _privateConstructorUsedError;
  int get dailyGoal => throw _privateConstructorUsedError;
  NotificationTime? get selectNotificationTime =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String uid,
      String userName,
      String email,
      String password,
      String gender,
      String birthDay,
      bool isLogin,
      int themeId,
      int dailyGoal,
      NotificationTime? selectNotificationTime});

  $NotificationTimeCopyWith<$Res>? get selectNotificationTime;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
    Object? birthDay = null,
    Object? isLogin = null,
    Object? themeId = null,
    Object? dailyGoal = null,
    Object? selectNotificationTime = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as int,
      dailyGoal: null == dailyGoal
          ? _value.dailyGoal
          : dailyGoal // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String userName,
      String email,
      String password,
      String gender,
      String birthDay,
      bool isLogin,
      int themeId,
      int dailyGoal,
      NotificationTime? selectNotificationTime});

  @override
  $NotificationTimeCopyWith<$Res>? get selectNotificationTime;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
    Object? birthDay = null,
    Object? isLogin = null,
    Object? themeId = null,
    Object? dailyGoal = null,
    Object? selectNotificationTime = freezed,
  }) {
    return _then(_$_User(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: null == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as int,
      dailyGoal: null == dailyGoal
          ? _value.dailyGoal
          : dailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      selectNotificationTime: freezed == selectNotificationTime
          ? _value.selectNotificationTime
          : selectNotificationTime // ignore: cast_nullable_to_non_nullable
              as NotificationTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.uid = '',
      this.userName = '',
      this.email = '',
      this.password = '',
      this.gender = '',
      this.birthDay = '',
      this.isLogin = false,
      this.themeId = 0,
      this.dailyGoal = 10,
      this.selectNotificationTime});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

//ユーザー基本情報
  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final String birthDay;
  @override
  @JsonKey()
  final bool isLogin;
//ユーザーのカスタム設定
  @override
  @JsonKey()
  final int themeId;
  @override
  @JsonKey()
  final int dailyGoal;
  @override
  final NotificationTime? selectNotificationTime;

  @override
  String toString() {
    return 'User(uid: $uid, userName: $userName, email: $email, password: $password, gender: $gender, birthDay: $birthDay, isLogin: $isLogin, themeId: $themeId, dailyGoal: $dailyGoal, selectNotificationTime: $selectNotificationTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.dailyGoal, dailyGoal) ||
                other.dailyGoal == dailyGoal) &&
            (identical(other.selectNotificationTime, selectNotificationTime) ||
                other.selectNotificationTime == selectNotificationTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, userName, email, password,
      gender, birthDay, isLogin, themeId, dailyGoal, selectNotificationTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String uid,
      final String userName,
      final String email,
      final String password,
      final String gender,
      final String birthDay,
      final bool isLogin,
      final int themeId,
      final int dailyGoal,
      final NotificationTime? selectNotificationTime}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override //ユーザー基本情報
  String get uid;
  @override
  String get userName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get gender;
  @override
  String get birthDay;
  @override
  bool get isLogin;
  @override //ユーザーのカスタム設定
  int get themeId;
  @override
  int get dailyGoal;
  @override
  NotificationTime? get selectNotificationTime;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
