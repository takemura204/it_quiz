// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_test_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeTestScreenStateTearOff {
  const _$HomeTestScreenStateTearOff();

  _Create call({List<String> tabNames = const []}) {
    return _Create(
      tabNames: tabNames,
    );
  }
}

/// @nodoc
const $HomeTestScreenState = _$HomeTestScreenStateTearOff();

/// @nodoc
mixin _$HomeTestScreenState {
  List<String> get tabNames => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeTestScreenStateCopyWith<HomeTestScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeTestScreenStateCopyWith<$Res> {
  factory $HomeTestScreenStateCopyWith(
          HomeTestScreenState value, $Res Function(HomeTestScreenState) then) =
      _$HomeTestScreenStateCopyWithImpl<$Res>;
  $Res call({List<String> tabNames});
}

/// @nodoc
class _$HomeTestScreenStateCopyWithImpl<$Res>
    implements $HomeTestScreenStateCopyWith<$Res> {
  _$HomeTestScreenStateCopyWithImpl(this._value, this._then);

  final HomeTestScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeTestScreenState) _then;

  @override
  $Res call({
    Object? tabNames = freezed,
  }) {
    return _then(_value.copyWith(
      tabNames: tabNames == freezed
          ? _value.tabNames
          : tabNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $HomeTestScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> tabNames});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res>
    extends _$HomeTestScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? tabNames = freezed,
  }) {
    return _then(_Create(
      tabNames: tabNames == freezed
          ? _value.tabNames
          : tabNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create({this.tabNames = const []}) : super._();

  @JsonKey()
  @override
  final List<String> tabNames;

  @override
  String toString() {
    return 'HomeTestScreenState(tabNames: $tabNames)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality().equals(other.tabNames, tabNames));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tabNames));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create extends HomeTestScreenState {
  factory _Create({List<String> tabNames}) = _$_Create;
  _Create._() : super._();

  @override
  List<String> get tabNames;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
