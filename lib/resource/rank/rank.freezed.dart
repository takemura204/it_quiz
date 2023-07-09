// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rank _$RankFromJson(Map<String, dynamic> json) {
  return _Rank.fromJson(json);
}

/// @nodoc
mixin _$Rank {
  int get rankId => throw _privateConstructorUsedError; //ランクID
  String get rankName => throw _privateConstructorUsedError; //称号の名前
  int get levelUpScore => throw _privateConstructorUsedError; //レベルアップする時のスコア
  int get rankLevel => throw _privateConstructorUsedError; //称号を獲得する時レベル
  int get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankCopyWith<Rank> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankCopyWith<$Res> {
  factory $RankCopyWith(Rank value, $Res Function(Rank) then) =
      _$RankCopyWithImpl<$Res, Rank>;
  @useResult
  $Res call(
      {int rankId,
      String rankName,
      int levelUpScore,
      int rankLevel,
      int score});
}

/// @nodoc
class _$RankCopyWithImpl<$Res, $Val extends Rank>
    implements $RankCopyWith<$Res> {
  _$RankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankId = null,
    Object? rankName = null,
    Object? levelUpScore = null,
    Object? rankLevel = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      rankId: null == rankId
          ? _value.rankId
          : rankId // ignore: cast_nullable_to_non_nullable
              as int,
      rankName: null == rankName
          ? _value.rankName
          : rankName // ignore: cast_nullable_to_non_nullable
              as String,
      levelUpScore: null == levelUpScore
          ? _value.levelUpScore
          : levelUpScore // ignore: cast_nullable_to_non_nullable
              as int,
      rankLevel: null == rankLevel
          ? _value.rankLevel
          : rankLevel // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RankCopyWith<$Res> implements $RankCopyWith<$Res> {
  factory _$$_RankCopyWith(_$_Rank value, $Res Function(_$_Rank) then) =
      __$$_RankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rankId,
      String rankName,
      int levelUpScore,
      int rankLevel,
      int score});
}

/// @nodoc
class __$$_RankCopyWithImpl<$Res> extends _$RankCopyWithImpl<$Res, _$_Rank>
    implements _$$_RankCopyWith<$Res> {
  __$$_RankCopyWithImpl(_$_Rank _value, $Res Function(_$_Rank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankId = null,
    Object? rankName = null,
    Object? levelUpScore = null,
    Object? rankLevel = null,
    Object? score = null,
  }) {
    return _then(_$_Rank(
      rankId: null == rankId
          ? _value.rankId
          : rankId // ignore: cast_nullable_to_non_nullable
              as int,
      rankName: null == rankName
          ? _value.rankName
          : rankName // ignore: cast_nullable_to_non_nullable
              as String,
      levelUpScore: null == levelUpScore
          ? _value.levelUpScore
          : levelUpScore // ignore: cast_nullable_to_non_nullable
              as int,
      rankLevel: null == rankLevel
          ? _value.rankLevel
          : rankLevel // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rank implements _Rank {
  const _$_Rank(
      {required this.rankId,
      required this.rankName,
      required this.levelUpScore,
      required this.rankLevel,
      required this.score});

  factory _$_Rank.fromJson(Map<String, dynamic> json) => _$$_RankFromJson(json);

  @override
  final int rankId;
//ランクID
  @override
  final String rankName;
//称号の名前
  @override
  final int levelUpScore;
//レベルアップする時のスコア
  @override
  final int rankLevel;
//称号を獲得する時レベル
  @override
  final int score;

  @override
  String toString() {
    return 'Rank(rankId: $rankId, rankName: $rankName, levelUpScore: $levelUpScore, rankLevel: $rankLevel, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rank &&
            (identical(other.rankId, rankId) || other.rankId == rankId) &&
            (identical(other.rankName, rankName) ||
                other.rankName == rankName) &&
            (identical(other.levelUpScore, levelUpScore) ||
                other.levelUpScore == levelUpScore) &&
            (identical(other.rankLevel, rankLevel) ||
                other.rankLevel == rankLevel) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, rankId, rankName, levelUpScore, rankLevel, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RankCopyWith<_$_Rank> get copyWith =>
      __$$_RankCopyWithImpl<_$_Rank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RankToJson(
      this,
    );
  }
}

abstract class _Rank implements Rank {
  const factory _Rank(
      {required final int rankId,
      required final String rankName,
      required final int levelUpScore,
      required final int rankLevel,
      required final int score}) = _$_Rank;

  factory _Rank.fromJson(Map<String, dynamic> json) = _$_Rank.fromJson;

  @override
  int get rankId;
  @override //ランクID
  String get rankName;
  @override //称号の名前
  int get levelUpScore;
  @override //レベルアップする時のスコア
  int get rankLevel;
  @override //称号を獲得する時レベル
  int get score;
  @override
  @JsonKey(ignore: true)
  _$$_RankCopyWith<_$_Rank> get copyWith => throw _privateConstructorUsedError;
}
