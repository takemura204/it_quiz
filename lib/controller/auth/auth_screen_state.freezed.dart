// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthScreenState {
//ユーザー情報
  String get uid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  File? get userImage => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  DateTime? get birthDay => throw _privateConstructorUsedError; //その他
  String get selectGender => throw _privateConstructorUsedError;
  DateTime? get selectedBirthDay => throw _privateConstructorUsedError;
  int get currentImageIndex => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;
  bool get isObscure => throw _privateConstructorUsedError;
  bool get isValidUserName => throw _privateConstructorUsedError;
  bool get isValidEmail => throw _privateConstructorUsedError;
  bool get isSafetyPass => throw _privateConstructorUsedError;
  bool get isSucceeded => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isNotTap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthScreenStateCopyWith<AuthScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthScreenStateCopyWith<$Res> {
  factory $AuthScreenStateCopyWith(
          AuthScreenState value, $Res Function(AuthScreenState) then) =
      _$AuthScreenStateCopyWithImpl<$Res, AuthScreenState>;
  @useResult
  $Res call(
      {String uid,
      String userName,
      File? userImage,
      String email,
      String password,
      String gender,
      DateTime? birthDay,
      String selectGender,
      DateTime? selectedBirthDay,
      int currentImageIndex,
      String errorText,
      bool isObscure,
      bool isValidUserName,
      bool isValidEmail,
      bool isSafetyPass,
      bool isSucceeded,
      bool hasError,
      bool isNotTap});
}

/// @nodoc
class _$AuthScreenStateCopyWithImpl<$Res, $Val extends AuthScreenState>
    implements $AuthScreenStateCopyWith<$Res> {
  _$AuthScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? userImage = freezed,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
    Object? birthDay = freezed,
    Object? selectGender = null,
    Object? selectedBirthDay = freezed,
    Object? currentImageIndex = null,
    Object? errorText = null,
    Object? isObscure = null,
    Object? isValidUserName = null,
    Object? isValidEmail = null,
    Object? isSafetyPass = null,
    Object? isSucceeded = null,
    Object? hasError = null,
    Object? isNotTap = null,
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
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectGender: null == selectGender
          ? _value.selectGender
          : selectGender // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBirthDay: freezed == selectedBirthDay
          ? _value.selectedBirthDay
          : selectedBirthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $AuthScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String userName,
      File? userImage,
      String email,
      String password,
      String gender,
      DateTime? birthDay,
      String selectGender,
      DateTime? selectedBirthDay,
      int currentImageIndex,
      String errorText,
      bool isObscure,
      bool isValidUserName,
      bool isValidEmail,
      bool isSafetyPass,
      bool isSucceeded,
      bool hasError,
      bool isNotTap});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$AuthScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? userName = null,
    Object? userImage = freezed,
    Object? email = null,
    Object? password = null,
    Object? gender = null,
    Object? birthDay = freezed,
    Object? selectGender = null,
    Object? selectedBirthDay = freezed,
    Object? currentImageIndex = null,
    Object? errorText = null,
    Object? isObscure = null,
    Object? isValidUserName = null,
    Object? isValidEmail = null,
    Object? isSafetyPass = null,
    Object? isSucceeded = null,
    Object? hasError = null,
    Object? isNotTap = null,
  }) {
    return _then(_$_Create(
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
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectGender: null == selectGender
          ? _value.selectGender
          : selectGender // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBirthDay: freezed == selectedBirthDay
          ? _value.selectedBirthDay
          : selectedBirthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.uid = '',
      this.userName = 'ゲスト',
      this.userImage = null,
      this.email = '',
      this.password = '',
      this.gender = '',
      this.birthDay,
      this.selectGender = '',
      this.selectedBirthDay,
      this.currentImageIndex = 0,
      this.errorText = '',
      this.isObscure = true,
      this.isValidUserName = false,
      this.isValidEmail = false,
      this.isSafetyPass = false,
      this.isSucceeded = false,
      this.hasError = false,
      this.isNotTap = false});

//ユーザー情報
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
  final DateTime? birthDay;
//その他
  @override
  @JsonKey()
  final String selectGender;
  @override
  final DateTime? selectedBirthDay;
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
  String toString() {
    return 'AuthScreenState(uid: $uid, userName: $userName, userImage: $userImage, email: $email, password: $password, gender: $gender, birthDay: $birthDay, selectGender: $selectGender, selectedBirthDay: $selectedBirthDay, currentImageIndex: $currentImageIndex, errorText: $errorText, isObscure: $isObscure, isValidUserName: $isValidUserName, isValidEmail: $isValidEmail, isSafetyPass: $isSafetyPass, isSucceeded: $isSucceeded, hasError: $hasError, isNotTap: $isNotTap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
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
            (identical(other.selectGender, selectGender) ||
                other.selectGender == selectGender) &&
            (identical(other.selectedBirthDay, selectedBirthDay) ||
                other.selectedBirthDay == selectedBirthDay) &&
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
                other.isNotTap == isNotTap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      userName,
      userImage,
      email,
      password,
      gender,
      birthDay,
      selectGender,
      selectedBirthDay,
      currentImageIndex,
      errorText,
      isObscure,
      isValidUserName,
      isValidEmail,
      isSafetyPass,
      isSucceeded,
      hasError,
      isNotTap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create implements AuthScreenState {
  const factory _Create(
      {final String uid,
      final String userName,
      final File? userImage,
      final String email,
      final String password,
      final String gender,
      final DateTime? birthDay,
      final String selectGender,
      final DateTime? selectedBirthDay,
      final int currentImageIndex,
      final String errorText,
      final bool isObscure,
      final bool isValidUserName,
      final bool isValidEmail,
      final bool isSafetyPass,
      final bool isSucceeded,
      final bool hasError,
      final bool isNotTap}) = _$_Create;

  @override //ユーザー情報
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
  DateTime? get birthDay;
  @override //その他
  String get selectGender;
  @override
  DateTime? get selectedBirthDay;
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
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
