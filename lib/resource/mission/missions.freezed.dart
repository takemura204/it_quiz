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
  List<Mission> get missions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MissionsCopyWith<Missions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionsCopyWith<$Res> {
  factory $MissionsCopyWith(Missions value, $Res Function(Missions) then) =
      _$MissionsCopyWithImpl<$Res, Missions>;
  @useResult
  $Res call({List<Mission> missions});
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
    Object? missions = null,
  }) {
    return _then(_value.copyWith(
      missions: null == missions
          ? _value.missions
          : missions // ignore: cast_nullable_to_non_nullable
              as List<Mission>,
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
  $Res call({List<Mission> missions});
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
    Object? missions = null,
  }) {
    return _then(_$_Missions(
      missions: null == missions
          ? _value._missions
          : missions // ignore: cast_nullable_to_non_nullable
              as List<Mission>,
    ));
  }
}

/// @nodoc

class _$_Missions extends _Missions {
  _$_Missions({final List<Mission> missions = const []})
      : _missions = missions,
        super._();

  final List<Mission> _missions;
  @override
  @JsonKey()
  List<Mission> get missions {
    if (_missions is EqualUnmodifiableListView) return _missions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missions);
  }

  @override
  String toString() {
    return 'Missions(missions: $missions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Missions &&
            const DeepCollectionEquality().equals(other._missions, _missions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_missions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MissionsCopyWith<_$_Missions> get copyWith =>
      __$$_MissionsCopyWithImpl<_$_Missions>(this, _$identity);
}

abstract class _Missions extends Missions {
  factory _Missions({final List<Mission> missions}) = _$_Missions;
  _Missions._() : super._();

  @override
  List<Mission> get missions;
  @override
  @JsonKey(ignore: true)
  _$$_MissionsCopyWith<_$_Missions> get copyWith =>
      throw _privateConstructorUsedError;
}
