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
  int get exp => throw _privateConstructorUsedError; //獲得スコア
  bool get isReceived => throw _privateConstructorUsedError; //受け取ったか？
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
      int exp,
      bool isReceived,
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
    Object? exp = null,
    Object? isReceived = null,
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
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      isReceived: null == isReceived
          ? _value.isReceived
          : isReceived // ignore: cast_nullable_to_non_nullable
              as bool,
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
      int exp,
      bool isReceived,
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
    Object? exp = null,
    Object? isReceived = null,
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
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      isReceived: null == isReceived
          ? _value.isReceived
          : isReceived // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Mission extends _Mission {
  _$_Mission(
      {this.docId,
      this.missionId = 0,
      this.title = "",
      this.exp = 0,
      this.isReceived = false,
      this.updatedAt})
      : super._();

  factory _$_Mission.fromJson(Map<String, dynamic> json) =>
      _$$_MissionFromJson(json);

  @override
  final String? docId;
  @override
  @JsonKey()
  final int missionId;
//ミッションID
  @override
  @JsonKey()
  final String title;
//ミッションの名前
  @override
  @JsonKey()
  final int exp;
//獲得スコア
  @override
  @JsonKey()
  final bool isReceived;
//受け取ったか？
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Mission(docId: $docId, missionId: $missionId, title: $title, exp: $exp, isReceived: $isReceived, updatedAt: $updatedAt)';
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
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.isReceived, isReceived) ||
                other.isReceived == isReceived) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, docId, missionId, title, exp, isReceived, updatedAt);

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

abstract class _Mission extends Mission {
  factory _Mission(
      {final String? docId,
      final int missionId,
      final String title,
      final int exp,
      final bool isReceived,
      final DateTime? updatedAt}) = _$_Mission;
  _Mission._() : super._();

  factory _Mission.fromJson(Map<String, dynamic> json) = _$_Mission.fromJson;

  @override
  String? get docId;
  @override
  int get missionId;
  @override //ミッションID
  String get title;
  @override //ミッションの名前
  int get exp;
  @override //獲得スコア
  bool get isReceived;
  @override //受け取ったか？
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MissionCopyWith<_$_Mission> get copyWith =>
      throw _privateConstructorUsedError;
}
