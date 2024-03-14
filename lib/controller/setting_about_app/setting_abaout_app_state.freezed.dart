// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_abaout_app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingAboutAppState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingAboutAppStateCopyWith<SettingAboutAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingAboutAppStateCopyWith<$Res> {
  factory $SettingAboutAppStateCopyWith(SettingAboutAppState value,
          $Res Function(SettingAboutAppState) then) =
      _$SettingAboutAppStateCopyWithImpl<$Res, SettingAboutAppState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$SettingAboutAppStateCopyWithImpl<$Res,
        $Val extends SettingAboutAppState>
    implements $SettingAboutAppStateCopyWith<$Res> {
  _$SettingAboutAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingAboutAppStateCopyWith<$Res>
    implements $SettingAboutAppStateCopyWith<$Res> {
  factory _$$_SettingAboutAppStateCopyWith(_$_SettingAboutAppState value,
          $Res Function(_$_SettingAboutAppState) then) =
      __$$_SettingAboutAppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_SettingAboutAppStateCopyWithImpl<$Res>
    extends _$SettingAboutAppStateCopyWithImpl<$Res, _$_SettingAboutAppState>
    implements _$$_SettingAboutAppStateCopyWith<$Res> {
  __$$_SettingAboutAppStateCopyWithImpl(_$_SettingAboutAppState _value,
      $Res Function(_$_SettingAboutAppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_SettingAboutAppState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingAboutAppState implements _SettingAboutAppState {
  const _$_SettingAboutAppState({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SettingAboutAppState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingAboutAppState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingAboutAppStateCopyWith<_$_SettingAboutAppState> get copyWith =>
      __$$_SettingAboutAppStateCopyWithImpl<_$_SettingAboutAppState>(
          this, _$identity);
}

abstract class _SettingAboutAppState implements SettingAboutAppState {
  const factory _SettingAboutAppState({final bool isLoading}) =
      _$_SettingAboutAppState;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_SettingAboutAppStateCopyWith<_$_SettingAboutAppState> get copyWith =>
      throw _privateConstructorUsedError;
}
