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
  bool get isLoading => throw _privateConstructorUsedError;

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

  ///Weekly
  Duration get weeklyDuration => throw _privateConstructorUsedError;
  int get weeklyQuizCount => throw _privateConstructorUsedError;
  int get weeklyQuizCorrectCount => throw _privateConstructorUsedError;

  ///Monthly
  Duration get monthlyDuration => throw _privateConstructorUsedError;
  int get monthlyQuizCount => throw _privateConstructorUsedError;
  int get monthlyQuizCorrectCount => throw _privateConstructorUsedError;

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
      {bool isLoading,
      List<Quiz> totalQuizList,
      Duration allDuration,
      int allQuizCount,
      int allQuizCorrectCount,
      int runningDays,
      Duration dailyDuration,
      int dailyQuizCount,
      int dailyQuizCorrectCount,
      Duration weeklyDuration,
      int weeklyQuizCount,
      int weeklyQuizCorrectCount,
      Duration monthlyDuration,
      int monthlyQuizCount,
      int monthlyQuizCorrectCount});
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
    Object? isLoading = null,
    Object? totalQuizList = null,
    Object? allDuration = null,
    Object? allQuizCount = null,
    Object? allQuizCorrectCount = null,
    Object? runningDays = null,
    Object? dailyDuration = null,
    Object? dailyQuizCount = null,
    Object? dailyQuizCorrectCount = null,
    Object? weeklyDuration = null,
    Object? weeklyQuizCount = null,
    Object? weeklyQuizCorrectCount = null,
    Object? monthlyDuration = null,
    Object? monthlyQuizCount = null,
    Object? monthlyQuizCorrectCount = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
      weeklyDuration: null == weeklyDuration
          ? _value.weeklyDuration
          : weeklyDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      weeklyQuizCount: null == weeklyQuizCount
          ? _value.weeklyQuizCount
          : weeklyQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyQuizCorrectCount: null == weeklyQuizCorrectCount
          ? _value.weeklyQuizCorrectCount
          : weeklyQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyDuration: null == monthlyDuration
          ? _value.monthlyDuration
          : monthlyDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      monthlyQuizCount: null == monthlyQuizCount
          ? _value.monthlyQuizCount
          : monthlyQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyQuizCorrectCount: null == monthlyQuizCorrectCount
          ? _value.monthlyQuizCorrectCount
          : monthlyQuizCorrectCount // ignore: cast_nullable_to_non_nullable
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
      {bool isLoading,
      List<Quiz> totalQuizList,
      Duration allDuration,
      int allQuizCount,
      int allQuizCorrectCount,
      int runningDays,
      Duration dailyDuration,
      int dailyQuizCount,
      int dailyQuizCorrectCount,
      Duration weeklyDuration,
      int weeklyQuizCount,
      int weeklyQuizCorrectCount,
      Duration monthlyDuration,
      int monthlyQuizCount,
      int monthlyQuizCorrectCount});
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
    Object? isLoading = null,
    Object? totalQuizList = null,
    Object? allDuration = null,
    Object? allQuizCount = null,
    Object? allQuizCorrectCount = null,
    Object? runningDays = null,
    Object? dailyDuration = null,
    Object? dailyQuizCount = null,
    Object? dailyQuizCorrectCount = null,
    Object? weeklyDuration = null,
    Object? weeklyQuizCount = null,
    Object? weeklyQuizCorrectCount = null,
    Object? monthlyDuration = null,
    Object? monthlyQuizCount = null,
    Object? monthlyQuizCorrectCount = null,
  }) {
    return _then(_$_Dashboard(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
      weeklyDuration: null == weeklyDuration
          ? _value.weeklyDuration
          : weeklyDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      weeklyQuizCount: null == weeklyQuizCount
          ? _value.weeklyQuizCount
          : weeklyQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyQuizCorrectCount: null == weeklyQuizCorrectCount
          ? _value.weeklyQuizCorrectCount
          : weeklyQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyDuration: null == monthlyDuration
          ? _value.monthlyDuration
          : monthlyDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      monthlyQuizCount: null == monthlyQuizCount
          ? _value.monthlyQuizCount
          : monthlyQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyQuizCorrectCount: null == monthlyQuizCorrectCount
          ? _value.monthlyQuizCorrectCount
          : monthlyQuizCorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dashboard extends _Dashboard {
  _$_Dashboard(
      {this.isLoading = false,
      final List<Quiz> totalQuizList = const [],
      this.allDuration = Duration.zero,
      this.allQuizCount = 0,
      this.allQuizCorrectCount = 0,
      this.runningDays = 0,
      this.dailyDuration = Duration.zero,
      this.dailyQuizCount = 0,
      this.dailyQuizCorrectCount = 0,
      this.weeklyDuration = Duration.zero,
      this.weeklyQuizCount = 0,
      this.weeklyQuizCorrectCount = 0,
      this.monthlyDuration = Duration.zero,
      this.monthlyQuizCount = 0,
      this.monthlyQuizCorrectCount = 0})
      : _totalQuizList = totalQuizList,
        super._();

  factory _$_Dashboard.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;

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

  ///Weekly
  @override
  @JsonKey()
  final Duration weeklyDuration;
  @override
  @JsonKey()
  final int weeklyQuizCount;
  @override
  @JsonKey()
  final int weeklyQuizCorrectCount;

  ///Monthly
  @override
  @JsonKey()
  final Duration monthlyDuration;
  @override
  @JsonKey()
  final int monthlyQuizCount;
  @override
  @JsonKey()
  final int monthlyQuizCorrectCount;

  @override
  String toString() {
    return 'Dashboard(isLoading: $isLoading, totalQuizList: $totalQuizList, allDuration: $allDuration, allQuizCount: $allQuizCount, allQuizCorrectCount: $allQuizCorrectCount, runningDays: $runningDays, dailyDuration: $dailyDuration, dailyQuizCount: $dailyQuizCount, dailyQuizCorrectCount: $dailyQuizCorrectCount, weeklyDuration: $weeklyDuration, weeklyQuizCount: $weeklyQuizCount, weeklyQuizCorrectCount: $weeklyQuizCorrectCount, monthlyDuration: $monthlyDuration, monthlyQuizCount: $monthlyQuizCount, monthlyQuizCorrectCount: $monthlyQuizCorrectCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dashboard &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
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
            (identical(other.weeklyDuration, weeklyDuration) ||
                other.weeklyDuration == weeklyDuration) &&
            (identical(other.weeklyQuizCount, weeklyQuizCount) ||
                other.weeklyQuizCount == weeklyQuizCount) &&
            (identical(other.weeklyQuizCorrectCount, weeklyQuizCorrectCount) ||
                other.weeklyQuizCorrectCount == weeklyQuizCorrectCount) &&
            (identical(other.monthlyDuration, monthlyDuration) ||
                other.monthlyDuration == monthlyDuration) &&
            (identical(other.monthlyQuizCount, monthlyQuizCount) ||
                other.monthlyQuizCount == monthlyQuizCount) &&
            (identical(
                    other.monthlyQuizCorrectCount, monthlyQuizCorrectCount) ||
                other.monthlyQuizCorrectCount == monthlyQuizCorrectCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_totalQuizList),
      allDuration,
      allQuizCount,
      allQuizCorrectCount,
      runningDays,
      dailyDuration,
      dailyQuizCount,
      dailyQuizCorrectCount,
      weeklyDuration,
      weeklyQuizCount,
      weeklyQuizCorrectCount,
      monthlyDuration,
      monthlyQuizCount,
      monthlyQuizCorrectCount);

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
      {final bool isLoading,
      final List<Quiz> totalQuizList,
      final Duration allDuration,
      final int allQuizCount,
      final int allQuizCorrectCount,
      final int runningDays,
      final Duration dailyDuration,
      final int dailyQuizCount,
      final int dailyQuizCorrectCount,
      final Duration weeklyDuration,
      final int weeklyQuizCount,
      final int weeklyQuizCorrectCount,
      final Duration monthlyDuration,
      final int monthlyQuizCount,
      final int monthlyQuizCorrectCount}) = _$_Dashboard;
  _Dashboard._() : super._();

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$_Dashboard.fromJson;

  @override
  bool get isLoading;
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

  ///Weekly
  Duration get weeklyDuration;
  @override
  int get weeklyQuizCount;
  @override
  int get weeklyQuizCorrectCount;
  @override

  ///Monthly
  Duration get monthlyDuration;
  @override
  int get monthlyQuizCount;
  @override
  int get monthlyQuizCorrectCount;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}
