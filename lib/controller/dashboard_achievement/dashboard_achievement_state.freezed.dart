// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_achievement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardAchievementState {
  bool get isLoading => throw _privateConstructorUsedError;
  Rank? get rankData => throw _privateConstructorUsedError; //ユーザーのランクデータ
  int get rankIndex => throw _privateConstructorUsedError; //現在のランク階級
  int get mission1Index => throw _privateConstructorUsedError;
  int get mission2Index => throw _privateConstructorUsedError;
  int get mission3Index => throw _privateConstructorUsedError;
  String get timeLimit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardAchievementStateCopyWith<DashboardAchievementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardAchievementStateCopyWith<$Res> {
  factory $DashboardAchievementStateCopyWith(DashboardAchievementState value,
          $Res Function(DashboardAchievementState) then) =
      _$DashboardAchievementStateCopyWithImpl<$Res, DashboardAchievementState>;
  @useResult
  $Res call(
      {bool isLoading,
      Rank? rankData,
      int rankIndex,
      int mission1Index,
      int mission2Index,
      int mission3Index,
      String timeLimit});

  $RankCopyWith<$Res>? get rankData;
}

/// @nodoc
class _$DashboardAchievementStateCopyWithImpl<$Res,
        $Val extends DashboardAchievementState>
    implements $DashboardAchievementStateCopyWith<$Res> {
  _$DashboardAchievementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? rankData = freezed,
    Object? rankIndex = null,
    Object? mission1Index = null,
    Object? mission2Index = null,
    Object? mission3Index = null,
    Object? timeLimit = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rankData: freezed == rankData
          ? _value.rankData
          : rankData // ignore: cast_nullable_to_non_nullable
              as Rank?,
      rankIndex: null == rankIndex
          ? _value.rankIndex
          : rankIndex // ignore: cast_nullable_to_non_nullable
              as int,
      mission1Index: null == mission1Index
          ? _value.mission1Index
          : mission1Index // ignore: cast_nullable_to_non_nullable
              as int,
      mission2Index: null == mission2Index
          ? _value.mission2Index
          : mission2Index // ignore: cast_nullable_to_non_nullable
              as int,
      mission3Index: null == mission3Index
          ? _value.mission3Index
          : mission3Index // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimit: null == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RankCopyWith<$Res>? get rankData {
    if (_value.rankData == null) {
      return null;
    }

    return $RankCopyWith<$Res>(_value.rankData!, (value) {
      return _then(_value.copyWith(rankData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $DashboardAchievementStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Rank? rankData,
      int rankIndex,
      int mission1Index,
      int mission2Index,
      int mission3Index,
      String timeLimit});

  @override
  $RankCopyWith<$Res>? get rankData;
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$DashboardAchievementStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? rankData = freezed,
    Object? rankIndex = null,
    Object? mission1Index = null,
    Object? mission2Index = null,
    Object? mission3Index = null,
    Object? timeLimit = null,
  }) {
    return _then(_$_Create(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rankData: freezed == rankData
          ? _value.rankData
          : rankData // ignore: cast_nullable_to_non_nullable
              as Rank?,
      rankIndex: null == rankIndex
          ? _value.rankIndex
          : rankIndex // ignore: cast_nullable_to_non_nullable
              as int,
      mission1Index: null == mission1Index
          ? _value.mission1Index
          : mission1Index // ignore: cast_nullable_to_non_nullable
              as int,
      mission2Index: null == mission2Index
          ? _value.mission2Index
          : mission2Index // ignore: cast_nullable_to_non_nullable
              as int,
      mission3Index: null == mission3Index
          ? _value.mission3Index
          : mission3Index // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimit: null == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create(
      {this.isLoading = false,
      this.rankData,
      this.rankIndex = 0,
      this.mission1Index = 0,
      this.mission2Index = 0,
      this.mission3Index = 0,
      this.timeLimit = ''})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Rank? rankData;
//ユーザーのランクデータ
  @override
  @JsonKey()
  final int rankIndex;
//現在のランク階級
  @override
  @JsonKey()
  final int mission1Index;
  @override
  @JsonKey()
  final int mission2Index;
  @override
  @JsonKey()
  final int mission3Index;
  @override
  @JsonKey()
  final String timeLimit;

  @override
  String toString() {
    return 'DashboardAchievementState(isLoading: $isLoading, rankData: $rankData, rankIndex: $rankIndex, mission1Index: $mission1Index, mission2Index: $mission2Index, mission3Index: $mission3Index, timeLimit: $timeLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.rankData, rankData) ||
                other.rankData == rankData) &&
            (identical(other.rankIndex, rankIndex) ||
                other.rankIndex == rankIndex) &&
            (identical(other.mission1Index, mission1Index) ||
                other.mission1Index == mission1Index) &&
            (identical(other.mission2Index, mission2Index) ||
                other.mission2Index == mission2Index) &&
            (identical(other.mission3Index, mission3Index) ||
                other.mission3Index == mission3Index) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, rankData, rankIndex,
      mission1Index, mission2Index, mission3Index, timeLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends DashboardAchievementState {
  factory _Create(
      {final bool isLoading,
      final Rank? rankData,
      final int rankIndex,
      final int mission1Index,
      final int mission2Index,
      final int mission3Index,
      final String timeLimit}) = _$_Create;
  _Create._() : super._();

  @override
  bool get isLoading;
  @override
  Rank? get rankData;
  @override //ユーザーのランクデータ
  int get rankIndex;
  @override //現在のランク階級
  int get mission1Index;
  @override
  int get mission2Index;
  @override
  int get mission3Index;
  @override
  String get timeLimit;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}