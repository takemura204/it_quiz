// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MissionData _$MissionDataFromJson(Map<String, dynamic> json) {
  return _MissionData.fromJson(json);
}

/// @nodoc
mixin _$MissionData {
  int get missionId => throw _privateConstructorUsedError; //ミッションID
  String get missionName => throw _privateConstructorUsedError; //ミッションの名前
  int get score => throw _privateConstructorUsedError; //獲得スコア
  MissionStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionDataCopyWith<MissionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionDataCopyWith<$Res> {
  factory $MissionDataCopyWith(
          MissionData value, $Res Function(MissionData) then) =
      _$MissionDataCopyWithImpl<$Res, MissionData>;
  @useResult
  $Res call(
      {int missionId, String missionName, int score, MissionStatus status});
}

/// @nodoc
class _$MissionDataCopyWithImpl<$Res, $Val extends MissionData>
    implements $MissionDataCopyWith<$Res> {
  _$MissionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionId = null,
    Object? missionName = null,
    Object? score = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      missionId: null == missionId
          ? _value.missionId
          : missionId // ignore: cast_nullable_to_non_nullable
              as int,
      missionName: null == missionName
          ? _value.missionName
          : missionName // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MissionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MissionDataCopyWith<$Res>
    implements $MissionDataCopyWith<$Res> {
  factory _$$_MissionDataCopyWith(
          _$_MissionData value, $Res Function(_$_MissionData) then) =
      __$$_MissionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int missionId, String missionName, int score, MissionStatus status});
}

/// @nodoc
class __$$_MissionDataCopyWithImpl<$Res>
    extends _$MissionDataCopyWithImpl<$Res, _$_MissionData>
    implements _$$_MissionDataCopyWith<$Res> {
  __$$_MissionDataCopyWithImpl(
      _$_MissionData _value, $Res Function(_$_MissionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionId = null,
    Object? missionName = null,
    Object? score = null,
    Object? status = null,
  }) {
    return _then(_$_MissionData(
      missionId: null == missionId
          ? _value.missionId
          : missionId // ignore: cast_nullable_to_non_nullable
              as int,
      missionName: null == missionName
          ? _value.missionName
          : missionName // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MissionStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MissionData implements _MissionData {
  const _$_MissionData(
      {required this.missionId,
      required this.missionName,
      required this.score,
      required this.status});

  factory _$_MissionData.fromJson(Map<String, dynamic> json) =>
      _$$_MissionDataFromJson(json);

  @override
  final int missionId;
//ミッションID
  @override
  final String missionName;
//ミッションの名前
  @override
  final int score;
//獲得スコア
  @override
  final MissionStatus status;

  @override
  String toString() {
    return 'MissionData(missionId: $missionId, missionName: $missionName, score: $score, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MissionData &&
            (identical(other.missionId, missionId) ||
                other.missionId == missionId) &&
            (identical(other.missionName, missionName) ||
                other.missionName == missionName) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, missionId, missionName, score, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MissionDataCopyWith<_$_MissionData> get copyWith =>
      __$$_MissionDataCopyWithImpl<_$_MissionData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MissionDataToJson(
      this,
    );
  }
}

abstract class _MissionData implements MissionData {
  const factory _MissionData(
      {required final int missionId,
      required final String missionName,
      required final int score,
      required final MissionStatus status}) = _$_MissionData;

  factory _MissionData.fromJson(Map<String, dynamic> json) =
      _$_MissionData.fromJson;

  @override
  int get missionId;
  @override //ミッションID
  String get missionName;
  @override //ミッションの名前
  int get score;
  @override //獲得スコア
  MissionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_MissionDataCopyWith<_$_MissionData> get copyWith =>
      throw _privateConstructorUsedError;
}
