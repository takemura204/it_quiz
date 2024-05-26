// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_choice_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizChoiceScreenState {
  bool get isAnsView => throw _privateConstructorUsedError; //答え表示
  bool get isJudge => throw _privateConstructorUsedError; //正解判定
  bool get isResultScreen => throw _privateConstructorUsedError;
  Quiz? get choiceQuiz => throw _privateConstructorUsedError;
  int get quizIndex => throw _privateConstructorUsedError; //問題番号
  int get quizItemIndex => throw _privateConstructorUsedError; //クイズアイテム番号
  String get selectAns => throw _privateConstructorUsedError; //選択した番号
  List<String> get choices => throw _privateConstructorUsedError; //選択肢
  List<QuizItem> get quizItemList => throw _privateConstructorUsedError; //問題
  Duration get duration => throw _privateConstructorUsedError; // 所要時間
  StudyType get studyType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizChoiceScreenStateCopyWith<QuizChoiceScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizChoiceScreenStateCopyWith<$Res> {
  factory $QuizChoiceScreenStateCopyWith(QuizChoiceScreenState value,
          $Res Function(QuizChoiceScreenState) then) =
      _$QuizChoiceScreenStateCopyWithImpl<$Res, QuizChoiceScreenState>;
  @useResult
  $Res call(
      {bool isAnsView,
      bool isJudge,
      bool isResultScreen,
      Quiz? choiceQuiz,
      int quizIndex,
      int quizItemIndex,
      String selectAns,
      List<String> choices,
      List<QuizItem> quizItemList,
      Duration duration,
      StudyType studyType});

  $QuizCopyWith<$Res>? get choiceQuiz;
}

/// @nodoc
class _$QuizChoiceScreenStateCopyWithImpl<$Res,
        $Val extends QuizChoiceScreenState>
    implements $QuizChoiceScreenStateCopyWith<$Res> {
  _$QuizChoiceScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnsView = null,
    Object? isJudge = null,
    Object? isResultScreen = null,
    Object? choiceQuiz = freezed,
    Object? quizIndex = null,
    Object? quizItemIndex = null,
    Object? selectAns = null,
    Object? choices = null,
    Object? quizItemList = null,
    Object? duration = null,
    Object? studyType = null,
  }) {
    return _then(_value.copyWith(
      isAnsView: null == isAnsView
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      isJudge: null == isJudge
          ? _value.isJudge
          : isJudge // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultScreen: null == isResultScreen
          ? _value.isResultScreen
          : isResultScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      choiceQuiz: freezed == choiceQuiz
          ? _value.choiceQuiz
          : choiceQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      quizIndex: null == quizIndex
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizItemIndex: null == quizItemIndex
          ? _value.quizItemIndex
          : quizItemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectAns: null == selectAns
          ? _value.selectAns
          : selectAns // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      quizItemList: null == quizItemList
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      studyType: null == studyType
          ? _value.studyType
          : studyType // ignore: cast_nullable_to_non_nullable
              as StudyType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get choiceQuiz {
    if (_value.choiceQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.choiceQuiz!, (value) {
      return _then(_value.copyWith(choiceQuiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $QuizChoiceScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAnsView,
      bool isJudge,
      bool isResultScreen,
      Quiz? choiceQuiz,
      int quizIndex,
      int quizItemIndex,
      String selectAns,
      List<String> choices,
      List<QuizItem> quizItemList,
      Duration duration,
      StudyType studyType});

  @override
  $QuizCopyWith<$Res>? get choiceQuiz;
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$QuizChoiceScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnsView = null,
    Object? isJudge = null,
    Object? isResultScreen = null,
    Object? choiceQuiz = freezed,
    Object? quizIndex = null,
    Object? quizItemIndex = null,
    Object? selectAns = null,
    Object? choices = null,
    Object? quizItemList = null,
    Object? duration = null,
    Object? studyType = null,
  }) {
    return _then(_$_Create(
      isAnsView: null == isAnsView
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      isJudge: null == isJudge
          ? _value.isJudge
          : isJudge // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultScreen: null == isResultScreen
          ? _value.isResultScreen
          : isResultScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      choiceQuiz: freezed == choiceQuiz
          ? _value.choiceQuiz
          : choiceQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      quizIndex: null == quizIndex
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizItemIndex: null == quizItemIndex
          ? _value.quizItemIndex
          : quizItemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectAns: null == selectAns
          ? _value.selectAns
          : selectAns // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      quizItemList: null == quizItemList
          ? _value._quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      studyType: null == studyType
          ? _value.studyType
          : studyType // ignore: cast_nullable_to_non_nullable
              as StudyType,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  const _$_Create(
      {this.isAnsView = false,
      this.isJudge = false,
      this.isResultScreen = false,
      this.choiceQuiz,
      this.quizIndex = 0,
      this.quizItemIndex = 0,
      this.selectAns = '',
      final List<String> choices = const [],
      final List<QuizItem> quizItemList = const [],
      this.duration = Duration.zero,
      this.studyType = StudyType.learn})
      : _choices = choices,
        _quizItemList = quizItemList,
        super._();

  @override
  @JsonKey()
  final bool isAnsView;
//答え表示
  @override
  @JsonKey()
  final bool isJudge;
//正解判定
  @override
  @JsonKey()
  final bool isResultScreen;
  @override
  final Quiz? choiceQuiz;
  @override
  @JsonKey()
  final int quizIndex;
//問題番号
  @override
  @JsonKey()
  final int quizItemIndex;
//クイズアイテム番号
  @override
  @JsonKey()
  final String selectAns;
//選択した番号
  final List<String> _choices;
//選択した番号
  @override
  @JsonKey()
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

//選択肢
  final List<QuizItem> _quizItemList;
//選択肢
  @override
  @JsonKey()
  List<QuizItem> get quizItemList {
    if (_quizItemList is EqualUnmodifiableListView) return _quizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizItemList);
  }

//問題
  @override
  @JsonKey()
  final Duration duration;
// 所要時間
  @override
  @JsonKey()
  final StudyType studyType;

  @override
  String toString() {
    return 'QuizChoiceScreenState(isAnsView: $isAnsView, isJudge: $isJudge, isResultScreen: $isResultScreen, choiceQuiz: $choiceQuiz, quizIndex: $quizIndex, quizItemIndex: $quizItemIndex, selectAns: $selectAns, choices: $choices, quizItemList: $quizItemList, duration: $duration, studyType: $studyType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.isAnsView, isAnsView) ||
                other.isAnsView == isAnsView) &&
            (identical(other.isJudge, isJudge) || other.isJudge == isJudge) &&
            (identical(other.isResultScreen, isResultScreen) ||
                other.isResultScreen == isResultScreen) &&
            (identical(other.choiceQuiz, choiceQuiz) ||
                other.choiceQuiz == choiceQuiz) &&
            (identical(other.quizIndex, quizIndex) ||
                other.quizIndex == quizIndex) &&
            (identical(other.quizItemIndex, quizItemIndex) ||
                other.quizItemIndex == quizItemIndex) &&
            (identical(other.selectAns, selectAns) ||
                other.selectAns == selectAns) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.studyType, studyType) ||
                other.studyType == studyType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAnsView,
      isJudge,
      isResultScreen,
      choiceQuiz,
      quizIndex,
      quizItemIndex,
      selectAns,
      const DeepCollectionEquality().hash(_choices),
      const DeepCollectionEquality().hash(_quizItemList),
      duration,
      studyType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends QuizChoiceScreenState {
  const factory _Create(
      {final bool isAnsView,
      final bool isJudge,
      final bool isResultScreen,
      final Quiz? choiceQuiz,
      final int quizIndex,
      final int quizItemIndex,
      final String selectAns,
      final List<String> choices,
      final List<QuizItem> quizItemList,
      final Duration duration,
      final StudyType studyType}) = _$_Create;
  const _Create._() : super._();

  @override
  bool get isAnsView;
  @override //答え表示
  bool get isJudge;
  @override //正解判定
  bool get isResultScreen;
  @override
  Quiz? get choiceQuiz;
  @override
  int get quizIndex;
  @override //問題番号
  int get quizItemIndex;
  @override //クイズアイテム番号
  String get selectAns;
  @override //選択した番号
  List<String> get choices;
  @override //選択肢
  List<QuizItem> get quizItemList;
  @override //問題
  Duration get duration;
  @override // 所要時間
  StudyType get studyType;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
