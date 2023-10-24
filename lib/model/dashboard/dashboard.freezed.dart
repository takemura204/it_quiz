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
  ///Total
  List<Quiz> get totalQuizList => throw _privateConstructorUsedError;
  Duration get allDuration => throw _privateConstructorUsedError;
  int get allQuizCount => throw _privateConstructorUsedError;
  int get allQuizCorrectCount => throw _privateConstructorUsedError;
  int get runningDays => throw _privateConstructorUsedError;

  ///Daily
  Duration get dailyDuration => throw _privateConstructorUsedError;
  int get dailyQuizCount => throw _privateConstructorUsedError;
  int get dailyQuizCorrectCount => throw _privateConstructorUsedError;

  ///Weekly・Monthly
  List<Quiz> get periodQuizList =>
      throw _privateConstructorUsedError; //今週/今月のクイズ一覧
  DateTime? get startPeriodRange =>
      throw _privateConstructorUsedError; // 今週の月曜日の日付
  DateTime? get endPeriodRange =>
      throw _privateConstructorUsedError; // 今週の日曜日の日付
  List<DateTime> get periodDays =>
      throw _privateConstructorUsedError; //今週の「月/日」一覧
  List<int> get periodQuizCounts =>
      throw _privateConstructorUsedError; //今週の問題数一覧
  int get periodQuizTotal => throw _privateConstructorUsedError; //今週のデータ一覧
  List<int> get periodDuration => throw _privateConstructorUsedError; //今週の学習時間
  int get periodDurationTotal => throw _privateConstructorUsedError; //今週のデータ一覧
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
      Duration allDuration,
      int allQuizCount,
      int allQuizCorrectCount,
      int runningDays,
      Duration dailyDuration,
      int dailyQuizCount,
      int dailyQuizCorrectCount,
      List<Quiz> periodQuizList,
      DateTime? startPeriodRange,
      DateTime? endPeriodRange,
      List<DateTime> periodDays,
      List<int> periodQuizCounts,
      int periodQuizTotal,
      List<int> periodDuration,
      int periodDurationTotal,
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
    Object? allDuration = null,
    Object? allQuizCount = null,
    Object? allQuizCorrectCount = null,
    Object? runningDays = null,
    Object? dailyDuration = null,
    Object? dailyQuizCount = null,
    Object? dailyQuizCorrectCount = null,
    Object? periodQuizList = null,
    Object? startPeriodRange = freezed,
    Object? endPeriodRange = freezed,
    Object? periodDays = null,
    Object? periodQuizCounts = null,
    Object? periodQuizTotal = null,
    Object? periodDuration = null,
    Object? periodDurationTotal = null,
    Object? weekOffset = null,
    Object? monthOffset = null,
  }) {
    return _then(_value.copyWith(
      totalQuizList: null == totalQuizList
          ? _value.totalQuizList
          : totalQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      allDuration: null == allDuration
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      allQuizCount: null == allQuizCount
          ? _value.allQuizCount
          : allQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      allQuizCorrectCount: null == allQuizCorrectCount
          ? _value.allQuizCorrectCount
          : allQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      runningDays: null == runningDays
          ? _value.runningDays
          : runningDays // ignore: cast_nullable_to_non_nullable
              as int,
      dailyDuration: null == dailyDuration
          ? _value.dailyDuration
          : dailyDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      dailyQuizCount: null == dailyQuizCount
          ? _value.dailyQuizCount
          : dailyQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      dailyQuizCorrectCount: null == dailyQuizCorrectCount
          ? _value.dailyQuizCorrectCount
          : dailyQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      periodQuizList: null == periodQuizList
          ? _value.periodQuizList
          : periodQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      startPeriodRange: freezed == startPeriodRange
          ? _value.startPeriodRange
          : startPeriodRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPeriodRange: freezed == endPeriodRange
          ? _value.endPeriodRange
          : endPeriodRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      periodDays: null == periodDays
          ? _value.periodDays
          : periodDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      periodQuizCounts: null == periodQuizCounts
          ? _value.periodQuizCounts
          : periodQuizCounts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      periodQuizTotal: null == periodQuizTotal
          ? _value.periodQuizTotal
          : periodQuizTotal // ignore: cast_nullable_to_non_nullable
              as int,
      periodDuration: null == periodDuration
          ? _value.periodDuration
          : periodDuration // ignore: cast_nullable_to_non_nullable
              as List<int>,
      periodDurationTotal: null == periodDurationTotal
          ? _value.periodDurationTotal
          : periodDurationTotal // ignore: cast_nullable_to_non_nullable
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
      Duration allDuration,
      int allQuizCount,
      int allQuizCorrectCount,
      int runningDays,
      Duration dailyDuration,
      int dailyQuizCount,
      int dailyQuizCorrectCount,
      List<Quiz> periodQuizList,
      DateTime? startPeriodRange,
      DateTime? endPeriodRange,
      List<DateTime> periodDays,
      List<int> periodQuizCounts,
      int periodQuizTotal,
      List<int> periodDuration,
      int periodDurationTotal,
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
    Object? allDuration = null,
    Object? allQuizCount = null,
    Object? allQuizCorrectCount = null,
    Object? runningDays = null,
    Object? dailyDuration = null,
    Object? dailyQuizCount = null,
    Object? dailyQuizCorrectCount = null,
    Object? periodQuizList = null,
    Object? startPeriodRange = freezed,
    Object? endPeriodRange = freezed,
    Object? periodDays = null,
    Object? periodQuizCounts = null,
    Object? periodQuizTotal = null,
    Object? periodDuration = null,
    Object? periodDurationTotal = null,
    Object? weekOffset = null,
    Object? monthOffset = null,
  }) {
    return _then(_$_Dashboard(
      totalQuizList: null == totalQuizList
          ? _value._totalQuizList
          : totalQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      allDuration: null == allDuration
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      allQuizCount: null == allQuizCount
          ? _value.allQuizCount
          : allQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      allQuizCorrectCount: null == allQuizCorrectCount
          ? _value.allQuizCorrectCount
          : allQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      runningDays: null == runningDays
          ? _value.runningDays
          : runningDays // ignore: cast_nullable_to_non_nullable
              as int,
      dailyDuration: null == dailyDuration
          ? _value.dailyDuration
          : dailyDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      dailyQuizCount: null == dailyQuizCount
          ? _value.dailyQuizCount
          : dailyQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      dailyQuizCorrectCount: null == dailyQuizCorrectCount
          ? _value.dailyQuizCorrectCount
          : dailyQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      periodQuizList: null == periodQuizList
          ? _value._periodQuizList
          : periodQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      startPeriodRange: freezed == startPeriodRange
          ? _value.startPeriodRange
          : startPeriodRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPeriodRange: freezed == endPeriodRange
          ? _value.endPeriodRange
          : endPeriodRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      periodDays: null == periodDays
          ? _value._periodDays
          : periodDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      periodQuizCounts: null == periodQuizCounts
          ? _value._periodQuizCounts
          : periodQuizCounts // ignore: cast_nullable_to_non_nullable
              as List<int>,
      periodQuizTotal: null == periodQuizTotal
          ? _value.periodQuizTotal
          : periodQuizTotal // ignore: cast_nullable_to_non_nullable
              as int,
      periodDuration: null == periodDuration
          ? _value._periodDuration
          : periodDuration // ignore: cast_nullable_to_non_nullable
              as List<int>,
      periodDurationTotal: null == periodDurationTotal
          ? _value.periodDurationTotal
          : periodDurationTotal // ignore: cast_nullable_to_non_nullable
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
      this.allDuration = Duration.zero,
      this.allQuizCount = 0,
      this.allQuizCorrectCount = 0,
      this.runningDays = 0,
      this.dailyDuration = Duration.zero,
      this.dailyQuizCount = 0,
      this.dailyQuizCorrectCount = 0,
      final List<Quiz> periodQuizList = const [],
      this.startPeriodRange,
      this.endPeriodRange,
      final List<DateTime> periodDays = const [],
      final List<int> periodQuizCounts = const [],
      this.periodQuizTotal = 0,
      final List<int> periodDuration = const [],
      this.periodDurationTotal = 0,
      this.weekOffset = 0,
      this.monthOffset = 0})
      : _totalQuizList = totalQuizList,
        _periodQuizList = periodQuizList,
        _periodDays = periodDays,
        _periodQuizCounts = periodQuizCounts,
        _periodDuration = periodDuration,
        super._();

  factory _$_Dashboard.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardFromJson(json);

  ///Total
  final List<Quiz> _totalQuizList;

  ///Total
  @override
  @JsonKey()
  List<Quiz> get totalQuizList {
    if (_totalQuizList is EqualUnmodifiableListView) return _totalQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalQuizList);
  }

  @override
  @JsonKey()
  final Duration allDuration;
  @override
  @JsonKey()
  final int allQuizCount;
  @override
  @JsonKey()
  final int allQuizCorrectCount;
  @override
  @JsonKey()
  final int runningDays;

  ///Daily
  @override
  @JsonKey()
  final Duration dailyDuration;
  @override
  @JsonKey()
  final int dailyQuizCount;
  @override
  @JsonKey()
  final int dailyQuizCorrectCount;

  ///Weekly・Monthly
  final List<Quiz> _periodQuizList;

  ///Weekly・Monthly
  @override
  @JsonKey()
  List<Quiz> get periodQuizList {
    if (_periodQuizList is EqualUnmodifiableListView) return _periodQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periodQuizList);
  }

//今週/今月のクイズ一覧
  @override
  final DateTime? startPeriodRange;
// 今週の月曜日の日付
  @override
  final DateTime? endPeriodRange;
// 今週の日曜日の日付
  final List<DateTime> _periodDays;
// 今週の日曜日の日付
  @override
  @JsonKey()
  List<DateTime> get periodDays {
    if (_periodDays is EqualUnmodifiableListView) return _periodDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periodDays);
  }

//今週の「月/日」一覧
  final List<int> _periodQuizCounts;
//今週の「月/日」一覧
  @override
  @JsonKey()
  List<int> get periodQuizCounts {
    if (_periodQuizCounts is EqualUnmodifiableListView)
      return _periodQuizCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periodQuizCounts);
  }

//今週の問題数一覧
  @override
  @JsonKey()
  final int periodQuizTotal;
//今週のデータ一覧
  final List<int> _periodDuration;
//今週のデータ一覧
  @override
  @JsonKey()
  List<int> get periodDuration {
    if (_periodDuration is EqualUnmodifiableListView) return _periodDuration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periodDuration);
  }

//今週の学習時間
  @override
  @JsonKey()
  final int periodDurationTotal;
//今週のデータ一覧
  @override
  @JsonKey()
  final int weekOffset;
//週の期間選択
  @override
  @JsonKey()
  final int monthOffset;

  @override
  String toString() {
    return 'Dashboard(totalQuizList: $totalQuizList, allDuration: $allDuration, allQuizCount: $allQuizCount, allQuizCorrectCount: $allQuizCorrectCount, runningDays: $runningDays, dailyDuration: $dailyDuration, dailyQuizCount: $dailyQuizCount, dailyQuizCorrectCount: $dailyQuizCorrectCount, periodQuizList: $periodQuizList, startPeriodRange: $startPeriodRange, endPeriodRange: $endPeriodRange, periodDays: $periodDays, periodQuizCounts: $periodQuizCounts, periodQuizTotal: $periodQuizTotal, periodDuration: $periodDuration, periodDurationTotal: $periodDurationTotal, weekOffset: $weekOffset, monthOffset: $monthOffset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dashboard &&
            const DeepCollectionEquality()
                .equals(other._totalQuizList, _totalQuizList) &&
            (identical(other.allDuration, allDuration) ||
                other.allDuration == allDuration) &&
            (identical(other.allQuizCount, allQuizCount) ||
                other.allQuizCount == allQuizCount) &&
            (identical(other.allQuizCorrectCount, allQuizCorrectCount) ||
                other.allQuizCorrectCount == allQuizCorrectCount) &&
            (identical(other.runningDays, runningDays) ||
                other.runningDays == runningDays) &&
            (identical(other.dailyDuration, dailyDuration) ||
                other.dailyDuration == dailyDuration) &&
            (identical(other.dailyQuizCount, dailyQuizCount) ||
                other.dailyQuizCount == dailyQuizCount) &&
            (identical(other.dailyQuizCorrectCount, dailyQuizCorrectCount) ||
                other.dailyQuizCorrectCount == dailyQuizCorrectCount) &&
            const DeepCollectionEquality()
                .equals(other._periodQuizList, _periodQuizList) &&
            (identical(other.startPeriodRange, startPeriodRange) ||
                other.startPeriodRange == startPeriodRange) &&
            (identical(other.endPeriodRange, endPeriodRange) ||
                other.endPeriodRange == endPeriodRange) &&
            const DeepCollectionEquality()
                .equals(other._periodDays, _periodDays) &&
            const DeepCollectionEquality()
                .equals(other._periodQuizCounts, _periodQuizCounts) &&
            (identical(other.periodQuizTotal, periodQuizTotal) ||
                other.periodQuizTotal == periodQuizTotal) &&
            const DeepCollectionEquality()
                .equals(other._periodDuration, _periodDuration) &&
            (identical(other.periodDurationTotal, periodDurationTotal) ||
                other.periodDurationTotal == periodDurationTotal) &&
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
      allDuration,
      allQuizCount,
      allQuizCorrectCount,
      runningDays,
      dailyDuration,
      dailyQuizCount,
      dailyQuizCorrectCount,
      const DeepCollectionEquality().hash(_periodQuizList),
      startPeriodRange,
      endPeriodRange,
      const DeepCollectionEquality().hash(_periodDays),
      const DeepCollectionEquality().hash(_periodQuizCounts),
      periodQuizTotal,
      const DeepCollectionEquality().hash(_periodDuration),
      periodDurationTotal,
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
      final Duration allDuration,
      final int allQuizCount,
      final int allQuizCorrectCount,
      final int runningDays,
      final Duration dailyDuration,
      final int dailyQuizCount,
      final int dailyQuizCorrectCount,
      final List<Quiz> periodQuizList,
      final DateTime? startPeriodRange,
      final DateTime? endPeriodRange,
      final List<DateTime> periodDays,
      final List<int> periodQuizCounts,
      final int periodQuizTotal,
      final List<int> periodDuration,
      final int periodDurationTotal,
      final int weekOffset,
      final int monthOffset}) = _$_Dashboard;
  _Dashboard._() : super._();

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$_Dashboard.fromJson;

  @override

  ///Total
  List<Quiz> get totalQuizList;
  @override
  Duration get allDuration;
  @override
  int get allQuizCount;
  @override
  int get allQuizCorrectCount;
  @override
  int get runningDays;
  @override

  ///Daily
  Duration get dailyDuration;
  @override
  int get dailyQuizCount;
  @override
  int get dailyQuizCorrectCount;
  @override

  ///Weekly・Monthly
  List<Quiz> get periodQuizList;
  @override //今週/今月のクイズ一覧
  DateTime? get startPeriodRange;
  @override // 今週の月曜日の日付
  DateTime? get endPeriodRange;
  @override // 今週の日曜日の日付
  List<DateTime> get periodDays;
  @override //今週の「月/日」一覧
  List<int> get periodQuizCounts;
  @override //今週の問題数一覧
  int get periodQuizTotal;
  @override //今週のデータ一覧
  List<int> get periodDuration;
  @override //今週の学習時間
  int get periodDurationTotal;
  @override //今週のデータ一覧
  int get weekOffset;
  @override //週の期間選択
  int get monthOffset;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}
