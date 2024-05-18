// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorialState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorialStateCopyWith<TutorialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialStateCopyWith<$Res> {
  factory $TutorialStateCopyWith(
          TutorialState value, $Res Function(TutorialState) then) =
      _$TutorialStateCopyWithImpl<$Res, TutorialState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$TutorialStateCopyWithImpl<$Res, $Val extends TutorialState>
    implements $TutorialStateCopyWith<$Res> {
  _$TutorialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorialStateCopyWith<$Res>
    implements $TutorialStateCopyWith<$Res> {
  factory _$$_TutorialStateCopyWith(
          _$_TutorialState value, $Res Function(_$_TutorialState) then) =
      __$$_TutorialStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_TutorialStateCopyWithImpl<$Res>
    extends _$TutorialStateCopyWithImpl<$Res, _$_TutorialState>
    implements _$$_TutorialStateCopyWith<$Res> {
  __$$_TutorialStateCopyWithImpl(
      _$_TutorialState _value, $Res Function(_$_TutorialState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_TutorialState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TutorialState extends _TutorialState {
  _$_TutorialState({this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TutorialState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TutorialState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TutorialStateCopyWith<_$_TutorialState> get copyWith =>
      __$$_TutorialStateCopyWithImpl<_$_TutorialState>(this, _$identity);
}

abstract class _TutorialState extends TutorialState {
  factory _TutorialState({final bool isLoading}) = _$_TutorialState;
  _TutorialState._() : super._();

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_TutorialStateCopyWith<_$_TutorialState> get copyWith =>
      throw _privateConstructorUsedError;
}
