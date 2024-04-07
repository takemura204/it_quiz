// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
//ユーザー情報
  Auth? get user => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  File? get userImage => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get birthDay => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError; //その他
  String get selectGender => throw _privateConstructorUsedError;
  int get currentImageIndex => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;
  bool get isObscure => throw _privateConstructorUsedError;
  bool get isValidUserName => throw _privateConstructorUsedError;
  bool get isValidEmail => throw _privateConstructorUsedError;
  bool get isSafetyPass => throw _privateConstructorUsedError;
  bool get isSucceeded => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isNotTap => throw _privateConstructorUsedError;
  bool get isNotSignUpCompleted => throw _privateConstructorUsedError;
  AuthActiveType get activeType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {Auth? user,
      String uid,
      String userName,
      File? userImage,
      String email,
      String password,
      String gender,
      String birthDay,
      bool isLogin,
      String selectGender,
      int currentImageIndex,
      String errorText,
      bool isObscure,
      bool isValidUserName,
      bool isValidEmail,
      bool isSafetyPass,
      bool isSucceeded,
      bool hasError,
      bool isNotTap,
      bool isNotSignUpCompleted,
      AuthActiveType activeType});

  $AuthCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? uid = null,
    Object? userName = null,
    Object? userImage = freezed,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
    Object? birthDay = null,
    Object? isLogin = null,
    Object? selectGender = null,
    Object? currentImageIndex = null,
    Object? errorText = null,
    Object? isObscure = null,
    Object? isValidUserName = null,
    Object? isValidEmail = null,
    Object? isSafetyPass = null,
    Object? isSucceeded = null,
    Object? hasError = null,
    Object? isNotTap = null,
    Object? isNotSignUpCompleted = null,
    Object? activeType = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Auth?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as File?,
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
      selectGender: null == selectGender
          ? _value.selectGender
          : selectGender // ignore: cast_nullable_to_non_nullable
              as String,
      currentImageIndex: null == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      errorText: null == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      isObscure: null == isObscure
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidUserName: null == isValidUserName
          ? _value.isValidUserName
          : isValidUserName // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidEmail: null == isValidEmail
          ? _value.isValidEmail
          : isValidEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      isSafetyPass: null == isSafetyPass
          ? _value.isSafetyPass
          : isSafetyPass // ignore: cast_nullable_to_non_nullable
              as bool,
      isSucceeded: null == isSucceeded
          ? _value.isSucceeded
          : isSucceeded // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotTap: null == isNotTap
          ? _value.isNotTap
          : isNotTap // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotSignUpCompleted: null == isNotSignUpCompleted
          ? _value.isNotSignUpCompleted
          : isNotSignUpCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      activeType: null == activeType
          ? _value.activeType
          : activeType // ignore: cast_nullable_to_non_nullable
              as AuthActiveType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $AuthCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Auth? user,
      String uid,
      String userName,
      File? userImage,
      String email,
      String password,
      String gender,
      String birthDay,
      bool isLogin,
      String selectGender,
      int currentImageIndex,
      String errorText,
      bool isObscure,
      bool isValidUserName,
      bool isValidEmail,
      bool isSafetyPass,
      bool isSucceeded,
      bool hasError,
      bool isNotTap,
      bool isNotSignUpCompleted,
      AuthActiveType activeType});

  @override
  $AuthCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? uid = null,
    Object? userName = null,
    Object? userImage = freezed,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
    Object? birthDay = null,
    Object? isLogin = null,
    Object? selectGender = null,
    Object? currentImageIndex = null,
    Object? errorText = null,
    Object? isObscure = null,
    Object? isValidUserName = null,
    Object? isValidEmail = null,
    Object? isSafetyPass = null,
    Object? isSucceeded = null,
    Object? hasError = null,
    Object? isNotTap = null,
    Object? isNotSignUpCompleted = null,
    Object? activeType = null,
  }) {
    return _then(_$_Create(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Auth?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: freezed == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as File?,
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
      selectGender: null == selectGender
          ? _value.selectGender
          : selectGender // ignore: cast_nullable_to_non_nullable
              as String,
      currentImageIndex: null == currentImageIndex
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      errorText: null == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      isObscure: null == isObscure
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidUserName: null == isValidUserName
          ? _value.isValidUserName
          : isValidUserName // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidEmail: null == isValidEmail
          ? _value.isValidEmail
          : isValidEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      isSafetyPass: null == isSafetyPass
          ? _value.isSafetyPass
          : isSafetyPass // ignore: cast_nullable_to_non_nullable
              as bool,
      isSucceeded: null == isSucceeded
          ? _value.isSucceeded
          : isSucceeded // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotTap: null == isNotTap
          ? _value.isNotTap
          : isNotTap // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotSignUpCompleted: null == isNotSignUpCompleted
          ? _value.isNotSignUpCompleted
          : isNotSignUpCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      activeType: null == activeType
          ? _value.activeType
          : activeType // ignore: cast_nullable_to_non_nullable
              as AuthActiveType,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.user,
      this.uid = '',
      this.userName = '',
      this.userImage = null,
      this.email = '',
      this.password = '',
      this.gender = '',
      this.birthDay = '',
      this.isLogin = false,
      this.selectGender = '',
      this.currentImageIndex = 0,
      this.errorText = '',
      this.isObscure = true,
      this.isValidUserName = false,
      this.isValidEmail = false,
      this.isSafetyPass = false,
      this.isSucceeded = false,
      this.hasError = false,
      this.isNotTap = false,
      this.isNotSignUpCompleted = false,
      this.activeType = AuthActiveType.signUp});

//ユーザー情報
  @override
  final Auth? user;
  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final File? userImage;
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
//その他
  @override
  @JsonKey()
  final String selectGender;
  @override
  @JsonKey()
  final int currentImageIndex;
  @override
  @JsonKey()
  final String errorText;
  @override
  @JsonKey()
  final bool isObscure;
  @override
  @JsonKey()
  final bool isValidUserName;
  @override
  @JsonKey()
  final bool isValidEmail;
  @override
  @JsonKey()
  final bool isSafetyPass;
  @override
  @JsonKey()
  final bool isSucceeded;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final bool isNotTap;
  @override
  @JsonKey()
  final bool isNotSignUpCompleted;
  @override
  @JsonKey()
  final AuthActiveType activeType;

  @override
  String toString() {
    return 'AuthState(user: $user, uid: $uid, userName: $userName, userImage: $userImage, email: $email, password: $password, gender: $gender, birthDay: $birthDay, isLogin: $isLogin, selectGender: $selectGender, currentImageIndex: $currentImageIndex, errorText: $errorText, isObscure: $isObscure, isValidUserName: $isValidUserName, isValidEmail: $isValidEmail, isSafetyPass: $isSafetyPass, isSucceeded: $isSucceeded, hasError: $hasError, isNotTap: $isNotTap, isNotSignUpCompleted: $isNotSignUpCompleted, activeType: $activeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.selectGender, selectGender) ||
                other.selectGender == selectGender) &&
            (identical(other.currentImageIndex, currentImageIndex) ||
                other.currentImageIndex == currentImageIndex) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.isObscure, isObscure) ||
                other.isObscure == isObscure) &&
            (identical(other.isValidUserName, isValidUserName) ||
                other.isValidUserName == isValidUserName) &&
            (identical(other.isValidEmail, isValidEmail) ||
                other.isValidEmail == isValidEmail) &&
            (identical(other.isSafetyPass, isSafetyPass) ||
                other.isSafetyPass == isSafetyPass) &&
            (identical(other.isSucceeded, isSucceeded) ||
                other.isSucceeded == isSucceeded) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isNotTap, isNotTap) ||
                other.isNotTap == isNotTap) &&
            (identical(other.isNotSignUpCompleted, isNotSignUpCompleted) ||
                other.isNotSignUpCompleted == isNotSignUpCompleted) &&
            (identical(other.activeType, activeType) ||
                other.activeType == activeType));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        user,
        uid,
        userName,
        userImage,
        email,
        password,
        gender,
        birthDay,
        isLogin,
        selectGender,
        currentImageIndex,
        errorText,
        isObscure,
        isValidUserName,
        isValidEmail,
        isSafetyPass,
        isSucceeded,
        hasError,
        isNotTap,
        isNotSignUpCompleted,
        activeType
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create implements AuthState {
  const factory _Create(
      {final Auth? user,
      final String uid,
      final String userName,
      final File? userImage,
      final String email,
      final String password,
      final String gender,
      final String birthDay,
      final bool isLogin,
      final String selectGender,
      final int currentImageIndex,
      final String errorText,
      final bool isObscure,
      final bool isValidUserName,
      final bool isValidEmail,
      final bool isSafetyPass,
      final bool isSucceeded,
      final bool hasError,
      final bool isNotTap,
      final bool isNotSignUpCompleted,
      final AuthActiveType activeType}) = _$_Create;

  @override //ユーザー情報
  Auth? get user;
  @override
  String get uid;
  @override
  String get userName;
  @override
  File? get userImage;
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
  @override //その他
  String get selectGender;
  @override
  int get currentImageIndex;
  @override
  String get errorText;
  @override
  bool get isObscure;
  @override
  bool get isValidUserName;
  @override
  bool get isValidEmail;
  @override
  bool get isSafetyPass;
  @override
  bool get isSucceeded;
  @override
  bool get hasError;
  @override
  bool get isNotTap;
  @override
  bool get isNotSignUpCompleted;
  @override
  AuthActiveType get activeType;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
