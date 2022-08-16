// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_review_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeReviewScreenStateTearOff {
  const _$HomeReviewScreenStateTearOff();

  _Create call(
      {int currentIndex = 0,
      List<LearnQuiz> reviewQuestions = const [],
      List<QuizItem> reviewItem = const []}) {
    return _Create(
      currentIndex: currentIndex,
      reviewQuestions: reviewQuestions,
      reviewItem: reviewItem,
    );
  }
}

/// @nodoc
const $HomeReviewScreenState = _$HomeReviewScreenStateTearOff();

/// @nodoc
mixin _$HomeReviewScreenState {
  int get currentIndex => throw _privateConstructorUsedError;
  List<LearnQuiz> get reviewQuestions => throw _privateConstructorUsedError;
  List<QuizItem> get reviewItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeReviewScreenStateCopyWith<HomeReviewScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeReviewScreenStateCopyWith<$Res> {
  factory $HomeReviewScreenStateCopyWith(HomeReviewScreenState value,
          $Res Function(HomeReviewScreenState) then) =
      _$HomeReviewScreenStateCopyWithImpl<$Res>;
  $Res call(
      {int currentIndex,
      List<LearnQuiz> reviewQuestions,
      List<QuizItem> reviewItem});
}

/// @nodoc
class _$HomeReviewScreenStateCopyWithImpl<$Res>
    implements $HomeReviewScreenStateCopyWith<$Res> {
  _$HomeReviewScreenStateCopyWithImpl(this._value, this._then);

  final HomeReviewScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeReviewScreenState) _then;

  @override
  $Res call({
    Object? currentIndex = freezed,
    Object? reviewQuestions = freezed,
    Object? reviewItem = freezed,
  }) {
    return _then(_value.copyWith(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      reviewQuestions: reviewQuestions == freezed
          ? _value.reviewQuestions
          : reviewQuestions // ignore: cast_nullable_to_non_nullable
              as List<LearnQuiz>,
      reviewItem: reviewItem == freezed
          ? _value.reviewItem
          : reviewItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $HomeReviewScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int currentIndex,
      List<LearnQuiz> reviewQuestions,
      List<QuizItem> reviewItem});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res>
    extends _$HomeReviewScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? currentIndex = freezed,
    Object? reviewQuestions = freezed,
    Object? reviewItem = freezed,
  }) {
    return _then(_Create(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      reviewQuestions: reviewQuestions == freezed
          ? _value.reviewQuestions
          : reviewQuestions // ignore: cast_nullable_to_non_nullable
              as List<LearnQuiz>,
      reviewItem: reviewItem == freezed
          ? _value.reviewItem
          : reviewItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.currentIndex = 0,
      this.reviewQuestions = const [],
      this.reviewItem = const []});

  @JsonKey()
  @override
  final int currentIndex;
  @JsonKey()
  @override
  final List<LearnQuiz> reviewQuestions;
  @JsonKey()
  @override
  final List<QuizItem> reviewItem;

  @override
  String toString() {
    return 'HomeReviewScreenState(currentIndex: $currentIndex, reviewQuestions: $reviewQuestions, reviewItem: $reviewItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex) &&
            const DeepCollectionEquality()
                .equals(other.reviewQuestions, reviewQuestions) &&
            const DeepCollectionEquality()
                .equals(other.reviewItem, reviewItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentIndex),
      const DeepCollectionEquality().hash(reviewQuestions),
      const DeepCollectionEquality().hash(reviewItem));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements HomeReviewScreenState {
  const factory _Create(
      {int currentIndex,
      List<LearnQuiz> reviewQuestions,
      List<QuizItem> reviewItem}) = _$_Create;

  @override
  int get currentIndex;
  @override
  List<LearnQuiz> get reviewQuestions;
  @override
  List<QuizItem> get reviewItem;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
