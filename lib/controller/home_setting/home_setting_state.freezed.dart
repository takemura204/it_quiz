// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeSettingState {
  int get selectedQuizCountGoal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeSettingStateCopyWith<HomeSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSettingStateCopyWith<$Res> {
  factory $HomeSettingStateCopyWith(
          HomeSettingState value, $Res Function(HomeSettingState) then) =
      _$HomeSettingStateCopyWithImpl<$Res, HomeSettingState>;
  @useResult
  $Res call({int selectedQuizCountGoal});
}

/// @nodoc
class _$HomeSettingStateCopyWithImpl<$Res, $Val extends HomeSettingState>
    implements $HomeSettingStateCopyWith<$Res> {
  _$HomeSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedQuizCountGoal = null,
  }) {
    return _then(_value.copyWith(
      selectedQuizCountGoal: null == selectedQuizCountGoal
          ? _value.selectedQuizCountGoal
          : selectedQuizCountGoal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeSettingStateCopyWith<$Res>
    implements $HomeSettingStateCopyWith<$Res> {
  factory _$$_HomeSettingStateCopyWith(
          _$_HomeSettingState value, $Res Function(_$_HomeSettingState) then) =
      __$$_HomeSettingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedQuizCountGoal});
}

/// @nodoc
class __$$_HomeSettingStateCopyWithImpl<$Res>
    extends _$HomeSettingStateCopyWithImpl<$Res, _$_HomeSettingState>
    implements _$$_HomeSettingStateCopyWith<$Res> {
  __$$_HomeSettingStateCopyWithImpl(
      _$_HomeSettingState _value, $Res Function(_$_HomeSettingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedQuizCountGoal = null,
  }) {
    return _then(_$_HomeSettingState(
      selectedQuizCountGoal: null == selectedQuizCountGoal
          ? _value.selectedQuizCountGoal
          : selectedQuizCountGoal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeSettingState implements _HomeSettingState {
  const _$_HomeSettingState({this.selectedQuizCountGoal = 10});

  @override
  @JsonKey()
  final int selectedQuizCountGoal;

  @override
  String toString() {
    return 'HomeSettingState(selectedQuizCountGoal: $selectedQuizCountGoal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeSettingState &&
            (identical(other.selectedQuizCountGoal, selectedQuizCountGoal) ||
                other.selectedQuizCountGoal == selectedQuizCountGoal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedQuizCountGoal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeSettingStateCopyWith<_$_HomeSettingState> get copyWith =>
      __$$_HomeSettingStateCopyWithImpl<_$_HomeSettingState>(this, _$identity);
}

abstract class _HomeSettingState implements HomeSettingState {
  const factory _HomeSettingState({final int selectedQuizCountGoal}) =
      _$_HomeSettingState;

  @override
  int get selectedQuizCountGoal;
  @override
  @JsonKey(ignore: true)
  _$$_HomeSettingStateCopyWith<_$_HomeSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
