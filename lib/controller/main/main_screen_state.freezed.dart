// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainScreenState {
  int get currentTabIndex => throw _privateConstructorUsedError;
  int get inAppReviewCount => throw _privateConstructorUsedError;
  bool get isShowInAppReview => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainScreenStateCopyWith<MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenStateCopyWith<$Res> {
  factory $MainScreenStateCopyWith(
          MainScreenState value, $Res Function(MainScreenState) then) =
      _$MainScreenStateCopyWithImpl<$Res, MainScreenState>;
  @useResult
  $Res call(
      {int currentTabIndex, int inAppReviewCount, bool isShowInAppReview});
}

/// @nodoc
class _$MainScreenStateCopyWithImpl<$Res, $Val extends MainScreenState>
    implements $MainScreenStateCopyWith<$Res> {
  _$MainScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTabIndex = null,
    Object? inAppReviewCount = null,
    Object? isShowInAppReview = null,
  }) {
    return _then(_value.copyWith(
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      inAppReviewCount: null == inAppReviewCount
          ? _value.inAppReviewCount
          : inAppReviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isShowInAppReview: null == isShowInAppReview
          ? _value.isShowInAppReview
          : isShowInAppReview // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainScreenStateCopyWith<$Res>
    implements $MainScreenStateCopyWith<$Res> {
  factory _$$_MainScreenStateCopyWith(
          _$_MainScreenState value, $Res Function(_$_MainScreenState) then) =
      __$$_MainScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentTabIndex, int inAppReviewCount, bool isShowInAppReview});
}

/// @nodoc
class __$$_MainScreenStateCopyWithImpl<$Res>
    extends _$MainScreenStateCopyWithImpl<$Res, _$_MainScreenState>
    implements _$$_MainScreenStateCopyWith<$Res> {
  __$$_MainScreenStateCopyWithImpl(
      _$_MainScreenState _value, $Res Function(_$_MainScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTabIndex = null,
    Object? inAppReviewCount = null,
    Object? isShowInAppReview = null,
  }) {
    return _then(_$_MainScreenState(
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      inAppReviewCount: null == inAppReviewCount
          ? _value.inAppReviewCount
          : inAppReviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      isShowInAppReview: null == isShowInAppReview
          ? _value.isShowInAppReview
          : isShowInAppReview // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MainScreenState implements _MainScreenState {
  const _$_MainScreenState(
      {this.currentTabIndex = 0,
      this.inAppReviewCount = 0,
      this.isShowInAppReview = false});

  @override
  @JsonKey()
  final int currentTabIndex;
  @override
  @JsonKey()
  final int inAppReviewCount;
  @override
  @JsonKey()
  final bool isShowInAppReview;

  @override
  String toString() {
    return 'MainScreenState(currentTabIndex: $currentTabIndex, inAppReviewCount: $inAppReviewCount, isShowInAppReview: $isShowInAppReview)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainScreenState &&
            (identical(other.currentTabIndex, currentTabIndex) ||
                other.currentTabIndex == currentTabIndex) &&
            (identical(other.inAppReviewCount, inAppReviewCount) ||
                other.inAppReviewCount == inAppReviewCount) &&
            (identical(other.isShowInAppReview, isShowInAppReview) ||
                other.isShowInAppReview == isShowInAppReview));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentTabIndex, inAppReviewCount, isShowInAppReview);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainScreenStateCopyWith<_$_MainScreenState> get copyWith =>
      __$$_MainScreenStateCopyWithImpl<_$_MainScreenState>(this, _$identity);
}

abstract class _MainScreenState implements MainScreenState {
  const factory _MainScreenState(
      {final int currentTabIndex,
      final int inAppReviewCount,
      final bool isShowInAppReview}) = _$_MainScreenState;

  @override
  int get currentTabIndex;
  @override
  int get inAppReviewCount;
  @override
  bool get isShowInAppReview;
  @override
  @JsonKey(ignore: true)
  _$$_MainScreenStateCopyWith<_$_MainScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
