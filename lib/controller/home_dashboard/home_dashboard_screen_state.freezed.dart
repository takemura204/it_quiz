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
  int get tabIndex => throw _privateConstructorUsedError; //タブ
  int get selectedXIndex => throw _privateConstructorUsedError;

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
  $Res call({int tabIndex, int selectedXIndex});
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
    Object? tabIndex = null,
    Object? selectedXIndex = null,
  }) {
    return _then(_value.copyWith(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedXIndex: null == selectedXIndex
          ? _value.selectedXIndex
          : selectedXIndex // ignore: cast_nullable_to_non_nullable
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
  $Res call({int tabIndex, int selectedXIndex});
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
    Object? tabIndex = null,
    Object? selectedXIndex = null,
  }) {
    return _then(_$_Create(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedXIndex: null == selectedXIndex
          ? _value.selectedXIndex
          : selectedXIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create({this.tabIndex = 0, this.selectedXIndex = -1}) : super._();

  @override
  @JsonKey()
  final int tabIndex;
//タブ
  @override
  @JsonKey()
  final int selectedXIndex;

  @override
  String toString() {
    return 'HomeDashboardScreenState(tabIndex: $tabIndex, selectedXIndex: $selectedXIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            (identical(other.selectedXIndex, selectedXIndex) ||
                other.selectedXIndex == selectedXIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex, selectedXIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends HomeDashboardScreenState {
  factory _Create({final int tabIndex, final int selectedXIndex}) = _$_Create;
  _Create._() : super._();

  @override
  int get tabIndex;
  @override //タブ
  int get selectedXIndex;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
