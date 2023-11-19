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
  int get selectQuizId => throw _privateConstructorUsedError; //選択したクイズ
  List<Quiz> get quizList => throw _privateConstructorUsedError; //クイズ一覧
  List<Quiz> get historyQuizList =>
      throw _privateConstructorUsedError; //学習したクイズリスト一覧
  List<QuizItem> get quizItemList => throw _privateConstructorUsedError;
  Quiz? get weakQuiz => throw _privateConstructorUsedError; //苦手克服
  Quiz? get testQuiz => throw _privateConstructorUsedError; //テストクイズ
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
      {int selectQuizId,
      List<Quiz> quizList,
      List<Quiz> historyQuizList,
      List<QuizItem> quizItemList,
      Quiz? weakQuiz,
      Quiz? testQuiz,
      QuizType quizType,
      StudyType studyType});

  $QuizCopyWith<$Res>? get weakQuiz;
  $QuizCopyWith<$Res>? get testQuiz;
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
    Object? selectQuizId = null,
    Object? quizList = null,
    Object? historyQuizList = null,
    Object? quizItemList = null,
    Object? weakQuiz = freezed,
    Object? testQuiz = freezed,
    Object? quizType = null,
    Object? studyType = null,
  }) {
    return _then(_value.copyWith(
      selectQuizId: null == selectQuizId
          ? _value.selectQuizId
          : selectQuizId // ignore: cast_nullable_to_non_nullable
              as int,
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
      weakQuiz: freezed == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      testQuiz: freezed == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
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
abstract class _$$_QuizzesCopyWith<$Res> implements $QuizzesCopyWith<$Res> {
  factory _$$_QuizzesCopyWith(
          _$_Quizzes value, $Res Function(_$_Quizzes) then) =
      __$$_QuizzesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectQuizId,
      List<Quiz> quizList,
      List<Quiz> historyQuizList,
      List<QuizItem> quizItemList,
      Quiz? weakQuiz,
      Quiz? testQuiz,
      QuizType quizType,
      StudyType studyType});

  @override
  $QuizCopyWith<$Res>? get weakQuiz;
  @override
  $QuizCopyWith<$Res>? get testQuiz;
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
    Object? selectQuizId = null,
    Object? quizList = null,
    Object? historyQuizList = null,
    Object? quizItemList = null,
    Object? weakQuiz = freezed,
    Object? testQuiz = freezed,
    Object? quizType = null,
    Object? studyType = null,
  }) {
    return _then(_$_Quizzes(
      selectQuizId: null == selectQuizId
          ? _value.selectQuizId
          : selectQuizId // ignore: cast_nullable_to_non_nullable
              as int,
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
      weakQuiz: freezed == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      testQuiz: freezed == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
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
      {this.selectQuizId = 0,
      final List<Quiz> quizList = const [],
      final List<Quiz> historyQuizList = const [],
      final List<QuizItem> quizItemList = const [],
      this.weakQuiz,
      this.testQuiz,
      this.quizType = QuizType.study,
      this.studyType = StudyType.learn})
      : _quizList = quizList,
        _historyQuizList = historyQuizList,
        _quizItemList = quizItemList,
        super._();

  factory _$_Quizzes.fromJson(Map<String, dynamic> json) =>
      _$$_QuizzesFromJson(json);

  @override
  @JsonKey()
  final int selectQuizId;
//選択したクイズ
  final List<Quiz> _quizList;
//選択したクイズ
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
  final Quiz? weakQuiz;
//苦手克服
  @override
  final Quiz? testQuiz;
//テストクイズ
  @override
  @JsonKey()
  final QuizType quizType;
//クイズタイプ
  @override
  @JsonKey()
  final StudyType studyType;

  @override
  String toString() {
    return 'Quizzes(selectQuizId: $selectQuizId, quizList: $quizList, historyQuizList: $historyQuizList, quizItemList: $quizItemList, weakQuiz: $weakQuiz, testQuiz: $testQuiz, quizType: $quizType, studyType: $studyType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quizzes &&
            (identical(other.selectQuizId, selectQuizId) ||
                other.selectQuizId == selectQuizId) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList) &&
            const DeepCollectionEquality()
                .equals(other._historyQuizList, _historyQuizList) &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            (identical(other.weakQuiz, weakQuiz) ||
                other.weakQuiz == weakQuiz) &&
            (identical(other.testQuiz, testQuiz) ||
                other.testQuiz == testQuiz) &&
            (identical(other.quizType, quizType) ||
                other.quizType == quizType) &&
            (identical(other.studyType, studyType) ||
                other.studyType == studyType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectQuizId,
      const DeepCollectionEquality().hash(_quizList),
      const DeepCollectionEquality().hash(_historyQuizList),
      const DeepCollectionEquality().hash(_quizItemList),
      weakQuiz,
      testQuiz,
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
      {final int selectQuizId,
      final List<Quiz> quizList,
      final List<Quiz> historyQuizList,
      final List<QuizItem> quizItemList,
      final Quiz? weakQuiz,
      final Quiz? testQuiz,
      final QuizType quizType,
      final StudyType studyType}) = _$_Quizzes;
  _Quizzes._() : super._();

  factory _Quizzes.fromJson(Map<String, dynamic> json) = _$_Quizzes.fromJson;

  @override
  int get selectQuizId;
  @override //選択したクイズ
  List<Quiz> get quizList;
  @override //クイズ一覧
  List<Quiz> get historyQuizList;
  @override //学習したクイズリスト一覧
  List<QuizItem> get quizItemList;
  @override
  Quiz? get weakQuiz;
  @override //苦手克服
  Quiz? get testQuiz;
  @override //テストクイズ
  QuizType get quizType;
  @override //クイズタイプ
  StudyType get studyType;
  @override
  @JsonKey(ignore: true)
  _$$_QuizzesCopyWith<_$_Quizzes> get copyWith =>
      throw _privateConstructorUsedError;
}
