// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'missions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Missions {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Mission> get missions => throw _privateConstructorUsedError;
  int get mission1Index => throw _privateConstructorUsedError;
  int get mission2Index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MissionsCopyWith<Missions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionsCopyWith<$Res> {
  factory $MissionsCopyWith(Missions value, $Res Function(Missions) then) =
      _$MissionsCopyWithImpl<$Res, Missions>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Mission> missions,
      int mission1Index,
      int mission2Index});
}

/// @nodoc
class _$MissionsCopyWithImpl<$Res, $Val extends Missions>
    implements $MissionsCopyWith<$Res> {
  _$MissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? missions = null,
    Object? mission1Index = null,
    Object? mission2Index = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      missions: null == missions
          ? _value.missions
          : missions // ignore: cast_nullable_to_non_nullable
              as List<Mission>,
      mission1Index: null == mission1Index
          ? _value.mission1Index
          : mission1Index // ignore: cast_nullable_to_non_nullable
              as int,
      mission2Index: null == mission2Index
          ? _value.mission2Index
          : mission2Index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MissionsCopyWith<$Res> implements $MissionsCopyWith<$Res> {
  factory _$$_MissionsCopyWith(
          _$_Missions value, $Res Function(_$_Missions) then) =
      __$$_MissionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Mission> missions,
      int mission1Index,
      int mission2Index});
}

/// @nodoc
class __$$_MissionsCopyWithImpl<$Res>
    extends _$MissionsCopyWithImpl<$Res, _$_Missions>
    implements _$$_MissionsCopyWith<$Res> {
  __$$_MissionsCopyWithImpl(
      _$_Missions _value, $Res Function(_$_Missions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? missions = null,
    Object? mission1Index = null,
    Object? mission2Index = null,
  }) {
    return _then(_$_Missions(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      missions: null == missions
          ? _value._missions
          : missions // ignore: cast_nullable_to_non_nullable
              as List<Mission>,
      mission1Index: null == mission1Index
          ? _value.mission1Index
          : mission1Index // ignore: cast_nullable_to_non_nullable
              as int,
      mission2Index: null == mission2Index
          ? _value.mission2Index
          : mission2Index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Missions extends _Missions {
  _$_Missions(
      {this.isLoading = false,
      final List<Mission> missions = const [],
      this.mission1Index = 0,
      this.mission2Index = 0})
      : _missions = missions,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<Mission> _missions;
  @override
  @JsonKey()
  List<Mission> get missions {
    if (_missions is EqualUnmodifiableListView) return _missions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missions);
  }

  @override
  @JsonKey()
  final int mission1Index;
  @override
  @JsonKey()
  final int mission2Index;

  @override
  String toString() {
    return 'Missions(isLoading: $isLoading, missions: $missions, mission1Index: $mission1Index, mission2Index: $mission2Index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Missions &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._missions, _missions) &&
            (identical(other.mission1Index, mission1Index) ||
                other.mission1Index == mission1Index) &&
            (identical(other.mission2Index, mission2Index) ||
                other.mission2Index == mission2Index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_missions),
      mission1Index,
      mission2Index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MissionsCopyWith<_$_Missions> get copyWith =>
      __$$_MissionsCopyWithImpl<_$_Missions>(this, _$identity);
}

abstract class _Missions extends Missions {
  factory _Missions(
      {final bool isLoading,
      final List<Mission> missions,
      final int mission1Index,
      final int mission2Index}) = _$_Missions;
  _Missions._() : super._();

  @override
  bool get isLoading;
  @override
  List<Mission> get missions;
  @override
  int get mission1Index;
  @override
  int get mission2Index;
  @override
  @JsonKey(ignore: true)
  _$$_MissionsCopyWith<_$_Missions> get copyWith =>
      throw _privateConstructorUsedError;
}
