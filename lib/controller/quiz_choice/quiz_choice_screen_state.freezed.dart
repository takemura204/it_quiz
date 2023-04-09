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
  int get quizIndex => throw _privateConstructorUsedError; //問題番号
  List<String> get choices => throw _privateConstructorUsedError; //選択肢
  List<QuizState> get correctList => throw _privateConstructorUsedError; //正解リスト
  List<QuizState> get incorrectList =>
      throw _privateConstructorUsedError; //不正解リスト
  List<QuizState> get reviewList => throw _privateConstructorUsedError; //復習リスト
  QuizItemState? get quizItem => throw _privateConstructorUsedError;
  List<QuizItemState> get quizItemList => throw _privateConstructorUsedError;
  int get scoreCount => throw _privateConstructorUsedError;

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
      int quizIndex,
      List<String> choices,
      List<QuizState> correctList,
      List<QuizState> incorrectList,
      List<QuizState> reviewList,
      QuizItemState? quizItem,
      List<QuizItemState> quizItemList,
      int scoreCount});

  $QuizItemStateCopyWith<$Res>? get quizItem;
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
    Object? quizIndex = null,
    Object? choices = null,
    Object? correctList = null,
    Object? incorrectList = null,
    Object? reviewList = null,
    Object? quizItem = freezed,
    Object? quizItemList = null,
    Object? scoreCount = null,
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
      quizIndex: null == quizIndex
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctList: null == correctList
          ? _value.correctList
          : correctList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      incorrectList: null == incorrectList
          ? _value.incorrectList
          : incorrectList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      reviewList: null == reviewList
          ? _value.reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      quizItem: freezed == quizItem
          ? _value.quizItem
          : quizItem // ignore: cast_nullable_to_non_nullable
              as QuizItemState?,
      quizItemList: null == quizItemList
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItemState>,
      scoreCount: null == scoreCount
          ? _value.scoreCount
          : scoreCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizItemStateCopyWith<$Res>? get quizItem {
    if (_value.quizItem == null) {
      return null;
    }

    return $QuizItemStateCopyWith<$Res>(_value.quizItem!, (value) {
      return _then(_value.copyWith(quizItem: value) as $Val);
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
      int quizIndex,
      List<String> choices,
      List<QuizState> correctList,
      List<QuizState> incorrectList,
      List<QuizState> reviewList,
      QuizItemState? quizItem,
      List<QuizItemState> quizItemList,
      int scoreCount});

  @override
  $QuizItemStateCopyWith<$Res>? get quizItem;
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
    Object? quizIndex = null,
    Object? choices = null,
    Object? correctList = null,
    Object? incorrectList = null,
    Object? reviewList = null,
    Object? quizItem = freezed,
    Object? quizItemList = null,
    Object? scoreCount = null,
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
      quizIndex: null == quizIndex
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctList: null == correctList
          ? _value._correctList
          : correctList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      incorrectList: null == incorrectList
          ? _value._incorrectList
          : incorrectList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      reviewList: null == reviewList
          ? _value._reviewList
          : reviewList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      quizItem: freezed == quizItem
          ? _value.quizItem
          : quizItem // ignore: cast_nullable_to_non_nullable
              as QuizItemState?,
      quizItemList: null == quizItemList
          ? _value._quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItemState>,
      scoreCount: null == scoreCount
          ? _value.scoreCount
          : scoreCount // ignore: cast_nullable_to_non_nullable
              as int,
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
      final List<String> choices = const [],
      final List<QuizState> correctList = const [],
      final List<QuizState> incorrectList = const [],
      final List<QuizState> reviewList = const [],
      this.quizItem,
      final List<QuizItemState> quizItemList = const [],
      this.scoreCount = 0})
      : _choices = choices,
        _correctList = correctList,
        _incorrectList = incorrectList,
        _reviewList = reviewList,
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
  @JsonKey()
  final int quizIndex;
//問題番号
  final List<String> _choices;
//問題番号
  @override
  @JsonKey()
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

//選択肢
  final List<QuizState> _correctList;
//選択肢
  @override
  @JsonKey()
  List<QuizState> get correctList {
    if (_correctList is EqualUnmodifiableListView) return _correctList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctList);
  }

//正解リスト
  final List<QuizState> _incorrectList;
//正解リスト
  @override
  @JsonKey()
  List<QuizState> get incorrectList {
    if (_incorrectList is EqualUnmodifiableListView) return _incorrectList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incorrectList);
  }

//不正解リスト
  final List<QuizState> _reviewList;
//不正解リスト
  @override
  @JsonKey()
  List<QuizState> get reviewList {
    if (_reviewList is EqualUnmodifiableListView) return _reviewList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewList);
  }

//復習リスト
  @override
  final QuizItemState? quizItem;
  final List<QuizItemState> _quizItemList;
  @override
  @JsonKey()
  List<QuizItemState> get quizItemList {
    if (_quizItemList is EqualUnmodifiableListView) return _quizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizItemList);
  }

  @override
  @JsonKey()
  final int scoreCount;

  @override
  String toString() {
    return 'QuizChoiceScreenState(isAnsView: $isAnsView, isJudge: $isJudge, isResultScreen: $isResultScreen, quizIndex: $quizIndex, choices: $choices, correctList: $correctList, incorrectList: $incorrectList, reviewList: $reviewList, quizItem: $quizItem, quizItemList: $quizItemList, scoreCount: $scoreCount)';
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
            (identical(other.quizIndex, quizIndex) ||
                other.quizIndex == quizIndex) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            const DeepCollectionEquality()
                .equals(other._correctList, _correctList) &&
            const DeepCollectionEquality()
                .equals(other._incorrectList, _incorrectList) &&
            const DeepCollectionEquality()
                .equals(other._reviewList, _reviewList) &&
            (identical(other.quizItem, quizItem) ||
                other.quizItem == quizItem) &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            (identical(other.scoreCount, scoreCount) ||
                other.scoreCount == scoreCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAnsView,
      isJudge,
      isResultScreen,
      quizIndex,
      const DeepCollectionEquality().hash(_choices),
      const DeepCollectionEquality().hash(_correctList),
      const DeepCollectionEquality().hash(_incorrectList),
      const DeepCollectionEquality().hash(_reviewList),
      quizItem,
      const DeepCollectionEquality().hash(_quizItemList),
      scoreCount);

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
      final int quizIndex,
      final List<String> choices,
      final List<QuizState> correctList,
      final List<QuizState> incorrectList,
      final List<QuizState> reviewList,
      final QuizItemState? quizItem,
      final List<QuizItemState> quizItemList,
      final int scoreCount}) = _$_Create;
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
  List<QuizState> get correctList;
  @override //正解リスト
  List<QuizState> get incorrectList;
  @override //不正解リスト
  List<QuizState> get reviewList;
  @override //復習リスト
  QuizItemState? get quizItem;
  @override
  List<QuizItemState> get quizItemList;
  @override
  int get scoreCount;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
