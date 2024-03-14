// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationTime _$NotificationTimeFromJson(Map<String, dynamic> json) {
  return _NotificationTime.fromJson(json);
}

/// @nodoc
mixin _$NotificationTime {
  int? get hour => throw _privateConstructorUsedError;
  int? get minute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationTimeCopyWith<NotificationTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTimeCopyWith<$Res> {
  factory $NotificationTimeCopyWith(
          NotificationTime value, $Res Function(NotificationTime) then) =
      _$NotificationTimeCopyWithImpl<$Res, NotificationTime>;
  @useResult
  $Res call({int? hour, int? minute});
}

/// @nodoc
class _$NotificationTimeCopyWithImpl<$Res, $Val extends NotificationTime>
    implements $NotificationTimeCopyWith<$Res> {
  _$NotificationTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_value.copyWith(
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationTimeCopyWith<$Res>
    implements $NotificationTimeCopyWith<$Res> {
  factory _$$_NotificationTimeCopyWith(
          _$_NotificationTime value, $Res Function(_$_NotificationTime) then) =
      __$$_NotificationTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? hour, int? minute});
}

/// @nodoc
class __$$_NotificationTimeCopyWithImpl<$Res>
    extends _$NotificationTimeCopyWithImpl<$Res, _$_NotificationTime>
    implements _$$_NotificationTimeCopyWith<$Res> {
  __$$_NotificationTimeCopyWithImpl(
      _$_NotificationTime _value, $Res Function(_$_NotificationTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_$_NotificationTime(
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int?,
      minute: freezed == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationTime implements _NotificationTime {
  _$_NotificationTime({this.hour, this.minute});

  factory _$_NotificationTime.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationTimeFromJson(json);

  @override
  final int? hour;
  @override
  final int? minute;

  @override
  String toString() {
    return 'NotificationTime(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationTime &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationTimeCopyWith<_$_NotificationTime> get copyWith =>
      __$$_NotificationTimeCopyWithImpl<_$_NotificationTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationTimeToJson(
      this,
    );
  }
}

abstract class _NotificationTime implements NotificationTime {
  factory _NotificationTime({final int? hour, final int? minute}) =
      _$_NotificationTime;

  factory _NotificationTime.fromJson(Map<String, dynamic> json) =
      _$_NotificationTime.fromJson;

  @override
  int? get hour;
  @override
  int? get minute;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationTimeCopyWith<_$_NotificationTime> get copyWith =>
      throw _privateConstructorUsedError;
}
