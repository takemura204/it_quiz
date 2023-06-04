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
  int get rankIndex => throw _privateConstructorUsedError; //ランク階級
  int get point => throw _privateConstructorUsedError;

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
  $Res call({int rankIndex, int point});
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
    Object? rankIndex = null,
    Object? point = null,
  }) {
    return _then(_value.copyWith(
      rankIndex: null == rankIndex
          ? _value.rankIndex
          : rankIndex // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $DashboardRankStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rankIndex, int point});
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
    Object? rankIndex = null,
    Object? point = null,
  }) {
    return _then(_$_Create(
      rankIndex: null == rankIndex
          ? _value.rankIndex
          : rankIndex // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create({this.rankIndex = 0, this.point = 0}) : super._();

  @override
  @JsonKey()
  final int rankIndex;
//ランク階級
  @override
  @JsonKey()
  final int point;

  @override
  String toString() {
    return 'DashboardRankState(rankIndex: $rankIndex, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.rankIndex, rankIndex) ||
                other.rankIndex == rankIndex) &&
            (identical(other.point, point) || other.point == point));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rankIndex, point);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends DashboardRankState {
  factory _Create({final int rankIndex, final int point}) = _$_Create;
  _Create._() : super._();

  @override
  int get rankIndex;
  @override //ランク階級
  int get point;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
