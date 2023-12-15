// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_dashboard_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeDashboardScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get tabIndex => throw _privateConstructorUsedError;
  PeriodType get selectedPeriodType => throw _privateConstructorUsedError;
  ChartType get selectedChartType => throw _privateConstructorUsedError;
  List<int> get valueX => throw _privateConstructorUsedError;
  int get valueY => throw _privateConstructorUsedError;
  List<DateTime> get days => throw _privateConstructorUsedError;
  String get unitY => throw _privateConstructorUsedError;

  ///Piriod
  List<Quiz> get periodQuizList => throw _privateConstructorUsedError;
  List<int> get periodDurationList => throw _privateConstructorUsedError;
  List<int> get periodQuizCountList => throw _privateConstructorUsedError;
  List<DateTime> get periodDays => throw _privateConstructorUsedError;
  int get periodDuration => throw _privateConstructorUsedError;
  int get periodQuizCount => throw _privateConstructorUsedError;
  int get periodQuizCorrectCount => throw _privateConstructorUsedError;

  ///期間
  DateTime? get startPeriodRange =>
      throw _privateConstructorUsedError; // 今週の月曜日の日付
  DateTime? get endPeriodRange =>
      throw _privateConstructorUsedError; // 今週の日曜日の日付
  int get weekOffset => throw _privateConstructorUsedError; //週の期間選択
  int get monthOffset => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeDashboardScreenStateCopyWith<HomeDashboardScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDashboardScreenStateCopyWith<$Res> {
  factory $HomeDashboardScreenStateCopyWith(HomeDashboardScreenState value,
          $Res Function(HomeDashboardScreenState) then) =
      _$HomeDashboardScreenStateCopyWithImpl<$Res, HomeDashboardScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      int tabIndex,
      PeriodType selectedPeriodType,
      ChartType selectedChartType,
      List<int> valueX,
      int valueY,
      List<DateTime> days,
      String unitY,
      List<Quiz> periodQuizList,
      List<int> periodDurationList,
      List<int> periodQuizCountList,
      List<DateTime> periodDays,
      int periodDuration,
      int periodQuizCount,
      int periodQuizCorrectCount,
      DateTime? startPeriodRange,
      DateTime? endPeriodRange,
      int weekOffset,
      int monthOffset});
}

/// @nodoc
class _$HomeDashboardScreenStateCopyWithImpl<$Res,
        $Val extends HomeDashboardScreenState>
    implements $HomeDashboardScreenStateCopyWith<$Res> {
  _$HomeDashboardScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? tabIndex = null,
    Object? selectedPeriodType = null,
    Object? selectedChartType = null,
    Object? valueX = null,
    Object? valueY = null,
    Object? days = null,
    Object? unitY = null,
    Object? periodQuizList = null,
    Object? periodDurationList = null,
    Object? periodQuizCountList = null,
    Object? periodDays = null,
    Object? periodDuration = null,
    Object? periodQuizCount = null,
    Object? periodQuizCorrectCount = null,
    Object? startPeriodRange = freezed,
    Object? endPeriodRange = freezed,
    Object? weekOffset = null,
    Object? monthOffset = null,
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
      selectedPeriodType: null == selectedPeriodType
          ? _value.selectedPeriodType
          : selectedPeriodType // ignore: cast_nullable_to_non_nullable
              as PeriodType,
      selectedChartType: null == selectedChartType
          ? _value.selectedChartType
          : selectedChartType // ignore: cast_nullable_to_non_nullable
              as ChartType,
      valueX: null == valueX
          ? _value.valueX
          : valueX // ignore: cast_nullable_to_non_nullable
              as List<int>,
      valueY: null == valueY
          ? _value.valueY
          : valueY // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      unitY: null == unitY
          ? _value.unitY
          : unitY // ignore: cast_nullable_to_non_nullable
              as String,
      periodQuizList: null == periodQuizList
          ? _value.periodQuizList
          : periodQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      periodDurationList: null == periodDurationList
          ? _value.periodDurationList
          : periodDurationList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      periodQuizCountList: null == periodQuizCountList
          ? _value.periodQuizCountList
          : periodQuizCountList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      periodDays: null == periodDays
          ? _value.periodDays
          : periodDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      periodDuration: null == periodDuration
          ? _value.periodDuration
          : periodDuration // ignore: cast_nullable_to_non_nullable
              as int,
      periodQuizCount: null == periodQuizCount
          ? _value.periodQuizCount
          : periodQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      periodQuizCorrectCount: null == periodQuizCorrectCount
          ? _value.periodQuizCorrectCount
          : periodQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      startPeriodRange: freezed == startPeriodRange
          ? _value.startPeriodRange
          : startPeriodRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPeriodRange: freezed == endPeriodRange
          ? _value.endPeriodRange
          : endPeriodRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$_CreateCopyWith<$Res>
    implements $HomeDashboardScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      int tabIndex,
      PeriodType selectedPeriodType,
      ChartType selectedChartType,
      List<int> valueX,
      int valueY,
      List<DateTime> days,
      String unitY,
      List<Quiz> periodQuizList,
      List<int> periodDurationList,
      List<int> periodQuizCountList,
      List<DateTime> periodDays,
      int periodDuration,
      int periodQuizCount,
      int periodQuizCorrectCount,
      DateTime? startPeriodRange,
      DateTime? endPeriodRange,
      int weekOffset,
      int monthOffset});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$HomeDashboardScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? tabIndex = null,
    Object? selectedPeriodType = null,
    Object? selectedChartType = null,
    Object? valueX = null,
    Object? valueY = null,
    Object? days = null,
    Object? unitY = null,
    Object? periodQuizList = null,
    Object? periodDurationList = null,
    Object? periodQuizCountList = null,
    Object? periodDays = null,
    Object? periodDuration = null,
    Object? periodQuizCount = null,
    Object? periodQuizCorrectCount = null,
    Object? startPeriodRange = freezed,
    Object? endPeriodRange = freezed,
    Object? weekOffset = null,
    Object? monthOffset = null,
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
      selectedPeriodType: null == selectedPeriodType
          ? _value.selectedPeriodType
          : selectedPeriodType // ignore: cast_nullable_to_non_nullable
              as PeriodType,
      selectedChartType: null == selectedChartType
          ? _value.selectedChartType
          : selectedChartType // ignore: cast_nullable_to_non_nullable
              as ChartType,
      valueX: null == valueX
          ? _value._valueX
          : valueX // ignore: cast_nullable_to_non_nullable
              as List<int>,
      valueY: null == valueY
          ? _value.valueY
          : valueY // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      unitY: null == unitY
          ? _value.unitY
          : unitY // ignore: cast_nullable_to_non_nullable
              as String,
      periodQuizList: null == periodQuizList
          ? _value._periodQuizList
          : periodQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      periodDurationList: null == periodDurationList
          ? _value._periodDurationList
          : periodDurationList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      periodQuizCountList: null == periodQuizCountList
          ? _value._periodQuizCountList
          : periodQuizCountList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      periodDays: null == periodDays
          ? _value._periodDays
          : periodDays // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      periodDuration: null == periodDuration
          ? _value.periodDuration
          : periodDuration // ignore: cast_nullable_to_non_nullable
              as int,
      periodQuizCount: null == periodQuizCount
          ? _value.periodQuizCount
          : periodQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      periodQuizCorrectCount: null == periodQuizCorrectCount
          ? _value.periodQuizCorrectCount
          : periodQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      startPeriodRange: freezed == startPeriodRange
          ? _value.startPeriodRange
          : startPeriodRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPeriodRange: freezed == endPeriodRange
          ? _value.endPeriodRange
          : endPeriodRange // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

class _$_Create extends _Create {
  _$_Create(
      {this.isLoading = false,
      this.tabIndex = 0,
      this.selectedPeriodType = PeriodType.weekly,
      this.selectedChartType = ChartType.quizCount,
      final List<int> valueX = const [],
      this.valueY = 0,
      final List<DateTime> days = const [],
      this.unitY = "",
      final List<Quiz> periodQuizList = const [],
      final List<int> periodDurationList = const [],
      final List<int> periodQuizCountList = const [],
      final List<DateTime> periodDays = const [],
      this.periodDuration = 0,
      this.periodQuizCount = 0,
      this.periodQuizCorrectCount = 0,
      this.startPeriodRange,
      this.endPeriodRange,
      this.weekOffset = 0,
      this.monthOffset = 0})
      : _valueX = valueX,
        _days = days,
        _periodQuizList = periodQuizList,
        _periodDurationList = periodDurationList,
        _periodQuizCountList = periodQuizCountList,
        _periodDays = periodDays,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int tabIndex;
  @override
  @JsonKey()
  final PeriodType selectedPeriodType;
  @override
  @JsonKey()
  final ChartType selectedChartType;
  final List<int> _valueX;
  @override
  @JsonKey()
  List<int> get valueX {
    if (_valueX is EqualUnmodifiableListView) return _valueX;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_valueX);
  }

  @override
  @JsonKey()
  final int valueY;
  final List<DateTime> _days;
  @override
  @JsonKey()
  List<DateTime> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  @JsonKey()
  final String unitY;

  ///Piriod
  final List<Quiz> _periodQuizList;

  ///Piriod
  @override
  @JsonKey()
  List<Quiz> get periodQuizList {
    if (_periodQuizList is EqualUnmodifiableListView) return _periodQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periodQuizList);
  }

  final List<int> _periodDurationList;
  @override
  @JsonKey()
  List<int> get periodDurationList {
    if (_periodDurationList is EqualUnmodifiableListView)
      return _periodDurationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periodDurationList);
  }

  final List<int> _periodQuizCountList;
  @override
  @JsonKey()
  List<int> get periodQuizCountList {
    if (_periodQuizCountList is EqualUnmodifiableListView)
      return _periodQuizCountList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periodQuizCountList);
  }

  final List<DateTime> _periodDays;
  @override
  @JsonKey()
  List<DateTime> get periodDays {
    if (_periodDays is EqualUnmodifiableListView) return _periodDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periodDays);
  }

  @override
  @JsonKey()
  final int periodDuration;
  @override
  @JsonKey()
  final int periodQuizCount;
  @override
  @JsonKey()
  final int periodQuizCorrectCount;

  ///期間
  @override
  final DateTime? startPeriodRange;
// 今週の月曜日の日付
  @override
  final DateTime? endPeriodRange;
// 今週の日曜日の日付
  @override
  @JsonKey()
  final int weekOffset;
//週の期間選択
  @override
  @JsonKey()
  final int monthOffset;

  @override
  String toString() {
    return 'HomeDashboardScreenState(isLoading: $isLoading, tabIndex: $tabIndex, selectedPeriodType: $selectedPeriodType, selectedChartType: $selectedChartType, valueX: $valueX, valueY: $valueY, days: $days, unitY: $unitY, periodQuizList: $periodQuizList, periodDurationList: $periodDurationList, periodQuizCountList: $periodQuizCountList, periodDays: $periodDays, periodDuration: $periodDuration, periodQuizCount: $periodQuizCount, periodQuizCorrectCount: $periodQuizCorrectCount, startPeriodRange: $startPeriodRange, endPeriodRange: $endPeriodRange, weekOffset: $weekOffset, monthOffset: $monthOffset)';
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
            (identical(other.selectedPeriodType, selectedPeriodType) ||
                other.selectedPeriodType == selectedPeriodType) &&
            (identical(other.selectedChartType, selectedChartType) ||
                other.selectedChartType == selectedChartType) &&
            const DeepCollectionEquality().equals(other._valueX, _valueX) &&
            (identical(other.valueY, valueY) || other.valueY == valueY) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.unitY, unitY) || other.unitY == unitY) &&
            const DeepCollectionEquality()
                .equals(other._periodQuizList, _periodQuizList) &&
            const DeepCollectionEquality()
                .equals(other._periodDurationList, _periodDurationList) &&
            const DeepCollectionEquality()
                .equals(other._periodQuizCountList, _periodQuizCountList) &&
            const DeepCollectionEquality()
                .equals(other._periodDays, _periodDays) &&
            (identical(other.periodDuration, periodDuration) ||
                other.periodDuration == periodDuration) &&
            (identical(other.periodQuizCount, periodQuizCount) ||
                other.periodQuizCount == periodQuizCount) &&
            (identical(other.periodQuizCorrectCount, periodQuizCorrectCount) ||
                other.periodQuizCorrectCount == periodQuizCorrectCount) &&
            (identical(other.startPeriodRange, startPeriodRange) ||
                other.startPeriodRange == startPeriodRange) &&
            (identical(other.endPeriodRange, endPeriodRange) ||
                other.endPeriodRange == endPeriodRange) &&
            (identical(other.weekOffset, weekOffset) ||
                other.weekOffset == weekOffset) &&
            (identical(other.monthOffset, monthOffset) ||
                other.monthOffset == monthOffset));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        tabIndex,
        selectedPeriodType,
        selectedChartType,
        const DeepCollectionEquality().hash(_valueX),
        valueY,
        const DeepCollectionEquality().hash(_days),
        unitY,
        const DeepCollectionEquality().hash(_periodQuizList),
        const DeepCollectionEquality().hash(_periodDurationList),
        const DeepCollectionEquality().hash(_periodQuizCountList),
        const DeepCollectionEquality().hash(_periodDays),
        periodDuration,
        periodQuizCount,
        periodQuizCorrectCount,
        startPeriodRange,
        endPeriodRange,
        weekOffset,
        monthOffset
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends HomeDashboardScreenState {
  factory _Create(
      {final bool isLoading,
      final int tabIndex,
      final PeriodType selectedPeriodType,
      final ChartType selectedChartType,
      final List<int> valueX,
      final int valueY,
      final List<DateTime> days,
      final String unitY,
      final List<Quiz> periodQuizList,
      final List<int> periodDurationList,
      final List<int> periodQuizCountList,
      final List<DateTime> periodDays,
      final int periodDuration,
      final int periodQuizCount,
      final int periodQuizCorrectCount,
      final DateTime? startPeriodRange,
      final DateTime? endPeriodRange,
      final int weekOffset,
      final int monthOffset}) = _$_Create;
  _Create._() : super._();

  @override
  bool get isLoading;
  @override
  int get tabIndex;
  @override
  PeriodType get selectedPeriodType;
  @override
  ChartType get selectedChartType;
  @override
  List<int> get valueX;
  @override
  int get valueY;
  @override
  List<DateTime> get days;
  @override
  String get unitY;
  @override

  ///Piriod
  List<Quiz> get periodQuizList;
  @override
  List<int> get periodDurationList;
  @override
  List<int> get periodQuizCountList;
  @override
  List<DateTime> get periodDays;
  @override
  int get periodDuration;
  @override
  int get periodQuizCount;
  @override
  int get periodQuizCorrectCount;
  @override

  ///期間
  DateTime? get startPeriodRange;
  @override // 今週の月曜日の日付
  DateTime? get endPeriodRange;
  @override // 今週の日曜日の日付
  int get weekOffset;
  @override //週の期間選択
  int get monthOffset;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
