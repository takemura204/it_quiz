// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mission _$MissionFromJson(Map<String, dynamic> json) {
  return _Mission.fromJson(json);
}

/// @nodoc
mixin _$Mission {
  String? get docId => throw _privateConstructorUsedError;
  int get missionId => throw _privateConstructorUsedError; //ミッションID
  String get title => throw _privateConstructorUsedError; //ミッションの名前
  int get point => throw _privateConstructorUsedError; //獲得スコア
  bool get isDone => throw _privateConstructorUsedError; //達成したか
  bool get isReceived => throw _privateConstructorUsedError; //達成したか
  DateTime? get createdAt => throw _privateConstructorUsedError; //作成日
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionCopyWith<Mission> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionCopyWith<$Res> {
  factory $MissionCopyWith(Mission value, $Res Function(Mission) then) =
      _$MissionCopyWithImpl<$Res, Mission>;
  @useResult
  $Res call(
      {String? docId,
      int missionId,
      String title,
      int point,
      bool isDone,
      bool isReceived,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$MissionCopyWithImpl<$Res, $Val extends Mission>
    implements $MissionCopyWith<$Res> {
  _$MissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? missionId = null,
    Object? title = null,
    Object? point = null,
    Object? isDone = null,
    Object? isReceived = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      missionId: null == missionId
          ? _value.missionId
          : missionId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isReceived: null == isReceived
          ? _value.isReceived
          : isReceived // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MissionCopyWith<$Res> implements $MissionCopyWith<$Res> {
  factory _$$_MissionCopyWith(
          _$_Mission value, $Res Function(_$_Mission) then) =
      __$$_MissionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? docId,
      int missionId,
      String title,
      int point,
      bool isDone,
      bool isReceived,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$_MissionCopyWithImpl<$Res>
    extends _$MissionCopyWithImpl<$Res, _$_Mission>
    implements _$$_MissionCopyWith<$Res> {
  __$$_MissionCopyWithImpl(_$_Mission _value, $Res Function(_$_Mission) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? missionId = null,
    Object? title = null,
    Object? point = null,
    Object? isDone = null,
    Object? isReceived = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Mission(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      missionId: null == missionId
          ? _value.missionId
          : missionId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isReceived: null == isReceived
          ? _value.isReceived
          : isReceived // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Mission implements _Mission {
  const _$_Mission(
      {this.docId,
      required this.missionId,
      required this.title,
      required this.point,
      this.isDone = false,
      this.isReceived = false,
      this.createdAt,
      this.updatedAt});

  factory _$_Mission.fromJson(Map<String, dynamic> json) =>
      _$$_MissionFromJson(json);

  @override
  final String? docId;
  @override
  final int missionId;
//ミッションID
  @override
  final String title;
//ミッションの名前
  @override
  final int point;
//獲得スコア
  @override
  @JsonKey()
  final bool isDone;
//達成したか
  @override
  @JsonKey()
  final bool isReceived;
//達成したか
  @override
  final DateTime? createdAt;
//作成日
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Mission(docId: $docId, missionId: $missionId, title: $title, point: $point, isDone: $isDone, isReceived: $isReceived, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mission &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.missionId, missionId) ||
                other.missionId == missionId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.isReceived, isReceived) ||
                other.isReceived == isReceived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, docId, missionId, title, point,
      isDone, isReceived, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MissionCopyWith<_$_Mission> get copyWith =>
      __$$_MissionCopyWithImpl<_$_Mission>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MissionToJson(
      this,
    );
  }
}

abstract class _Mission implements Mission {
  const factory _Mission(
      {final String? docId,
      required final int missionId,
      required final String title,
      required final int point,
      final bool isDone,
      final bool isReceived,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_Mission;

  factory _Mission.fromJson(Map<String, dynamic> json) = _$_Mission.fromJson;

  @override
  String? get docId;
  @override
  int get missionId;
  @override //ミッションID
  String get title;
  @override //ミッションの名前
  int get point;
  @override //獲得スコア
  bool get isDone;
  @override //達成したか
  bool get isReceived;
  @override //達成したか
  DateTime? get createdAt;
  @override //作成日
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MissionCopyWith<_$_Mission> get copyWith =>
      throw _privateConstructorUsedError;
}
