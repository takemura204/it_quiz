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
  int get selectedXIndex => throw _privateConstructorUsedError;
  PeriodType get selectedPeriodType => throw _privateConstructorUsedError;
  ChartType get selectedChartType => throw _privateConstructorUsedError;
  List<int> get valueX => throw _privateConstructorUsedError;
  int get valueY => throw _privateConstructorUsedError;
  List<DateTime> get days => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

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
      int selectedXIndex,
      PeriodType selectedPeriodType,
      ChartType selectedChartType,
      List<int> valueX,
      int valueY,
      List<DateTime> days,
      String unit});
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
    Object? selectedXIndex = null,
    Object? selectedPeriodType = null,
    Object? selectedChartType = null,
    Object? valueX = null,
    Object? valueY = null,
    Object? days = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedXIndex: null == selectedXIndex
          ? _value.selectedXIndex
          : selectedXIndex // ignore: cast_nullable_to_non_nullable
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
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
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
      int selectedXIndex,
      PeriodType selectedPeriodType,
      ChartType selectedChartType,
      List<int> valueX,
      int valueY,
      List<DateTime> days,
      String unit});
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
    Object? selectedXIndex = null,
    Object? selectedPeriodType = null,
    Object? selectedChartType = null,
    Object? valueX = null,
    Object? valueY = null,
    Object? days = null,
    Object? unit = null,
  }) {
    return _then(_$_Create(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedXIndex: null == selectedXIndex
          ? _value.selectedXIndex
          : selectedXIndex // ignore: cast_nullable_to_non_nullable
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
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create(
      {this.isLoading = false,
      this.selectedXIndex = -1,
      this.selectedPeriodType = PeriodType.weekly,
      this.selectedChartType = ChartType.quizCount,
      final List<int> valueX = const [],
      this.valueY = 0,
      final List<DateTime> days = const [],
      this.unit = ""})
      : _valueX = valueX,
        _days = days,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int selectedXIndex;
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
  final String unit;

  @override
  String toString() {
    return 'HomeDashboardScreenState(isLoading: $isLoading, selectedXIndex: $selectedXIndex, selectedPeriodType: $selectedPeriodType, selectedChartType: $selectedChartType, valueX: $valueX, valueY: $valueY, days: $days, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedXIndex, selectedXIndex) ||
                other.selectedXIndex == selectedXIndex) &&
            (identical(other.selectedPeriodType, selectedPeriodType) ||
                other.selectedPeriodType == selectedPeriodType) &&
            (identical(other.selectedChartType, selectedChartType) ||
                other.selectedChartType == selectedChartType) &&
            const DeepCollectionEquality().equals(other._valueX, _valueX) &&
            (identical(other.valueY, valueY) || other.valueY == valueY) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      selectedXIndex,
      selectedPeriodType,
      selectedChartType,
      const DeepCollectionEquality().hash(_valueX),
      valueY,
      const DeepCollectionEquality().hash(_days),
      unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends HomeDashboardScreenState {
  factory _Create(
      {final bool isLoading,
      final int selectedXIndex,
      final PeriodType selectedPeriodType,
      final ChartType selectedChartType,
      final List<int> valueX,
      final int valueY,
      final List<DateTime> days,
      final String unit}) = _$_Create;
  _Create._() : super._();

  @override
  bool get isLoading;
  @override
  int get selectedXIndex;
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
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
