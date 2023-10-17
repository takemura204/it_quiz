// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return _Dashboard.fromJson(json);
}

/// @nodoc
mixin _$Dashboard {
  List<Quiz> get totalQuizList => throw _privateConstructorUsedError;
  Duration get dailyDuration => throw _privateConstructorUsedError;
  Duration get allDuration => throw _privateConstructorUsedError;
  int get dailyQuizCount => throw _privateConstructorUsedError;
  int get allQuizCount => throw _privateConstructorUsedError;
  List<Quiz> get weeklyQuizList =>
      throw _privateConstructorUsedError; //今週のクイズ一覧
  DateTime? get startWeekRange =>
      throw _privateConstructorUsedError; // 今週の月曜日の日付
  DateTime? get endWeekRange => throw _privateConstructorUsedError; // 今週の日曜日の日付
  List<DateTime> get weekDays => throw _privateConstructorUsedError; //今週の日にち一覧
  List<int> get weeklyQuizCounts =>
      throw _privateConstructorUsedError; //今週のデータ一覧
  int get weeklyQuizTotal => throw _privateConstructorUsedError; //今週のデータ一覧
  int get selectedXIndex => throw _privateConstructorUsedError;
  int get weekOffset => throw _privateConstructorUsedError; //週の期間選択
  int get monthOffset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call(
      {List<Quiz> totalQuizList,
      Duration dailyDuration,
      Duration allDuration,
      int dailyQuizCount,
      int allQuizCount,
      List<Quiz> weeklyQuizList,
      DateTime? startWeekRange,
      DateTime? endWeekRange,
      List<DateTime> weekDays,
      List<int> weeklyQuizCounts,
      int weeklyQuizTotal,
      int selectedXIndex,
      int weekOffset,
      int monthOffset});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuizList = null,
    Object? dailyDuration = null,
    Object? allDuration = null,
    Object? dailyQuizCount = null,
    Object? allQuizCount = null,
    Object? weeklyQuizList = null,
    Object? startWeekRange = freezed,
    Object? endWeekRange = freezed,
    Object? weekDays = null,
    Object? weeklyQuizCounts = null,
    Object? weeklyQuizTotal = null,
    Object? selectedXIndex = null,
    Object? weekOffset = null,
    Object? monthOffset = null,
  }) {
    return _then(_value.copyWith(
      totalQuizList: null == totalQuizList
          ? _value.totalQuizList
          : totalQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      dailyDuration: null == dailyDuration
          ? _value.dailyDuration
          : dailyDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      allDuration: null == allDuration
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      dailyQuizCount: null == dailyQuizCount
          ? _value.dailyQuizCount
          : dailyQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      allQuizCount: null == allQuizCount
          ? _value.allQuizCount
          : allQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyQuizList: null == weeklyQuizList
          ? _value.weeklyQuizList
          : weeklyQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      startWeekRange: freezed == startWeekRange
          ? _value.startWeekRange
          : startWeekRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endWeekRange: freezed == endWeekRange
          ? _value.endWeekRange
          : endWeekRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weekDays: null == weekDays
          ? _value.weekDays
          : weekDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      weeklyQuizCounts: null == weeklyQuizCounts
          ? _value.weeklyQuizCounts
          : weeklyQuizCounts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weeklyQuizTotal: null == weeklyQuizTotal
          ? _value.weeklyQuizTotal
          : weeklyQuizTotal // ignore: cast_nullable_to_non_nullable
              as int,
      selectedXIndex: null == selectedXIndex
          ? _value.selectedXIndex
          : selectedXIndex // ignore: cast_nullable_to_non_nullable
              as int,
      weekOffset: null == weekOffset
          ? _value.weekOffset
          : weekOffset // ignore: cast_nullable_to_non_nullable
              as int,
      monthOffset: null == monthOffset
          ? _value.monthOffset
          : monthOffset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DashboardCopyWith<$Res> implements $DashboardCopyWith<$Res> {
  factory _$$_DashboardCopyWith(
          _$_Dashboard value, $Res Function(_$_Dashboard) then) =
      __$$_DashboardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Quiz> totalQuizList,
      Duration dailyDuration,
      Duration allDuration,
      int dailyQuizCount,
      int allQuizCount,
      List<Quiz> weeklyQuizList,
      DateTime? startWeekRange,
      DateTime? endWeekRange,
      List<DateTime> weekDays,
      List<int> weeklyQuizCounts,
      int weeklyQuizTotal,
      int selectedXIndex,
      int weekOffset,
      int monthOffset});
}

/// @nodoc
class __$$_DashboardCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$_Dashboard>
    implements _$$_DashboardCopyWith<$Res> {
  __$$_DashboardCopyWithImpl(
      _$_Dashboard _value, $Res Function(_$_Dashboard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuizList = null,
    Object? dailyDuration = null,
    Object? allDuration = null,
    Object? dailyQuizCount = null,
    Object? allQuizCount = null,
    Object? weeklyQuizList = null,
    Object? startWeekRange = freezed,
    Object? endWeekRange = freezed,
    Object? weekDays = null,
    Object? weeklyQuizCounts = null,
    Object? weeklyQuizTotal = null,
    Object? selectedXIndex = null,
    Object? weekOffset = null,
    Object? monthOffset = null,
  }) {
    return _then(_$_Dashboard(
      totalQuizList: null == totalQuizList
          ? _value._totalQuizList
          : totalQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      dailyDuration: null == dailyDuration
          ? _value.dailyDuration
          : dailyDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      allDuration: null == allDuration
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      dailyQuizCount: null == dailyQuizCount
          ? _value.dailyQuizCount
          : dailyQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      allQuizCount: null == allQuizCount
          ? _value.allQuizCount
          : allQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyQuizList: null == weeklyQuizList
          ? _value._weeklyQuizList
          : weeklyQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      startWeekRange: freezed == startWeekRange
          ? _value.startWeekRange
          : startWeekRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endWeekRange: freezed == endWeekRange
          ? _value.endWeekRange
          : endWeekRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weekDays: null == weekDays
          ? _value._weekDays
          : weekDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      weeklyQuizCounts: null == weeklyQuizCounts
          ? _value._weeklyQuizCounts
          : weeklyQuizCounts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      weeklyQuizTotal: null == weeklyQuizTotal
          ? _value.weeklyQuizTotal
          : weeklyQuizTotal // ignore: cast_nullable_to_non_nullable
              as int,
      selectedXIndex: null == selectedXIndex
          ? _value.selectedXIndex
          : selectedXIndex // ignore: cast_nullable_to_non_nullable
              as int,
      weekOffset: null == weekOffset
          ? _value.weekOffset
          : weekOffset // ignore: cast_nullable_to_non_nullable
              as int,
      monthOffset: null == monthOffset
          ? _value.monthOffset
          : monthOffset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dashboard extends _Dashboard {
  _$_Dashboard(
      {final List<Quiz> totalQuizList = const [],
      this.dailyDuration = Duration.zero,
      this.allDuration = Duration.zero,
      this.dailyQuizCount = 0,
      this.allQuizCount = 0,
      final List<Quiz> weeklyQuizList = const [],
      this.startWeekRange,
      this.endWeekRange,
      final List<DateTime> weekDays = const [],
      final List<int> weeklyQuizCounts = const [],
      this.weeklyQuizTotal = 0,
      this.selectedXIndex = -1,
      this.weekOffset = 0,
      this.monthOffset = 0})
      : _totalQuizList = totalQuizList,
        _weeklyQuizList = weeklyQuizList,
        _weekDays = weekDays,
        _weeklyQuizCounts = weeklyQuizCounts,
        super._();

  factory _$_Dashboard.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardFromJson(json);

  final List<Quiz> _totalQuizList;
  @override
  @JsonKey()
  List<Quiz> get totalQuizList {
    if (_totalQuizList is EqualUnmodifiableListView) return _totalQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalQuizList);
  }

  @override
  @JsonKey()
  final Duration dailyDuration;
  @override
  @JsonKey()
  final Duration allDuration;
  @override
  @JsonKey()
  final int dailyQuizCount;
  @override
  @JsonKey()
  final int allQuizCount;
  final List<Quiz> _weeklyQuizList;
  @override
  @JsonKey()
  List<Quiz> get weeklyQuizList {
    if (_weeklyQuizList is EqualUnmodifiableListView) return _weeklyQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyQuizList);
  }

//今週のクイズ一覧
  @override
  final DateTime? startWeekRange;
// 今週の月曜日の日付
  @override
  final DateTime? endWeekRange;
// 今週の日曜日の日付
  final List<DateTime> _weekDays;
// 今週の日曜日の日付
  @override
  @JsonKey()
  List<DateTime> get weekDays {
    if (_weekDays is EqualUnmodifiableListView) return _weekDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekDays);
  }

//今週の日にち一覧
  final List<int> _weeklyQuizCounts;
//今週の日にち一覧
  @override
  @JsonKey()
  List<int> get weeklyQuizCounts {
    if (_weeklyQuizCounts is EqualUnmodifiableListView)
      return _weeklyQuizCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyQuizCounts);
  }

//今週のデータ一覧
  @override
  @JsonKey()
  final int weeklyQuizTotal;
//今週のデータ一覧
  @override
  @JsonKey()
  final int selectedXIndex;
  @override
  @JsonKey()
  final int weekOffset;
//週の期間選択
  @override
  @JsonKey()
  final int monthOffset;

  @override
  String toString() {
    return 'Dashboard(totalQuizList: $totalQuizList, dailyDuration: $dailyDuration, allDuration: $allDuration, dailyQuizCount: $dailyQuizCount, allQuizCount: $allQuizCount, weeklyQuizList: $weeklyQuizList, startWeekRange: $startWeekRange, endWeekRange: $endWeekRange, weekDays: $weekDays, weeklyQuizCounts: $weeklyQuizCounts, weeklyQuizTotal: $weeklyQuizTotal, selectedXIndex: $selectedXIndex, weekOffset: $weekOffset, monthOffset: $monthOffset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dashboard &&
            const DeepCollectionEquality()
                .equals(other._totalQuizList, _totalQuizList) &&
            (identical(other.dailyDuration, dailyDuration) ||
                other.dailyDuration == dailyDuration) &&
            (identical(other.allDuration, allDuration) ||
                other.allDuration == allDuration) &&
            (identical(other.dailyQuizCount, dailyQuizCount) ||
                other.dailyQuizCount == dailyQuizCount) &&
            (identical(other.allQuizCount, allQuizCount) ||
                other.allQuizCount == allQuizCount) &&
            const DeepCollectionEquality()
                .equals(other._weeklyQuizList, _weeklyQuizList) &&
            (identical(other.startWeekRange, startWeekRange) ||
                other.startWeekRange == startWeekRange) &&
            (identical(other.endWeekRange, endWeekRange) ||
                other.endWeekRange == endWeekRange) &&
            const DeepCollectionEquality().equals(other._weekDays, _weekDays) &&
            const DeepCollectionEquality()
                .equals(other._weeklyQuizCounts, _weeklyQuizCounts) &&
            (identical(other.weeklyQuizTotal, weeklyQuizTotal) ||
                other.weeklyQuizTotal == weeklyQuizTotal) &&
            (identical(other.selectedXIndex, selectedXIndex) ||
                other.selectedXIndex == selectedXIndex) &&
            (identical(other.weekOffset, weekOffset) ||
                other.weekOffset == weekOffset) &&
            (identical(other.monthOffset, monthOffset) ||
                other.monthOffset == monthOffset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_totalQuizList),
      dailyDuration,
      allDuration,
      dailyQuizCount,
      allQuizCount,
      const DeepCollectionEquality().hash(_weeklyQuizList),
      startWeekRange,
      endWeekRange,
      const DeepCollectionEquality().hash(_weekDays),
      const DeepCollectionEquality().hash(_weeklyQuizCounts),
      weeklyQuizTotal,
      selectedXIndex,
      weekOffset,
      monthOffset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      __$$_DashboardCopyWithImpl<_$_Dashboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DashboardToJson(
      this,
    );
  }
}

abstract class _Dashboard extends Dashboard {
  factory _Dashboard(
      {final List<Quiz> totalQuizList,
      final Duration dailyDuration,
      final Duration allDuration,
      final int dailyQuizCount,
      final int allQuizCount,
      final List<Quiz> weeklyQuizList,
      final DateTime? startWeekRange,
      final DateTime? endWeekRange,
      final List<DateTime> weekDays,
      final List<int> weeklyQuizCounts,
      final int weeklyQuizTotal,
      final int selectedXIndex,
      final int weekOffset,
      final int monthOffset}) = _$_Dashboard;
  _Dashboard._() : super._();

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$_Dashboard.fromJson;

  @override
  List<Quiz> get totalQuizList;
  @override
  Duration get dailyDuration;
  @override
  Duration get allDuration;
  @override
  int get dailyQuizCount;
  @override
  int get allQuizCount;
  @override
  List<Quiz> get weeklyQuizList;
  @override //今週のクイズ一覧
  DateTime? get startWeekRange;
  @override // 今週の月曜日の日付
  DateTime? get endWeekRange;
  @override // 今週の日曜日の日付
  List<DateTime> get weekDays;
  @override //今週の日にち一覧
  List<int> get weeklyQuizCounts;
  @override //今週のデータ一覧
  int get weeklyQuizTotal;
  @override //今週のデータ一覧
  int get selectedXIndex;
  @override
  int get weekOffset;
  @override //週の期間選択
  int get monthOffset;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}
