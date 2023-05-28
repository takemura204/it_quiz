// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_review_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeReviewScreenState {
  List<QuizItemState> get reviewItem => throw _privateConstructorUsedError;
  QuizItemState get weakQuiz => throw _privateConstructorUsedError; //苦手克服
  QuizItemState get dailyQuiz => throw _privateConstructorUsedError; //今日のクイズ
  QuizItemState get testQuiz => throw _privateConstructorUsedError; //全てのクイズ
  int get testScore => throw _privateConstructorUsedError; //全てのクイズ
  bool get isSelected => throw _privateConstructorUsedError;
  List<String> get testGroup => throw _privateConstructorUsedError;
  int get selectedTestLength => throw _privateConstructorUsedError;
  int get dailyScore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeReviewScreenStateCopyWith<HomeReviewScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeReviewScreenStateCopyWith<$Res> {
  factory $HomeReviewScreenStateCopyWith(HomeReviewScreenState value,
          $Res Function(HomeReviewScreenState) then) =
      _$HomeReviewScreenStateCopyWithImpl<$Res, HomeReviewScreenState>;
  @useResult
  $Res call(
      {List<QuizItemState> reviewItem,
      QuizItemState weakQuiz,
      QuizItemState dailyQuiz,
      QuizItemState testQuiz,
      int testScore,
      bool isSelected,
      List<String> testGroup,
      int selectedTestLength,
      int dailyScore});

  $QuizItemStateCopyWith<$Res> get weakQuiz;
  $QuizItemStateCopyWith<$Res> get dailyQuiz;
  $QuizItemStateCopyWith<$Res> get testQuiz;
}

/// @nodoc
class _$HomeReviewScreenStateCopyWithImpl<$Res,
        $Val extends HomeReviewScreenState>
    implements $HomeReviewScreenStateCopyWith<$Res> {
  _$HomeReviewScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewItem = null,
    Object? weakQuiz = null,
    Object? dailyQuiz = null,
    Object? testQuiz = null,
    Object? testScore = null,
    Object? isSelected = null,
    Object? testGroup = null,
    Object? selectedTestLength = null,
    Object? dailyScore = null,
  }) {
    return _then(_value.copyWith(
      reviewItem: null == reviewItem
          ? _value.reviewItem
          : reviewItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItemState>,
      weakQuiz: null == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as QuizItemState,
      dailyQuiz: null == dailyQuiz
          ? _value.dailyQuiz
          : dailyQuiz // ignore: cast_nullable_to_non_nullable
              as QuizItemState,
      testQuiz: null == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as QuizItemState,
      testScore: null == testScore
          ? _value.testScore
          : testScore // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      testGroup: null == testGroup
          ? _value.testGroup
          : testGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTestLength: null == selectedTestLength
          ? _value.selectedTestLength
          : selectedTestLength // ignore: cast_nullable_to_non_nullable
              as int,
      dailyScore: null == dailyScore
          ? _value.dailyScore
          : dailyScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizItemStateCopyWith<$Res> get weakQuiz {
    return $QuizItemStateCopyWith<$Res>(_value.weakQuiz, (value) {
      return _then(_value.copyWith(weakQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizItemStateCopyWith<$Res> get dailyQuiz {
    return $QuizItemStateCopyWith<$Res>(_value.dailyQuiz, (value) {
      return _then(_value.copyWith(dailyQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizItemStateCopyWith<$Res> get testQuiz {
    return $QuizItemStateCopyWith<$Res>(_value.testQuiz, (value) {
      return _then(_value.copyWith(testQuiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $HomeReviewScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuizItemState> reviewItem,
      QuizItemState weakQuiz,
      QuizItemState dailyQuiz,
      QuizItemState testQuiz,
      int testScore,
      bool isSelected,
      List<String> testGroup,
      int selectedTestLength,
      int dailyScore});

  @override
  $QuizItemStateCopyWith<$Res> get weakQuiz;
  @override
  $QuizItemStateCopyWith<$Res> get dailyQuiz;
  @override
  $QuizItemStateCopyWith<$Res> get testQuiz;
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$HomeReviewScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewItem = null,
    Object? weakQuiz = null,
    Object? dailyQuiz = null,
    Object? testQuiz = null,
    Object? testScore = null,
    Object? isSelected = null,
    Object? testGroup = null,
    Object? selectedTestLength = null,
    Object? dailyScore = null,
  }) {
    return _then(_$_Create(
      reviewItem: null == reviewItem
          ? _value._reviewItem
          : reviewItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItemState>,
      weakQuiz: null == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as QuizItemState,
      dailyQuiz: null == dailyQuiz
          ? _value.dailyQuiz
          : dailyQuiz // ignore: cast_nullable_to_non_nullable
              as QuizItemState,
      testQuiz: null == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as QuizItemState,
      testScore: null == testScore
          ? _value.testScore
          : testScore // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      testGroup: null == testGroup
          ? _value._testGroup
          : testGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTestLength: null == selectedTestLength
          ? _value.selectedTestLength
          : selectedTestLength // ignore: cast_nullable_to_non_nullable
              as int,
      dailyScore: null == dailyScore
          ? _value.dailyScore
          : dailyScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {final List<QuizItemState> reviewItem = const [],
      this.weakQuiz = weakItem,
      this.dailyQuiz = dailyItem,
      this.testQuiz = testItem,
      this.testScore = 0,
      this.isSelected = false,
      final List<String> testGroup = const [],
      this.selectedTestLength = 10,
      this.dailyScore = 0})
      : _reviewItem = reviewItem,
        _testGroup = testGroup;

  final List<QuizItemState> _reviewItem;
  @override
  @JsonKey()
  List<QuizItemState> get reviewItem {
    if (_reviewItem is EqualUnmodifiableListView) return _reviewItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewItem);
  }

  @override
  @JsonKey()
  final QuizItemState weakQuiz;
//苦手克服
  @override
  @JsonKey()
  final QuizItemState dailyQuiz;
//今日のクイズ
  @override
  @JsonKey()
  final QuizItemState testQuiz;
//全てのクイズ
  @override
  @JsonKey()
  final int testScore;
//全てのクイズ
  @override
  @JsonKey()
  final bool isSelected;
  final List<String> _testGroup;
  @override
  @JsonKey()
  List<String> get testGroup {
    if (_testGroup is EqualUnmodifiableListView) return _testGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_testGroup);
  }

  @override
  @JsonKey()
  final int selectedTestLength;
  @override
  @JsonKey()
  final int dailyScore;

  @override
  String toString() {
    return 'HomeReviewScreenState(reviewItem: $reviewItem, weakQuiz: $weakQuiz, dailyQuiz: $dailyQuiz, testQuiz: $testQuiz, testScore: $testScore, isSelected: $isSelected, testGroup: $testGroup, selectedTestLength: $selectedTestLength, dailyScore: $dailyScore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            const DeepCollectionEquality()
                .equals(other._reviewItem, _reviewItem) &&
            (identical(other.weakQuiz, weakQuiz) ||
                other.weakQuiz == weakQuiz) &&
            (identical(other.dailyQuiz, dailyQuiz) ||
                other.dailyQuiz == dailyQuiz) &&
            (identical(other.testQuiz, testQuiz) ||
                other.testQuiz == testQuiz) &&
            (identical(other.testScore, testScore) ||
                other.testScore == testScore) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            const DeepCollectionEquality()
                .equals(other._testGroup, _testGroup) &&
            (identical(other.selectedTestLength, selectedTestLength) ||
                other.selectedTestLength == selectedTestLength) &&
            (identical(other.dailyScore, dailyScore) ||
                other.dailyScore == dailyScore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reviewItem),
      weakQuiz,
      dailyQuiz,
      testQuiz,
      testScore,
      isSelected,
      const DeepCollectionEquality().hash(_testGroup),
      selectedTestLength,
      dailyScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create implements HomeReviewScreenState {
  const factory _Create(
      {final List<QuizItemState> reviewItem,
      final QuizItemState weakQuiz,
      final QuizItemState dailyQuiz,
      final QuizItemState testQuiz,
      final int testScore,
      final bool isSelected,
      final List<String> testGroup,
      final int selectedTestLength,
      final int dailyScore}) = _$_Create;

  @override
  List<QuizItemState> get reviewItem;
  @override
  QuizItemState get weakQuiz;
  @override //苦手克服
  QuizItemState get dailyQuiz;
  @override //今日のクイズ
  QuizItemState get testQuiz;
  @override //全てのクイズ
  int get testScore;
  @override //全てのクイズ
  bool get isSelected;
  @override
  List<String> get testGroup;
  @override
  int get selectedTestLength;
  @override
  int get dailyScore;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
