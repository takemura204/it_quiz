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
  List<Quiz> get quizList => throw _privateConstructorUsedError; //クイズ一覧
  Duration get todayDuration => throw _privateConstructorUsedError;
  Duration get allDuration => throw _privateConstructorUsedError;
  int get todayQuizCount => throw _privateConstructorUsedError;
  int get allQuizCount => throw _privateConstructorUsedError;

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
      {List<Quiz> quizList,
      Duration todayDuration,
      Duration allDuration,
      int todayQuizCount,
      int allQuizCount});
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
    Object? quizList = null,
    Object? todayDuration = null,
    Object? allDuration = null,
    Object? todayQuizCount = null,
    Object? allQuizCount = null,
  }) {
    return _then(_value.copyWith(
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      todayDuration: null == todayDuration
          ? _value.todayDuration
          : todayDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      allDuration: null == allDuration
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      todayQuizCount: null == todayQuizCount
          ? _value.todayQuizCount
          : todayQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      allQuizCount: null == allQuizCount
          ? _value.allQuizCount
          : allQuizCount // ignore: cast_nullable_to_non_nullable
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
      {List<Quiz> quizList,
      Duration todayDuration,
      Duration allDuration,
      int todayQuizCount,
      int allQuizCount});
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
    Object? quizList = null,
    Object? todayDuration = null,
    Object? allDuration = null,
    Object? todayQuizCount = null,
    Object? allQuizCount = null,
  }) {
    return _then(_$_Dashboard(
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      todayDuration: null == todayDuration
          ? _value.todayDuration
          : todayDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      allDuration: null == allDuration
          ? _value.allDuration
          : allDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      todayQuizCount: null == todayQuizCount
          ? _value.todayQuizCount
          : todayQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
      allQuizCount: null == allQuizCount
          ? _value.allQuizCount
          : allQuizCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dashboard extends _Dashboard {
  _$_Dashboard(
      {final List<Quiz> quizList = const [],
      this.todayDuration = Duration.zero,
      this.allDuration = Duration.zero,
      this.todayQuizCount = 0,
      this.allQuizCount = 0})
      : _quizList = quizList,
        super._();

  factory _$_Dashboard.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardFromJson(json);

  final List<Quiz> _quizList;
  @override
  @JsonKey()
  List<Quiz> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

//クイズ一覧
  @override
  @JsonKey()
  final Duration todayDuration;
  @override
  @JsonKey()
  final Duration allDuration;
  @override
  @JsonKey()
  final int todayQuizCount;
  @override
  @JsonKey()
  final int allQuizCount;

  @override
  String toString() {
    return 'Dashboard(quizList: $quizList, todayDuration: $todayDuration, allDuration: $allDuration, todayQuizCount: $todayQuizCount, allQuizCount: $allQuizCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dashboard &&
            const DeepCollectionEquality().equals(other._quizList, _quizList) &&
            (identical(other.todayDuration, todayDuration) ||
                other.todayDuration == todayDuration) &&
            (identical(other.allDuration, allDuration) ||
                other.allDuration == allDuration) &&
            (identical(other.todayQuizCount, todayQuizCount) ||
                other.todayQuizCount == todayQuizCount) &&
            (identical(other.allQuizCount, allQuizCount) ||
                other.allQuizCount == allQuizCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_quizList),
      todayDuration,
      allDuration,
      todayQuizCount,
      allQuizCount);

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
      {final List<Quiz> quizList,
      final Duration todayDuration,
      final Duration allDuration,
      final int todayQuizCount,
      final int allQuizCount}) = _$_Dashboard;
  _Dashboard._() : super._();

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$_Dashboard.fromJson;

  @override
  List<Quiz> get quizList;
  @override //クイズ一覧
  Duration get todayDuration;
  @override
  Duration get allDuration;
  @override
  int get todayQuizCount;
  @override
  int get allQuizCount;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardCopyWith<_$_Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}
