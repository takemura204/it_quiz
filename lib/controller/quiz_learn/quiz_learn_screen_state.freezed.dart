// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_learn_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizLearnScreenState {
  bool get isAnsView => throw _privateConstructorUsedError;
  bool get isRepeat => throw _privateConstructorUsedError;
  bool get isResultScreen => throw _privateConstructorUsedError;
  int get itemIndex => throw _privateConstructorUsedError;
  int get lapIndex => throw _privateConstructorUsedError;
  List<QuizItem> get quizItemList => throw _privateConstructorUsedError;
  List<QuizItem> get knowQuizItemList => throw _privateConstructorUsedError;
  List<QuizItem> get unKnowQuizItemList => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError; // 学習時間
  StudyType get studyType => throw _privateConstructorUsedError; //クイズタイプ
  Quiz? get learnQuiz => throw _privateConstructorUsedError;
  AppinioSwiperDirection? get direction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizLearnScreenStateCopyWith<QuizLearnScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizLearnScreenStateCopyWith<$Res> {
  factory $QuizLearnScreenStateCopyWith(QuizLearnScreenState value,
          $Res Function(QuizLearnScreenState) then) =
      _$QuizLearnScreenStateCopyWithImpl<$Res, QuizLearnScreenState>;
  @useResult
  $Res call(
      {bool isAnsView,
      bool isRepeat,
      bool isResultScreen,
      int itemIndex,
      int lapIndex,
      List<QuizItem> quizItemList,
      List<QuizItem> knowQuizItemList,
      List<QuizItem> unKnowQuizItemList,
      Duration duration,
      StudyType studyType,
      Quiz? learnQuiz,
      AppinioSwiperDirection? direction});

  $QuizCopyWith<$Res>? get learnQuiz;
}

/// @nodoc
class _$QuizLearnScreenStateCopyWithImpl<$Res,
        $Val extends QuizLearnScreenState>
    implements $QuizLearnScreenStateCopyWith<$Res> {
  _$QuizLearnScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnsView = null,
    Object? isRepeat = null,
    Object? isResultScreen = null,
    Object? itemIndex = null,
    Object? lapIndex = null,
    Object? quizItemList = null,
    Object? knowQuizItemList = null,
    Object? unKnowQuizItemList = null,
    Object? duration = null,
    Object? studyType = null,
    Object? learnQuiz = freezed,
    Object? direction = freezed,
  }) {
    return _then(_value.copyWith(
      isAnsView: null == isAnsView
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      isRepeat: null == isRepeat
          ? _value.isRepeat
          : isRepeat // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultScreen: null == isResultScreen
          ? _value.isResultScreen
          : isResultScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizItemList: null == quizItemList
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      knowQuizItemList: null == knowQuizItemList
          ? _value.knowQuizItemList
          : knowQuizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      unKnowQuizItemList: null == unKnowQuizItemList
          ? _value.unKnowQuizItemList
          : unKnowQuizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      studyType: null == studyType
          ? _value.studyType
          : studyType // ignore: cast_nullable_to_non_nullable
              as StudyType,
      learnQuiz: freezed == learnQuiz
          ? _value.learnQuiz
          : learnQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as AppinioSwiperDirection?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get learnQuiz {
    if (_value.learnQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.learnQuiz!, (value) {
      return _then(_value.copyWith(learnQuiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizLearnScreenStateCopyWith<$Res>
    implements $QuizLearnScreenStateCopyWith<$Res> {
  factory _$$_QuizLearnScreenStateCopyWith(_$_QuizLearnScreenState value,
          $Res Function(_$_QuizLearnScreenState) then) =
      __$$_QuizLearnScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAnsView,
      bool isRepeat,
      bool isResultScreen,
      int itemIndex,
      int lapIndex,
      List<QuizItem> quizItemList,
      List<QuizItem> knowQuizItemList,
      List<QuizItem> unKnowQuizItemList,
      Duration duration,
      StudyType studyType,
      Quiz? learnQuiz,
      AppinioSwiperDirection? direction});

  @override
  $QuizCopyWith<$Res>? get learnQuiz;
}

/// @nodoc
class __$$_QuizLearnScreenStateCopyWithImpl<$Res>
    extends _$QuizLearnScreenStateCopyWithImpl<$Res, _$_QuizLearnScreenState>
    implements _$$_QuizLearnScreenStateCopyWith<$Res> {
  __$$_QuizLearnScreenStateCopyWithImpl(_$_QuizLearnScreenState _value,
      $Res Function(_$_QuizLearnScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnsView = null,
    Object? isRepeat = null,
    Object? isResultScreen = null,
    Object? itemIndex = null,
    Object? lapIndex = null,
    Object? quizItemList = null,
    Object? knowQuizItemList = null,
    Object? unKnowQuizItemList = null,
    Object? duration = null,
    Object? studyType = null,
    Object? learnQuiz = freezed,
    Object? direction = freezed,
  }) {
    return _then(_$_QuizLearnScreenState(
      isAnsView: null == isAnsView
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      isRepeat: null == isRepeat
          ? _value.isRepeat
          : isRepeat // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultScreen: null == isResultScreen
          ? _value.isResultScreen
          : isResultScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizItemList: null == quizItemList
          ? _value._quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      knowQuizItemList: null == knowQuizItemList
          ? _value._knowQuizItemList
          : knowQuizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      unKnowQuizItemList: null == unKnowQuizItemList
          ? _value._unKnowQuizItemList
          : unKnowQuizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      studyType: null == studyType
          ? _value.studyType
          : studyType // ignore: cast_nullable_to_non_nullable
              as StudyType,
      learnQuiz: freezed == learnQuiz
          ? _value.learnQuiz
          : learnQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as AppinioSwiperDirection?,
    ));
  }
}

/// @nodoc

class _$_QuizLearnScreenState extends _QuizLearnScreenState {
  const _$_QuizLearnScreenState(
      {this.isAnsView = false,
      this.isRepeat = false,
      this.isResultScreen = false,
      this.itemIndex = 0,
      this.lapIndex = 0,
      final List<QuizItem> quizItemList = const [],
      final List<QuizItem> knowQuizItemList = const [],
      final List<QuizItem> unKnowQuizItemList = const [],
      this.duration = Duration.zero,
      this.studyType = StudyType.learn,
      this.learnQuiz,
      this.direction})
      : _quizItemList = quizItemList,
        _knowQuizItemList = knowQuizItemList,
        _unKnowQuizItemList = unKnowQuizItemList,
        super._();

  @override
  @JsonKey()
  final bool isAnsView;
  @override
  @JsonKey()
  final bool isRepeat;
  @override
  @JsonKey()
  final bool isResultScreen;
  @override
  @JsonKey()
  final int itemIndex;
  @override
  @JsonKey()
  final int lapIndex;
  final List<QuizItem> _quizItemList;
  @override
  @JsonKey()
  List<QuizItem> get quizItemList {
    if (_quizItemList is EqualUnmodifiableListView) return _quizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizItemList);
  }

  final List<QuizItem> _knowQuizItemList;
  @override
  @JsonKey()
  List<QuizItem> get knowQuizItemList {
    if (_knowQuizItemList is EqualUnmodifiableListView)
      return _knowQuizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knowQuizItemList);
  }

  final List<QuizItem> _unKnowQuizItemList;
  @override
  @JsonKey()
  List<QuizItem> get unKnowQuizItemList {
    if (_unKnowQuizItemList is EqualUnmodifiableListView)
      return _unKnowQuizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unKnowQuizItemList);
  }

  @override
  @JsonKey()
  final Duration duration;
// 学習時間
  @override
  @JsonKey()
  final StudyType studyType;
//クイズタイプ
  @override
  final Quiz? learnQuiz;
  @override
  final AppinioSwiperDirection? direction;

  @override
  String toString() {
    return 'QuizLearnScreenState(isAnsView: $isAnsView, isRepeat: $isRepeat, isResultScreen: $isResultScreen, itemIndex: $itemIndex, lapIndex: $lapIndex, quizItemList: $quizItemList, knowQuizItemList: $knowQuizItemList, unKnowQuizItemList: $unKnowQuizItemList, duration: $duration, studyType: $studyType, learnQuiz: $learnQuiz, direction: $direction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizLearnScreenState &&
            (identical(other.isAnsView, isAnsView) ||
                other.isAnsView == isAnsView) &&
            (identical(other.isRepeat, isRepeat) ||
                other.isRepeat == isRepeat) &&
            (identical(other.isResultScreen, isResultScreen) ||
                other.isResultScreen == isResultScreen) &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex) &&
            (identical(other.lapIndex, lapIndex) ||
                other.lapIndex == lapIndex) &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            const DeepCollectionEquality()
                .equals(other._knowQuizItemList, _knowQuizItemList) &&
            const DeepCollectionEquality()
                .equals(other._unKnowQuizItemList, _unKnowQuizItemList) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.studyType, studyType) ||
                other.studyType == studyType) &&
            (identical(other.learnQuiz, learnQuiz) ||
                other.learnQuiz == learnQuiz) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAnsView,
      isRepeat,
      isResultScreen,
      itemIndex,
      lapIndex,
      const DeepCollectionEquality().hash(_quizItemList),
      const DeepCollectionEquality().hash(_knowQuizItemList),
      const DeepCollectionEquality().hash(_unKnowQuizItemList),
      duration,
      studyType,
      learnQuiz,
      direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizLearnScreenStateCopyWith<_$_QuizLearnScreenState> get copyWith =>
      __$$_QuizLearnScreenStateCopyWithImpl<_$_QuizLearnScreenState>(
          this, _$identity);
}

abstract class _QuizLearnScreenState extends QuizLearnScreenState {
  const factory _QuizLearnScreenState(
      {final bool isAnsView,
      final bool isRepeat,
      final bool isResultScreen,
      final int itemIndex,
      final int lapIndex,
      final List<QuizItem> quizItemList,
      final List<QuizItem> knowQuizItemList,
      final List<QuizItem> unKnowQuizItemList,
      final Duration duration,
      final StudyType studyType,
      final Quiz? learnQuiz,
      final AppinioSwiperDirection? direction}) = _$_QuizLearnScreenState;
  const _QuizLearnScreenState._() : super._();

  @override
  bool get isAnsView;
  @override
  bool get isRepeat;
  @override
  bool get isResultScreen;
  @override
  int get itemIndex;
  @override
  int get lapIndex;
  @override
  List<QuizItem> get quizItemList;
  @override
  List<QuizItem> get knowQuizItemList;
  @override
  List<QuizItem> get unKnowQuizItemList;
  @override
  Duration get duration;
  @override // 学習時間
  StudyType get studyType;
  @override //クイズタイプ
  Quiz? get learnQuiz;
  @override
  AppinioSwiperDirection? get direction;
  @override
  @JsonKey(ignore: true)
  _$$_QuizLearnScreenStateCopyWith<_$_QuizLearnScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
