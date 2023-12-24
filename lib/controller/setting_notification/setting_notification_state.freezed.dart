// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingNotificationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isNotification => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingNotificationStateCopyWith<SettingNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingNotificationStateCopyWith<$Res> {
  factory $SettingNotificationStateCopyWith(SettingNotificationState value,
          $Res Function(SettingNotificationState) then) =
      _$SettingNotificationStateCopyWithImpl<$Res, SettingNotificationState>;
  @useResult
  $Res call({bool isLoading, bool isNotification});
}

/// @nodoc
class _$SettingNotificationStateCopyWithImpl<$Res,
        $Val extends SettingNotificationState>
    implements $SettingNotificationStateCopyWith<$Res> {
  _$SettingNotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isNotification = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotification: null == isNotification
          ? _value.isNotification
          : isNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingNotificationStateCopyWith<$Res>
    implements $SettingNotificationStateCopyWith<$Res> {
  factory _$$_SettingNotificationStateCopyWith(
          _$_SettingNotificationState value,
          $Res Function(_$_SettingNotificationState) then) =
      __$$_SettingNotificationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isNotification});
}

/// @nodoc
class __$$_SettingNotificationStateCopyWithImpl<$Res>
    extends _$SettingNotificationStateCopyWithImpl<$Res,
        _$_SettingNotificationState>
    implements _$$_SettingNotificationStateCopyWith<$Res> {
  __$$_SettingNotificationStateCopyWithImpl(_$_SettingNotificationState _value,
      $Res Function(_$_SettingNotificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isNotification = null,
  }) {
    return _then(_$_SettingNotificationState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotification: null == isNotification
          ? _value.isNotification
          : isNotification // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingNotificationState extends _SettingNotificationState {
  const _$_SettingNotificationState(
      {this.isLoading = false, this.isNotification = false})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isNotification;

  @override
  String toString() {
    return 'SettingNotificationState(isLoading: $isLoading, isNotification: $isNotification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingNotificationState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isNotification, isNotification) ||
                other.isNotification == isNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingNotificationStateCopyWith<_$_SettingNotificationState>
      get copyWith => __$$_SettingNotificationStateCopyWithImpl<
          _$_SettingNotificationState>(this, _$identity);
}

abstract class _SettingNotificationState extends SettingNotificationState {
  const factory _SettingNotificationState(
      {final bool isLoading,
      final bool isNotification}) = _$_SettingNotificationState;
  const _SettingNotificationState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isNotification;
  @override
  @JsonKey(ignore: true)
  _$$_SettingNotificationStateCopyWith<_$_SettingNotificationState>
      get copyWith => throw _privateConstructorUsedError;
}
