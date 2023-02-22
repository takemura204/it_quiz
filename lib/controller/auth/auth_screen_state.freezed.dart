// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthScreenStateTearOff {
  const _$AuthScreenStateTearOff();

  _Create call(
      {int currentImageIndex = 0, String userName = 'ゲスト', String email = ''}) {
    return _Create(
      currentImageIndex: currentImageIndex,
      userName: userName,
      email: email,
    );
  }
}

/// @nodoc
const $AuthScreenState = _$AuthScreenStateTearOff();

/// @nodoc
mixin _$AuthScreenState {
  int get currentImageIndex => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthScreenStateCopyWith<AuthScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthScreenStateCopyWith<$Res> {
  factory $AuthScreenStateCopyWith(
          AuthScreenState value, $Res Function(AuthScreenState) then) =
      _$AuthScreenStateCopyWithImpl<$Res>;
  $Res call({int currentImageIndex, String userName, String email});
}

/// @nodoc
class _$AuthScreenStateCopyWithImpl<$Res>
    implements $AuthScreenStateCopyWith<$Res> {
  _$AuthScreenStateCopyWithImpl(this._value, this._then);

  final AuthScreenState _value;
  // ignore: unused_field
  final $Res Function(AuthScreenState) _then;

  @override
  $Res call({
    Object? currentImageIndex = freezed,
    Object? userName = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      currentImageIndex: currentImageIndex == freezed
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $AuthScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call({int currentImageIndex, String userName, String email});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res> extends _$AuthScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? currentImageIndex = freezed,
    Object? userName = freezed,
    Object? email = freezed,
  }) {
    return _then(_Create(
      currentImageIndex: currentImageIndex == freezed
          ? _value.currentImageIndex
          : currentImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.currentImageIndex = 0, this.userName = 'ゲスト', this.email = ''});

  @JsonKey()
  @override
  final int currentImageIndex;
  @JsonKey()
  @override
  final String userName;
  @JsonKey()
  @override
  final String email;

  @override
  String toString() {
    return 'AuthScreenState(currentImageIndex: $currentImageIndex, userName: $userName, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality()
                .equals(other.currentImageIndex, currentImageIndex) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentImageIndex),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements AuthScreenState {
  const factory _Create(
      {int currentImageIndex, String userName, String email}) = _$_Create;

  @override
  int get currentImageIndex;
  @override
  String get userName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
