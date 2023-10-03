// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quizzes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quizzes _$QuizzesFromJson(Map<String, dynamic> json) {
  return _Quizzes.fromJson(json);
}

/// @nodoc
mixin _$Quizzes {
  List<Quiz> get quizList => throw _privateConstructorUsedError; //クイズ一覧
  List<Quiz> get historyQuizList =>
      throw _privateConstructorUsedError; //学習したクイズリスト一覧
  List<QuizItem> get quizItemList => throw _privateConstructorUsedError;
  Quiz get dailyQuiz => throw _privateConstructorUsedError; //今日のクイズ
  Quiz get weakQuiz => throw _privateConstructorUsedError; //苦手克服
  Quiz get testQuiz => throw _privateConstructorUsedError; //テストクイズ
  int get selectQuizIndex => throw _privateConstructorUsedError; //選択したクイズ
  QuizType get quizType => throw _privateConstructorUsedError; //クイズタイプ
  StudyType get studyType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizzesCopyWith<Quizzes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizzesCopyWith<$Res> {
  factory $QuizzesCopyWith(Quizzes value, $Res Function(Quizzes) then) =
      _$QuizzesCopyWithImpl<$Res, Quizzes>;
  @useResult
  $Res call(
      {List<Quiz> quizList,
      List<Quiz> historyQuizList,
      List<QuizItem> quizItemList,
      Quiz dailyQuiz,
      Quiz weakQuiz,
      Quiz testQuiz,
      int selectQuizIndex,
      QuizType quizType,
      StudyType studyType});

  $QuizCopyWith<$Res> get dailyQuiz;
  $QuizCopyWith<$Res> get weakQuiz;
  $QuizCopyWith<$Res> get testQuiz;
}

/// @nodoc
class _$QuizzesCopyWithImpl<$Res, $Val extends Quizzes>
    implements $QuizzesCopyWith<$Res> {
  _$QuizzesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizList = null,
    Object? historyQuizList = null,
    Object? quizItemList = null,
    Object? dailyQuiz = null,
    Object? weakQuiz = null,
    Object? testQuiz = null,
    Object? selectQuizIndex = null,
    Object? quizType = null,
    Object? studyType = null,
  }) {
    return _then(_value.copyWith(
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      historyQuizList: null == historyQuizList
          ? _value.historyQuizList
          : historyQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      quizItemList: null == quizItemList
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      dailyQuiz: null == dailyQuiz
          ? _value.dailyQuiz
          : dailyQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      weakQuiz: null == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      testQuiz: null == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      selectQuizIndex: null == selectQuizIndex
          ? _value.selectQuizIndex
          : selectQuizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: null == quizType
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as QuizType,
      studyType: null == studyType
          ? _value.studyType
          : studyType // ignore: cast_nullable_to_non_nullable
              as StudyType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res> get dailyQuiz {
    return $QuizCopyWith<$Res>(_value.dailyQuiz, (value) {
      return _then(_value.copyWith(dailyQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res> get weakQuiz {
    return $QuizCopyWith<$Res>(_value.weakQuiz, (value) {
      return _then(_value.copyWith(weakQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res> get testQuiz {
    return $QuizCopyWith<$Res>(_value.testQuiz, (value) {
      return _then(_value.copyWith(testQuiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizzesCopyWith<$Res> implements $QuizzesCopyWith<$Res> {
  factory _$$_QuizzesCopyWith(
          _$_Quizzes value, $Res Function(_$_Quizzes) then) =
      __$$_QuizzesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Quiz> quizList,
      List<Quiz> historyQuizList,
      List<QuizItem> quizItemList,
      Quiz dailyQuiz,
      Quiz weakQuiz,
      Quiz testQuiz,
      int selectQuizIndex,
      QuizType quizType,
      StudyType studyType});

  @override
  $QuizCopyWith<$Res> get dailyQuiz;
  @override
  $QuizCopyWith<$Res> get weakQuiz;
  @override
  $QuizCopyWith<$Res> get testQuiz;
}

/// @nodoc
class __$$_QuizzesCopyWithImpl<$Res>
    extends _$QuizzesCopyWithImpl<$Res, _$_Quizzes>
    implements _$$_QuizzesCopyWith<$Res> {
  __$$_QuizzesCopyWithImpl(_$_Quizzes _value, $Res Function(_$_Quizzes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizList = null,
    Object? historyQuizList = null,
    Object? quizItemList = null,
    Object? dailyQuiz = null,
    Object? weakQuiz = null,
    Object? testQuiz = null,
    Object? selectQuizIndex = null,
    Object? quizType = null,
    Object? studyType = null,
  }) {
    return _then(_$_Quizzes(
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      historyQuizList: null == historyQuizList
          ? _value._historyQuizList
          : historyQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      quizItemList: null == quizItemList
          ? _value._quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      dailyQuiz: null == dailyQuiz
          ? _value.dailyQuiz
          : dailyQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      weakQuiz: null == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      testQuiz: null == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      selectQuizIndex: null == selectQuizIndex
          ? _value.selectQuizIndex
          : selectQuizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: null == quizType
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as QuizType,
      studyType: null == studyType
          ? _value.studyType
          : studyType // ignore: cast_nullable_to_non_nullable
              as StudyType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quizzes extends _Quizzes {
  _$_Quizzes(
      {final List<Quiz> quizList = const [],
      final List<Quiz> historyQuizList = const [],
      final List<QuizItem> quizItemList = const [],
      this.dailyQuiz = initDailyQuiz,
      this.weakQuiz = initWeakQuiz,
      this.testQuiz = initTestQuiz,
      this.selectQuizIndex = 0,
      this.quizType = QuizType.study,
      this.studyType = StudyType.learn})
      : _quizList = quizList,
        _historyQuizList = historyQuizList,
        _quizItemList = quizItemList,
        super._();

  factory _$_Quizzes.fromJson(Map<String, dynamic> json) =>
      _$$_QuizzesFromJson(json);

  final List<Quiz> _quizList;
  @override
  @JsonKey()
  List<Quiz> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

//クイズ一覧
  final List<Quiz> _historyQuizList;
//クイズ一覧
  @override
  @JsonKey()
  List<Quiz> get historyQuizList {
    if (_historyQuizList is EqualUnmodifiableListView) return _historyQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyQuizList);
  }

//学習したクイズリスト一覧
  final List<QuizItem> _quizItemList;
//学習したクイズリスト一覧
  @override
  @JsonKey()
  List<QuizItem> get quizItemList {
    if (_quizItemList is EqualUnmodifiableListView) return _quizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizItemList);
  }

  @override
  @JsonKey()
  final Quiz dailyQuiz;
//今日のクイズ
  @override
  @JsonKey()
  final Quiz weakQuiz;
//苦手克服
  @override
  @JsonKey()
  final Quiz testQuiz;
//テストクイズ
  @override
  @JsonKey()
  final int selectQuizIndex;
//選択したクイズ
  @override
  @JsonKey()
  final QuizType quizType;
//クイズタイプ
  @override
  @JsonKey()
  final StudyType studyType;

  @override
  String toString() {
    return 'Quizzes(quizList: $quizList, historyQuizList: $historyQuizList, quizItemList: $quizItemList, dailyQuiz: $dailyQuiz, weakQuiz: $weakQuiz, testQuiz: $testQuiz, selectQuizIndex: $selectQuizIndex, quizType: $quizType, studyType: $studyType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quizzes &&
            const DeepCollectionEquality().equals(other._quizList, _quizList) &&
            const DeepCollectionEquality()
                .equals(other._historyQuizList, _historyQuizList) &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            (identical(other.dailyQuiz, dailyQuiz) ||
                other.dailyQuiz == dailyQuiz) &&
            (identical(other.weakQuiz, weakQuiz) ||
                other.weakQuiz == weakQuiz) &&
            (identical(other.testQuiz, testQuiz) ||
                other.testQuiz == testQuiz) &&
            (identical(other.selectQuizIndex, selectQuizIndex) ||
                other.selectQuizIndex == selectQuizIndex) &&
            (identical(other.quizType, quizType) ||
                other.quizType == quizType) &&
            (identical(other.studyType, studyType) ||
                other.studyType == studyType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_quizList),
      const DeepCollectionEquality().hash(_historyQuizList),
      const DeepCollectionEquality().hash(_quizItemList),
      dailyQuiz,
      weakQuiz,
      testQuiz,
      selectQuizIndex,
      quizType,
      studyType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizzesCopyWith<_$_Quizzes> get copyWith =>
      __$$_QuizzesCopyWithImpl<_$_Quizzes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizzesToJson(
      this,
    );
  }
}

abstract class _Quizzes extends Quizzes {
  factory _Quizzes(
      {final List<Quiz> quizList,
      final List<Quiz> historyQuizList,
      final List<QuizItem> quizItemList,
      final Quiz dailyQuiz,
      final Quiz weakQuiz,
      final Quiz testQuiz,
      final int selectQuizIndex,
      final QuizType quizType,
      final StudyType studyType}) = _$_Quizzes;
  _Quizzes._() : super._();

  factory _Quizzes.fromJson(Map<String, dynamic> json) = _$_Quizzes.fromJson;

  @override
  List<Quiz> get quizList;
  @override //クイズ一覧
  List<Quiz> get historyQuizList;
  @override //学習したクイズリスト一覧
  List<QuizItem> get quizItemList;
  @override
  Quiz get dailyQuiz;
  @override //今日のクイズ
  Quiz get weakQuiz;
  @override //苦手克服
  Quiz get testQuiz;
  @override //テストクイズ
  int get selectQuizIndex;
  @override //選択したクイズ
  QuizType get quizType;
  @override //クイズタイプ
  StudyType get studyType;
  @override
  @JsonKey(ignore: true)
  _$$_QuizzesCopyWith<_$_Quizzes> get copyWith =>
      throw _privateConstructorUsedError;
}
