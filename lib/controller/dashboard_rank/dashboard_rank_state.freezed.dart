// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_rank_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardRankState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<RankData> get rankDataList =>
      throw _privateConstructorUsedError; //ランク一覧データ
  RankData? get rankData => throw _privateConstructorUsedError; //ユーザーのランクデータ
  int get rankIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardRankStateCopyWith<DashboardRankState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardRankStateCopyWith<$Res> {
  factory $DashboardRankStateCopyWith(
          DashboardRankState value, $Res Function(DashboardRankState) then) =
      _$DashboardRankStateCopyWithImpl<$Res, DashboardRankState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<RankData> rankDataList,
      RankData? rankData,
      int rankIndex});

  $RankDataCopyWith<$Res>? get rankData;
}

/// @nodoc
class _$DashboardRankStateCopyWithImpl<$Res, $Val extends DashboardRankState>
    implements $DashboardRankStateCopyWith<$Res> {
  _$DashboardRankStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? rankDataList = null,
    Object? rankData = freezed,
    Object? rankIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rankDataList: null == rankDataList
          ? _value.rankDataList
          : rankDataList // ignore: cast_nullable_to_non_nullable
              as List<RankData>,
      rankData: freezed == rankData
          ? _value.rankData
          : rankData // ignore: cast_nullable_to_non_nullable
              as RankData?,
      rankIndex: null == rankIndex
          ? _value.rankIndex
          : rankIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RankDataCopyWith<$Res>? get rankData {
    if (_value.rankData == null) {
      return null;
    }

    return $RankDataCopyWith<$Res>(_value.rankData!, (value) {
      return _then(_value.copyWith(rankData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $DashboardRankStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<RankData> rankDataList,
      RankData? rankData,
      int rankIndex});

  @override
  $RankDataCopyWith<$Res>? get rankData;
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$DashboardRankStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? rankDataList = null,
    Object? rankData = freezed,
    Object? rankIndex = null,
  }) {
    return _then(_$_Create(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rankDataList: null == rankDataList
          ? _value._rankDataList
          : rankDataList // ignore: cast_nullable_to_non_nullable
              as List<RankData>,
      rankData: freezed == rankData
          ? _value.rankData
          : rankData // ignore: cast_nullable_to_non_nullable
              as RankData?,
      rankIndex: null == rankIndex
          ? _value.rankIndex
          : rankIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create(
      {this.isLoading = false,
      final List<RankData> rankDataList = const [],
      this.rankData,
      this.rankIndex = 0})
      : _rankDataList = rankDataList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<RankData> _rankDataList;
  @override
  @JsonKey()
  List<RankData> get rankDataList {
    if (_rankDataList is EqualUnmodifiableListView) return _rankDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rankDataList);
  }

//ランク一覧データ
  @override
  final RankData? rankData;
//ユーザーのランクデータ
  @override
  @JsonKey()
  final int rankIndex;

  @override
  String toString() {
    return 'DashboardRankState(isLoading: $isLoading, rankDataList: $rankDataList, rankData: $rankData, rankIndex: $rankIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._rankDataList, _rankDataList) &&
            (identical(other.rankData, rankData) ||
                other.rankData == rankData) &&
            (identical(other.rankIndex, rankIndex) ||
                other.rankIndex == rankIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_rankDataList), rankData, rankIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends DashboardRankState {
  factory _Create(
      {final bool isLoading,
      final List<RankData> rankDataList,
      final RankData? rankData,
      final int rankIndex}) = _$_Create;
  _Create._() : super._();

  @override
  bool get isLoading;
  @override
  List<RankData> get rankDataList;
  @override //ランク一覧データ
  RankData? get rankData;
  @override //ユーザーのランクデータ
  int get rankIndex;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
