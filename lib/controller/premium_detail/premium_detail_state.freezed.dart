// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PremiumDetailState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PremiumDetailStateCopyWith<PremiumDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumDetailStateCopyWith<$Res> {
  factory $PremiumDetailStateCopyWith(
          PremiumDetailState value, $Res Function(PremiumDetailState) then) =
      _$PremiumDetailStateCopyWithImpl<$Res, PremiumDetailState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$PremiumDetailStateCopyWithImpl<$Res, $Val extends PremiumDetailState>
    implements $PremiumDetailStateCopyWith<$Res> {
  _$PremiumDetailStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_PremiumDetailStateCopyWith<$Res>
    implements $PremiumDetailStateCopyWith<$Res> {
  factory _$$_PremiumDetailStateCopyWith(_$_PremiumDetailState value,
          $Res Function(_$_PremiumDetailState) then) =
      __$$_PremiumDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_PremiumDetailStateCopyWithImpl<$Res>
    extends _$PremiumDetailStateCopyWithImpl<$Res, _$_PremiumDetailState>
    implements _$$_PremiumDetailStateCopyWith<$Res> {
  __$$_PremiumDetailStateCopyWithImpl(
      _$_PremiumDetailState _value, $Res Function(_$_PremiumDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_PremiumDetailState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PremiumDetailState implements _PremiumDetailState {
  const _$_PremiumDetailState({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'PremiumDetailState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PremiumDetailState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PremiumDetailStateCopyWith<_$_PremiumDetailState> get copyWith =>
      __$$_PremiumDetailStateCopyWithImpl<_$_PremiumDetailState>(
          this, _$identity);
}

abstract class _PremiumDetailState implements PremiumDetailState {
  const factory _PremiumDetailState({final bool isLoading}) =
      _$_PremiumDetailState;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_PremiumDetailStateCopyWith<_$_PremiumDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
