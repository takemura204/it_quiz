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
  List<String> get tabNames => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  int get goalY => throw _privateConstructorUsedError;
  int get dayScore => throw _privateConstructorUsedError;

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
      {List<String> tabNames, int selectedIndex, int goalY, int dayScore});
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
    Object? tabNames = null,
    Object? selectedIndex = null,
    Object? goalY = null,
    Object? dayScore = null,
  }) {
    return _then(_value.copyWith(
      tabNames: null == tabNames
          ? _value.tabNames
          : tabNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      goalY: null == goalY
          ? _value.goalY
          : goalY // ignore: cast_nullable_to_non_nullable
              as int,
      dayScore: null == dayScore
          ? _value.dayScore
          : dayScore // ignore: cast_nullable_to_non_nullable
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
      {List<String> tabNames, int selectedIndex, int goalY, int dayScore});
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
    Object? tabNames = null,
    Object? selectedIndex = null,
    Object? goalY = null,
    Object? dayScore = null,
  }) {
    return _then(_$_Create(
      tabNames: null == tabNames
          ? _value._tabNames
          : tabNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      goalY: null == goalY
          ? _value.goalY
          : goalY // ignore: cast_nullable_to_non_nullable
              as int,
      dayScore: null == dayScore
          ? _value.dayScore
          : dayScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  const _$_Create(
      {final List<String> tabNames = const [],
      this.selectedIndex = -1,
      this.goalY = 10,
      this.dayScore = 0})
      : _tabNames = tabNames,
        super._();

  final List<String> _tabNames;
  @override
  @JsonKey()
  List<String> get tabNames {
    if (_tabNames is EqualUnmodifiableListView) return _tabNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabNames);
  }

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  @JsonKey()
  final int goalY;
  @override
  @JsonKey()
  final int dayScore;

  @override
  String toString() {
    return 'HomeDashboardScreenState(tabNames: $tabNames, selectedIndex: $selectedIndex, goalY: $goalY, dayScore: $dayScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            const DeepCollectionEquality().equals(other._tabNames, _tabNames) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.goalY, goalY) || other.goalY == goalY) &&
            (identical(other.dayScore, dayScore) ||
                other.dayScore == dayScore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tabNames),
      selectedIndex,
      goalY,
      dayScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends HomeDashboardScreenState {
  const factory _Create(
      {final List<String> tabNames,
      final int selectedIndex,
      final int goalY,
      final int dayScore}) = _$_Create;
  const _Create._() : super._();

  @override
  List<String> get tabNames;
  @override
  int get selectedIndex;
  @override
  int get goalY;
  @override
  int get dayScore;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
