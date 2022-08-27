// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_choice_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizChoiceScreenStateTearOff {
  const _$QuizChoiceScreenStateTearOff();

  _Create call(
      {bool isAnsView = false,
      bool isJudge = false,
      bool isResultScreen = false,
      int quizIndex = 0,
      List<String> choices = const [],
      List<ChoiceQuiz> correctList = const [],
      List<ChoiceQuiz> incorrectList = const [],
      List<ChoiceQuiz> reviewList = const []}) {
    return _Create(
      isAnsView: isAnsView,
      isJudge: isJudge,
      isResultScreen: isResultScreen,
      quizIndex: quizIndex,
      choices: choices,
      correctList: correctList,
      incorrectList: incorrectList,
      reviewList: reviewList,
    );
  }
}

/// @nodoc
const $QuizChoiceScreenState = _$QuizChoiceScreenStateTearOff();

/// @nodoc
mixin _$QuizChoiceScreenState {
  bool get isAnsView => throw _privateConstructorUsedError; //答え表示
  bool get isJudge => throw _privateConstructorUsedError; //正解判定
  bool get isResultScreen => throw _privateConstructorUsedError;
  int get quizIndex => throw _privateConstructorUsedError; //問題番号
  List<String> get choices => throw _privateConstructorUsedError; //選択肢
  List<ChoiceQuiz> get correctList =>
      throw _privateConstructorUsedError; //正解リスト
  List<ChoiceQuiz> get incorrectList =>
      throw _privateConstructorUsedError; //不正解リスト
  List<ChoiceQuiz> get reviewList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizChoiceScreenStateCopyWith<QuizChoiceScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizChoiceScreenStateCopyWith<$Res> {
  factory $QuizChoiceScreenStateCopyWith(QuizChoiceScreenState value,
          $Res Function(QuizChoiceScreenState) then) =
      _$QuizChoiceScreenStateCopyWithImpl<$Res>;
  $Res call(
      {bool isAnsView,
      bool isJudge,
      bool isResultScreen,
      int quizIndex,
      List<String> choices,
      List<ChoiceQuiz> correctList,
      List<ChoiceQuiz> incorrectList,
      List<ChoiceQuiz> reviewList});
}

/// @nodoc
class _$QuizChoiceScreenStateCopyWithImpl<$Res>
    implements $QuizChoiceScreenStateCopyWith<$Res> {
  _$QuizChoiceScreenStateCopyWithImpl(this._value, this._then);

  final QuizChoiceScreenState _value;
  // ignore: unused_field
  final $Res Function(QuizChoiceScreenState) _then;

  @override
  $Res call({
    Object? isAnsView = freezed,
    Object? isJudge = freezed,
    Object? isResultScreen = freezed,
    Object? quizIndex = freezed,
    Object? choices = freezed,
    Object? correctList = freezed,
    Object? incorrectList = freezed,
    Object? reviewList = freezed,
  }) {
    return _then(_value.copyWith(
      isAnsView: isAnsView == freezed
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      isJudge: isJudge == freezed
          ? _value.isJudge
          : isJudge // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultScreen: isResultScreen == freezed
          ? _value.isResultScreen
          : isResultScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      quizIndex: quizIndex == freezed
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctList: correctList == freezed
          ? _value.correctList
          : correctList // ignore: cast_nullable_to_non_nullable
              as List<ChoiceQuiz>,
      incorrectList: incorrectList == freezed
          ? _value.incorrectList
          : incorrectList // ignore: cast_nullable_to_non_nullable
              as List<ChoiceQuiz>,
      reviewList: reviewList == freezed
          ? _value.reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<ChoiceQuiz>,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $QuizChoiceScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isAnsView,
      bool isJudge,
      bool isResultScreen,
      int quizIndex,
      List<String> choices,
      List<ChoiceQuiz> correctList,
      List<ChoiceQuiz> incorrectList,
      List<ChoiceQuiz> reviewList});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res>
    extends _$QuizChoiceScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? isAnsView = freezed,
    Object? isJudge = freezed,
    Object? isResultScreen = freezed,
    Object? quizIndex = freezed,
    Object? choices = freezed,
    Object? correctList = freezed,
    Object? incorrectList = freezed,
    Object? reviewList = freezed,
  }) {
    return _then(_Create(
      isAnsView: isAnsView == freezed
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      isJudge: isJudge == freezed
          ? _value.isJudge
          : isJudge // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultScreen: isResultScreen == freezed
          ? _value.isResultScreen
          : isResultScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      quizIndex: quizIndex == freezed
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctList: correctList == freezed
          ? _value.correctList
          : correctList // ignore: cast_nullable_to_non_nullable
              as List<ChoiceQuiz>,
      incorrectList: incorrectList == freezed
          ? _value.incorrectList
          : incorrectList // ignore: cast_nullable_to_non_nullable
              as List<ChoiceQuiz>,
      reviewList: reviewList == freezed
          ? _value.reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<ChoiceQuiz>,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  const _$_Create(
      {this.isAnsView = false,
      this.isJudge = false,
      this.isResultScreen = false,
      this.quizIndex = 0,
      this.choices = const [],
      this.correctList = const [],
      this.incorrectList = const [],
      this.reviewList = const []})
      : super._();

  @JsonKey()
  @override
  final bool isAnsView;
  @JsonKey()
  @override //答え表示
  final bool isJudge;
  @JsonKey()
  @override //正解判定
  final bool isResultScreen;
  @JsonKey()
  @override
  final int quizIndex;
  @JsonKey()
  @override //問題番号
  final List<String> choices;
  @JsonKey()
  @override //選択肢
  final List<ChoiceQuiz> correctList;
  @JsonKey()
  @override //正解リスト
  final List<ChoiceQuiz> incorrectList;
  @JsonKey()
  @override //不正解リスト
  final List<ChoiceQuiz> reviewList;

  @override
  String toString() {
    return 'QuizChoiceScreenState(isAnsView: $isAnsView, isJudge: $isJudge, isResultScreen: $isResultScreen, quizIndex: $quizIndex, choices: $choices, correctList: $correctList, incorrectList: $incorrectList, reviewList: $reviewList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality().equals(other.isAnsView, isAnsView) &&
            const DeepCollectionEquality().equals(other.isJudge, isJudge) &&
            const DeepCollectionEquality()
                .equals(other.isResultScreen, isResultScreen) &&
            const DeepCollectionEquality().equals(other.quizIndex, quizIndex) &&
            const DeepCollectionEquality().equals(other.choices, choices) &&
            const DeepCollectionEquality()
                .equals(other.correctList, correctList) &&
            const DeepCollectionEquality()
                .equals(other.incorrectList, incorrectList) &&
            const DeepCollectionEquality()
                .equals(other.reviewList, reviewList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAnsView),
      const DeepCollectionEquality().hash(isJudge),
      const DeepCollectionEquality().hash(isResultScreen),
      const DeepCollectionEquality().hash(quizIndex),
      const DeepCollectionEquality().hash(choices),
      const DeepCollectionEquality().hash(correctList),
      const DeepCollectionEquality().hash(incorrectList),
      const DeepCollectionEquality().hash(reviewList));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create extends QuizChoiceScreenState {
  const factory _Create(
      {bool isAnsView,
      bool isJudge,
      bool isResultScreen,
      int quizIndex,
      List<String> choices,
      List<ChoiceQuiz> correctList,
      List<ChoiceQuiz> incorrectList,
      List<ChoiceQuiz> reviewList}) = _$_Create;
  const _Create._() : super._();

  @override
  bool get isAnsView;
  @override //答え表示
  bool get isJudge;
  @override //正解判定
  bool get isResultScreen;
  @override
  int get quizIndex;
  @override //問題番号
  List<String> get choices;
  @override //選択肢
  List<ChoiceQuiz> get correctList;
  @override //正解リスト
  List<ChoiceQuiz> get incorrectList;
  @override //不正解リスト
  List<ChoiceQuiz> get reviewList;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
