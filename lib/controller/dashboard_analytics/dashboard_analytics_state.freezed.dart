// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardAnalyticsState {
  bool get isLoading => throw _privateConstructorUsedError; // データのローディングステータス
  int get tabIndex => throw _privateConstructorUsedError; //タブ
  int get selectedXIndex => throw _privateConstructorUsedError;
  int get goalScore => throw _privateConstructorUsedError; //毎日の目標
  int get weeklyIndex => throw _privateConstructorUsedError; //1週間の単位
  int get monthlyIndex => throw _privateConstructorUsedError; //1ヶ月の単位
  int get selectedDayRange => throw _privateConstructorUsedError; //
  int get weekOffset => throw _privateConstructorUsedError; //週の操作
  int get monthOffset => throw _privateConstructorUsedError; //今月・先月・来月
  String get dayRangeText => throw _privateConstructorUsedError; //タブ
  List<BarData> get totalData =>
      throw _privateConstructorUsedError; //全部のスコア(3ヶ月)
  List<List<BarData>> get weeklyData =>
      throw _privateConstructorUsedError; //1週間のスコア
  List<List<BarData>> get monthlyData =>
      throw _privateConstructorUsedError; //1ヶ月のスコア
  BarData? get dailyData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardAnalyticsStateCopyWith<DashboardAnalyticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardAnalyticsStateCopyWith<$Res> {
  factory $DashboardAnalyticsStateCopyWith(DashboardAnalyticsState value,
          $Res Function(DashboardAnalyticsState) then) =
      _$DashboardAnalyticsStateCopyWithImpl<$Res, DashboardAnalyticsState>;
  @useResult
  $Res call(
      {bool isLoading,
      int tabIndex,
      int selectedXIndex,
      int goalScore,
      int weeklyIndex,
      int monthlyIndex,
      int selectedDayRange,
      int weekOffset,
      int monthOffset,
      String dayRangeText,
      List<BarData> totalData,
      List<List<BarData>> weeklyData,
      List<List<BarData>> monthlyData,
      BarData? dailyData});

  $BarDataCopyWith<$Res>? get dailyData;
}

/// @nodoc
class _$DashboardAnalyticsStateCopyWithImpl<$Res,
        $Val extends DashboardAnalyticsState>
    implements $DashboardAnalyticsStateCopyWith<$Res> {
  _$DashboardAnalyticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? tabIndex = null,
    Object? selectedXIndex = null,
    Object? goalScore = null,
    Object? weeklyIndex = null,
    Object? monthlyIndex = null,
    Object? selectedDayRange = null,
    Object? weekOffset = null,
    Object? monthOffset = null,
    Object? dayRangeText = null,
    Object? totalData = null,
    Object? weeklyData = null,
    Object? monthlyData = null,
    Object? dailyData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedXIndex: null == selectedXIndex
          ? _value.selectedXIndex
          : selectedXIndex // ignore: cast_nullable_to_non_nullable
              as int,
      goalScore: null == goalScore
          ? _value.goalScore
          : goalScore // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyIndex: null == weeklyIndex
          ? _value.weeklyIndex
          : weeklyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyIndex: null == monthlyIndex
          ? _value.monthlyIndex
          : monthlyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDayRange: null == selectedDayRange
          ? _value.selectedDayRange
          : selectedDayRange // ignore: cast_nullable_to_non_nullable
              as int,
      weekOffset: null == weekOffset
          ? _value.weekOffset
          : weekOffset // ignore: cast_nullable_to_non_nullable
              as int,
      monthOffset: null == monthOffset
          ? _value.monthOffset
          : monthOffset // ignore: cast_nullable_to_non_nullable
              as int,
      dayRangeText: null == dayRangeText
          ? _value.dayRangeText
          : dayRangeText // ignore: cast_nullable_to_non_nullable
              as String,
      totalData: null == totalData
          ? _value.totalData
          : totalData // ignore: cast_nullable_to_non_nullable
              as List<BarData>,
      weeklyData: null == weeklyData
          ? _value.weeklyData
          : weeklyData // ignore: cast_nullable_to_non_nullable
              as List<List<BarData>>,
      monthlyData: null == monthlyData
          ? _value.monthlyData
          : monthlyData // ignore: cast_nullable_to_non_nullable
              as List<List<BarData>>,
      dailyData: freezed == dailyData
          ? _value.dailyData
          : dailyData // ignore: cast_nullable_to_non_nullable
              as BarData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BarDataCopyWith<$Res>? get dailyData {
    if (_value.dailyData == null) {
      return null;
    }

    return $BarDataCopyWith<$Res>(_value.dailyData!, (value) {
      return _then(_value.copyWith(dailyData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $DashboardAnalyticsStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int tabIndex,
      int selectedXIndex,
      int goalScore,
      int weeklyIndex,
      int monthlyIndex,
      int selectedDayRange,
      int weekOffset,
      int monthOffset,
      String dayRangeText,
      List<BarData> totalData,
      List<List<BarData>> weeklyData,
      List<List<BarData>> monthlyData,
      BarData? dailyData});

  @override
  $BarDataCopyWith<$Res>? get dailyData;
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$DashboardAnalyticsStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? tabIndex = null,
    Object? selectedXIndex = null,
    Object? goalScore = null,
    Object? weeklyIndex = null,
    Object? monthlyIndex = null,
    Object? selectedDayRange = null,
    Object? weekOffset = null,
    Object? monthOffset = null,
    Object? dayRangeText = null,
    Object? totalData = null,
    Object? weeklyData = null,
    Object? monthlyData = null,
    Object? dailyData = freezed,
  }) {
    return _then(_$_Create(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedXIndex: null == selectedXIndex
          ? _value.selectedXIndex
          : selectedXIndex // ignore: cast_nullable_to_non_nullable
              as int,
      goalScore: null == goalScore
          ? _value.goalScore
          : goalScore // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyIndex: null == weeklyIndex
          ? _value.weeklyIndex
          : weeklyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyIndex: null == monthlyIndex
          ? _value.monthlyIndex
          : monthlyIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDayRange: null == selectedDayRange
          ? _value.selectedDayRange
          : selectedDayRange // ignore: cast_nullable_to_non_nullable
              as int,
      weekOffset: null == weekOffset
          ? _value.weekOffset
          : weekOffset // ignore: cast_nullable_to_non_nullable
              as int,
      monthOffset: null == monthOffset
          ? _value.monthOffset
          : monthOffset // ignore: cast_nullable_to_non_nullable
              as int,
      dayRangeText: null == dayRangeText
          ? _value.dayRangeText
          : dayRangeText // ignore: cast_nullable_to_non_nullable
              as String,
      totalData: null == totalData
          ? _value._totalData
          : totalData // ignore: cast_nullable_to_non_nullable
              as List<BarData>,
      weeklyData: null == weeklyData
          ? _value._weeklyData
          : weeklyData // ignore: cast_nullable_to_non_nullable
              as List<List<BarData>>,
      monthlyData: null == monthlyData
          ? _value._monthlyData
          : monthlyData // ignore: cast_nullable_to_non_nullable
              as List<List<BarData>>,
      dailyData: freezed == dailyData
          ? _value.dailyData
          : dailyData // ignore: cast_nullable_to_non_nullable
              as BarData?,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create(
      {this.isLoading = false,
      this.tabIndex = 0,
      this.selectedXIndex = -1,
      this.goalScore = 10,
      this.weeklyIndex = 0,
      this.monthlyIndex = 0,
      this.selectedDayRange = 7,
      this.weekOffset = 0,
      this.monthOffset = 0,
      this.dayRangeText = "",
      final List<BarData> totalData = const [],
      final List<List<BarData>> weeklyData = const [],
      final List<List<BarData>> monthlyData = const [],
      this.dailyData})
      : _totalData = totalData,
        _weeklyData = weeklyData,
        _monthlyData = monthlyData,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
// データのローディングステータス
  @override
  @JsonKey()
  final int tabIndex;
//タブ
  @override
  @JsonKey()
  final int selectedXIndex;
  @override
  @JsonKey()
  final int goalScore;
//毎日の目標
  @override
  @JsonKey()
  final int weeklyIndex;
//1週間の単位
  @override
  @JsonKey()
  final int monthlyIndex;
//1ヶ月の単位
  @override
  @JsonKey()
  final int selectedDayRange;
//
  @override
  @JsonKey()
  final int weekOffset;
//週の操作
  @override
  @JsonKey()
  final int monthOffset;
//今月・先月・来月
  @override
  @JsonKey()
  final String dayRangeText;
//タブ
  final List<BarData> _totalData;
//タブ
  @override
  @JsonKey()
  List<BarData> get totalData {
    if (_totalData is EqualUnmodifiableListView) return _totalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalData);
  }

//全部のスコア(3ヶ月)
  final List<List<BarData>> _weeklyData;
//全部のスコア(3ヶ月)
  @override
  @JsonKey()
  List<List<BarData>> get weeklyData {
    if (_weeklyData is EqualUnmodifiableListView) return _weeklyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyData);
  }

//1週間のスコア
  final List<List<BarData>> _monthlyData;
//1週間のスコア
  @override
  @JsonKey()
  List<List<BarData>> get monthlyData {
    if (_monthlyData is EqualUnmodifiableListView) return _monthlyData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyData);
  }

//1ヶ月のスコア
  @override
  final BarData? dailyData;

  @override
  String toString() {
    return 'DashboardAnalyticsState(isLoading: $isLoading, tabIndex: $tabIndex, selectedXIndex: $selectedXIndex, goalScore: $goalScore, weeklyIndex: $weeklyIndex, monthlyIndex: $monthlyIndex, selectedDayRange: $selectedDayRange, weekOffset: $weekOffset, monthOffset: $monthOffset, dayRangeText: $dayRangeText, totalData: $totalData, weeklyData: $weeklyData, monthlyData: $monthlyData, dailyData: $dailyData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            (identical(other.selectedXIndex, selectedXIndex) ||
                other.selectedXIndex == selectedXIndex) &&
            (identical(other.goalScore, goalScore) ||
                other.goalScore == goalScore) &&
            (identical(other.weeklyIndex, weeklyIndex) ||
                other.weeklyIndex == weeklyIndex) &&
            (identical(other.monthlyIndex, monthlyIndex) ||
                other.monthlyIndex == monthlyIndex) &&
            (identical(other.selectedDayRange, selectedDayRange) ||
                other.selectedDayRange == selectedDayRange) &&
            (identical(other.weekOffset, weekOffset) ||
                other.weekOffset == weekOffset) &&
            (identical(other.monthOffset, monthOffset) ||
                other.monthOffset == monthOffset) &&
            (identical(other.dayRangeText, dayRangeText) ||
                other.dayRangeText == dayRangeText) &&
            const DeepCollectionEquality()
                .equals(other._totalData, _totalData) &&
            const DeepCollectionEquality()
                .equals(other._weeklyData, _weeklyData) &&
            const DeepCollectionEquality()
                .equals(other._monthlyData, _monthlyData) &&
            (identical(other.dailyData, dailyData) ||
                other.dailyData == dailyData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      tabIndex,
      selectedXIndex,
      goalScore,
      weeklyIndex,
      monthlyIndex,
      selectedDayRange,
      weekOffset,
      monthOffset,
      dayRangeText,
      const DeepCollectionEquality().hash(_totalData),
      const DeepCollectionEquality().hash(_weeklyData),
      const DeepCollectionEquality().hash(_monthlyData),
      dailyData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends DashboardAnalyticsState {
  factory _Create(
      {final bool isLoading,
      final int tabIndex,
      final int selectedXIndex,
      final int goalScore,
      final int weeklyIndex,
      final int monthlyIndex,
      final int selectedDayRange,
      final int weekOffset,
      final int monthOffset,
      final String dayRangeText,
      final List<BarData> totalData,
      final List<List<BarData>> weeklyData,
      final List<List<BarData>> monthlyData,
      final BarData? dailyData}) = _$_Create;
  _Create._() : super._();

  @override
  bool get isLoading;
  @override // データのローディングステータス
  int get tabIndex;
  @override //タブ
  int get selectedXIndex;
  @override
  int get goalScore;
  @override //毎日の目標
  int get weeklyIndex;
  @override //1週間の単位
  int get monthlyIndex;
  @override //1ヶ月の単位
  int get selectedDayRange;
  @override //
  int get weekOffset;
  @override //週の操作
  int get monthOffset;
  @override //今月・先月・来月
  String get dayRangeText;
  @override //タブ
  List<BarData> get totalData;
  @override //全部のスコア(3ヶ月)
  List<List<BarData>> get weeklyData;
  @override //1週間のスコア
  List<List<BarData>> get monthlyData;
  @override //1ヶ月のスコア
  BarData? get dailyData;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
