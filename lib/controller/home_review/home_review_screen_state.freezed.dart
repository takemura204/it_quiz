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
  List<Quiz> get reviewItem => throw _privateConstructorUsedError;
  Quiz? get weakQuiz => throw _privateConstructorUsedError; //苦手克服
  Quiz? get dailyQuiz => throw _privateConstructorUsedError; //今日のクイズ
  Quiz? get testQuiz => throw _privateConstructorUsedError; //全てのクイズ
  bool get isSelected => throw _privateConstructorUsedError;
  List<String> get testGroup => throw _privateConstructorUsedError;
  int get selectedTestLength => throw _privateConstructorUsedError;
  int get runningDay => throw _privateConstructorUsedError;

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
      {List<Quiz> reviewItem,
      Quiz? weakQuiz,
      Quiz? dailyQuiz,
      Quiz? testQuiz,
      bool isSelected,
      List<String> testGroup,
      int selectedTestLength,
      int runningDay});

  $QuizCopyWith<$Res>? get weakQuiz;
  $QuizCopyWith<$Res>? get dailyQuiz;
  $QuizCopyWith<$Res>? get testQuiz;
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
    Object? weakQuiz = freezed,
    Object? dailyQuiz = freezed,
    Object? testQuiz = freezed,
    Object? isSelected = null,
    Object? testGroup = null,
    Object? selectedTestLength = null,
    Object? runningDay = null,
  }) {
    return _then(_value.copyWith(
      reviewItem: null == reviewItem
          ? _value.reviewItem
          : reviewItem // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      weakQuiz: freezed == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      dailyQuiz: freezed == dailyQuiz
          ? _value.dailyQuiz
          : dailyQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      testQuiz: freezed == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
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
      runningDay: null == runningDay
          ? _value.runningDay
          : runningDay // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get weakQuiz {
    if (_value.weakQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.weakQuiz!, (value) {
      return _then(_value.copyWith(weakQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get dailyQuiz {
    if (_value.dailyQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.dailyQuiz!, (value) {
      return _then(_value.copyWith(dailyQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get testQuiz {
    if (_value.testQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.testQuiz!, (value) {
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
      {List<Quiz> reviewItem,
      Quiz? weakQuiz,
      Quiz? dailyQuiz,
      Quiz? testQuiz,
      bool isSelected,
      List<String> testGroup,
      int selectedTestLength,
      int runningDay});

  @override
  $QuizCopyWith<$Res>? get weakQuiz;
  @override
  $QuizCopyWith<$Res>? get dailyQuiz;
  @override
  $QuizCopyWith<$Res>? get testQuiz;
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
    Object? weakQuiz = freezed,
    Object? dailyQuiz = freezed,
    Object? testQuiz = freezed,
    Object? isSelected = null,
    Object? testGroup = null,
    Object? selectedTestLength = null,
    Object? runningDay = null,
  }) {
    return _then(_$_Create(
      reviewItem: null == reviewItem
          ? _value._reviewItem
          : reviewItem // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      weakQuiz: freezed == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      dailyQuiz: freezed == dailyQuiz
          ? _value.dailyQuiz
          : dailyQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      testQuiz: freezed == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
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
      runningDay: null == runningDay
          ? _value.runningDay
          : runningDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create(
      {final List<Quiz> reviewItem = const [],
      this.weakQuiz,
      this.dailyQuiz,
      this.testQuiz,
      this.isSelected = false,
      final List<String> testGroup = const [],
      this.selectedTestLength = 10,
      this.runningDay = 0})
      : _reviewItem = reviewItem,
        _testGroup = testGroup,
        super._();

  final List<Quiz> _reviewItem;
  @override
  @JsonKey()
  List<Quiz> get reviewItem {
    if (_reviewItem is EqualUnmodifiableListView) return _reviewItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewItem);
  }

  @override
  final Quiz? weakQuiz;
//苦手克服
  @override
  final Quiz? dailyQuiz;
//今日のクイズ
  @override
  final Quiz? testQuiz;
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
  final int runningDay;

  @override
  String toString() {
    return 'HomeReviewScreenState(reviewItem: $reviewItem, weakQuiz: $weakQuiz, dailyQuiz: $dailyQuiz, testQuiz: $testQuiz, isSelected: $isSelected, testGroup: $testGroup, selectedTestLength: $selectedTestLength, runningDay: $runningDay)';
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
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            const DeepCollectionEquality()
                .equals(other._testGroup, _testGroup) &&
            (identical(other.selectedTestLength, selectedTestLength) ||
                other.selectedTestLength == selectedTestLength) &&
            (identical(other.runningDay, runningDay) ||
                other.runningDay == runningDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_reviewItem),
      weakQuiz,
      dailyQuiz,
      testQuiz,
      isSelected,
      const DeepCollectionEquality().hash(_testGroup),
      selectedTestLength,
      runningDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends HomeReviewScreenState {
  factory _Create(
      {final List<Quiz> reviewItem,
      final Quiz? weakQuiz,
      final Quiz? dailyQuiz,
      final Quiz? testQuiz,
      final bool isSelected,
      final List<String> testGroup,
      final int selectedTestLength,
      final int runningDay}) = _$_Create;
  _Create._() : super._();

  @override
  List<Quiz> get reviewItem;
  @override
  Quiz? get weakQuiz;
  @override //苦手克服
  Quiz? get dailyQuiz;
  @override //今日のクイズ
  Quiz? get testQuiz;
  @override //全てのクイズ
  bool get isSelected;
  @override
  List<String> get testGroup;
  @override
  int get selectedTestLength;
  @override
  int get runningDay;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
