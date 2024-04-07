// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return _Auth.fromJson(json);
}

/// @nodoc
mixin _$Auth {
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
  bool get isPremium => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthCopyWith<Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res, Auth>;
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
      NotificationTime? selectNotificationTime,
      bool isPremium});

  $NotificationTimeCopyWith<$Res>? get selectNotificationTime;
}

/// @nodoc
class _$AuthCopyWithImpl<$Res, $Val extends Auth>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._value, this._then);

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
    Object? isPremium = null,
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
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_AuthCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$$_AuthCopyWith(_$_Auth value, $Res Function(_$_Auth) then) =
      __$$_AuthCopyWithImpl<$Res>;
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
      NotificationTime? selectNotificationTime,
      bool isPremium});

  @override
  $NotificationTimeCopyWith<$Res>? get selectNotificationTime;
}

/// @nodoc
class __$$_AuthCopyWithImpl<$Res> extends _$AuthCopyWithImpl<$Res, _$_Auth>
    implements _$$_AuthCopyWith<$Res> {
  __$$_AuthCopyWithImpl(_$_Auth _value, $Res Function(_$_Auth) _then)
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
    Object? isPremium = null,
  }) {
    return _then(_$_Auth(
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
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Auth implements _Auth {
  const _$_Auth(
      {this.uid = '',
      this.userName = '',
      this.email = '',
      this.password = '',
      this.gender = '',
      this.birthDay = '',
      this.isLogin = false,
      this.themeId = 0,
      this.dailyGoal = 10,
      this.selectNotificationTime,
      this.isPremium = false});

  factory _$_Auth.fromJson(Map<String, dynamic> json) => _$$_AuthFromJson(json);

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
  @JsonKey()
  final bool isPremium;

  @override
  String toString() {
    return 'Auth(uid: $uid, userName: $userName, email: $email, password: $password, gender: $gender, birthDay: $birthDay, isLogin: $isLogin, themeId: $themeId, dailyGoal: $dailyGoal, selectNotificationTime: $selectNotificationTime, isPremium: $isPremium)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Auth &&
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
                other.selectNotificationTime == selectNotificationTime) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      userName,
      email,
      password,
      gender,
      birthDay,
      isLogin,
      themeId,
      dailyGoal,
      selectNotificationTime,
      isPremium);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthCopyWith<_$_Auth> get copyWith =>
      __$$_AuthCopyWithImpl<_$_Auth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthToJson(
      this,
    );
  }
}

abstract class _Auth implements Auth {
  const factory _Auth(
      {final String uid,
      final String userName,
      final String email,
      final String password,
      final String gender,
      final String birthDay,
      final bool isLogin,
      final int themeId,
      final int dailyGoal,
      final NotificationTime? selectNotificationTime,
      final bool isPremium}) = _$_Auth;

  factory _Auth.fromJson(Map<String, dynamic> json) = _$_Auth.fromJson;

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
  bool get isPremium;
  @override
  @JsonKey(ignore: true)
  _$$_AuthCopyWith<_$_Auth> get copyWith => throw _privateConstructorUsedError;
}
