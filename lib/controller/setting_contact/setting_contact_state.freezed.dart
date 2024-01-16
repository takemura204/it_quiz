// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_contact_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingContactState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingContactStateCopyWith<SettingContactState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingContactStateCopyWith<$Res> {
  factory $SettingContactStateCopyWith(
          SettingContactState value, $Res Function(SettingContactState) then) =
      _$SettingContactStateCopyWithImpl<$Res, SettingContactState>;
  @useResult
  $Res call({bool isLoading, bool isConnected});
}

/// @nodoc
class _$SettingContactStateCopyWithImpl<$Res, $Val extends SettingContactState>
    implements $SettingContactStateCopyWith<$Res> {
  _$SettingContactStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingContactStateCopyWith<$Res>
    implements $SettingContactStateCopyWith<$Res> {
  factory _$$_SettingContactStateCopyWith(_$_SettingContactState value,
          $Res Function(_$_SettingContactState) then) =
      __$$_SettingContactStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isConnected});
}

/// @nodoc
class __$$_SettingContactStateCopyWithImpl<$Res>
    extends _$SettingContactStateCopyWithImpl<$Res, _$_SettingContactState>
    implements _$$_SettingContactStateCopyWith<$Res> {
  __$$_SettingContactStateCopyWithImpl(_$_SettingContactState _value,
      $Res Function(_$_SettingContactState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isConnected = null,
  }) {
    return _then(_$_SettingContactState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingContactState implements _SettingContactState {
  const _$_SettingContactState(
      {this.isLoading = false, this.isConnected = true});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isConnected;

  @override
  String toString() {
    return 'SettingContactState(isLoading: $isLoading, isConnected: $isConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingContactState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingContactStateCopyWith<_$_SettingContactState> get copyWith =>
      __$$_SettingContactStateCopyWithImpl<_$_SettingContactState>(
          this, _$identity);
}

abstract class _SettingContactState implements SettingContactState {
  const factory _SettingContactState(
      {final bool isLoading, final bool isConnected}) = _$_SettingContactState;

  @override
  bool get isLoading;
  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$$_SettingContactStateCopyWith<_$_SettingContactState> get copyWith =>
      throw _privateConstructorUsedError;
}
