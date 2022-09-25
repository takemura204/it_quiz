// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginScreenStateTearOff {
  const _$LoginScreenStateTearOff();

  _Create call(
      {int currentIndex = 0,
      String email = '',
      String password = '',
      bool isObscure = true,
      bool isValidEmail = false,
      bool isSafetyPass = false}) {
    return _Create(
      currentIndex: currentIndex,
      email: email,
      password: password,
      isObscure: isObscure,
      isValidEmail: isValidEmail,
      isSafetyPass: isSafetyPass,
    );
  }
}

/// @nodoc
const $LoginScreenState = _$LoginScreenStateTearOff();

/// @nodoc
mixin _$LoginScreenState {
  int get currentIndex => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isObscure => throw _privateConstructorUsedError;
  bool get isValidEmail => throw _privateConstructorUsedError;
  bool get isSafetyPass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginScreenStateCopyWith<LoginScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, $Res Function(LoginScreenState) then) =
      _$LoginScreenStateCopyWithImpl<$Res>;
  $Res call(
      {int currentIndex,
      String email,
      String password,
      bool isObscure,
      bool isValidEmail,
      bool isSafetyPass});
}

/// @nodoc
class _$LoginScreenStateCopyWithImpl<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  final LoginScreenState _value;
  // ignore: unused_field
  final $Res Function(LoginScreenState) _then;

  @override
  $Res call({
    Object? currentIndex = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? isObscure = freezed,
    Object? isValidEmail = freezed,
    Object? isSafetyPass = freezed,
  }) {
    return _then(_value.copyWith(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isObscure: isObscure == freezed
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidEmail: isValidEmail == freezed
          ? _value.isValidEmail
          : isValidEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      isSafetyPass: isSafetyPass == freezed
          ? _value.isSafetyPass
          : isSafetyPass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $LoginScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int currentIndex,
      String email,
      String password,
      bool isObscure,
      bool isValidEmail,
      bool isSafetyPass});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res> extends _$LoginScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? currentIndex = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? isObscure = freezed,
    Object? isValidEmail = freezed,
    Object? isSafetyPass = freezed,
  }) {
    return _then(_Create(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isObscure: isObscure == freezed
          ? _value.isObscure
          : isObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidEmail: isValidEmail == freezed
          ? _value.isValidEmail
          : isValidEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      isSafetyPass: isSafetyPass == freezed
          ? _value.isSafetyPass
          : isSafetyPass // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.currentIndex = 0,
      this.email = '',
      this.password = '',
      this.isObscure = true,
      this.isValidEmail = false,
      this.isSafetyPass = false});

  @JsonKey()
  @override
  final int currentIndex;
  @JsonKey()
  @override
  final String email;
  @JsonKey()
  @override
  final String password;
  @JsonKey()
  @override
  final bool isObscure;
  @JsonKey()
  @override
  final bool isValidEmail;
  @JsonKey()
  @override
  final bool isSafetyPass;

  @override
  String toString() {
    return 'LoginScreenState(currentIndex: $currentIndex, email: $email, password: $password, isObscure: $isObscure, isValidEmail: $isValidEmail, isSafetyPass: $isSafetyPass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.isObscure, isObscure) &&
            const DeepCollectionEquality()
                .equals(other.isValidEmail, isValidEmail) &&
            const DeepCollectionEquality()
                .equals(other.isSafetyPass, isSafetyPass));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentIndex),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isObscure),
      const DeepCollectionEquality().hash(isValidEmail),
      const DeepCollectionEquality().hash(isSafetyPass));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements LoginScreenState {
  const factory _Create(
      {int currentIndex,
      String email,
      String password,
      bool isObscure,
      bool isValidEmail,
      bool isSafetyPass}) = _$_Create;

  @override
  int get currentIndex;
  @override
  String get email;
  @override
  String get password;
  @override
  bool get isObscure;
  @override
  bool get isValidEmail;
  @override
  bool get isSafetyPass;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
