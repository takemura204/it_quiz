// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizItem _$QuizItemFromJson(Map<String, dynamic> json) {
  return _QuizItem.fromJson(json);
}

/// @nodoc
mixin _$QuizItem {
  int get quizId => throw _privateConstructorUsedError; //問題番号
  String get question => throw _privateConstructorUsedError; //問題文
  String get ans => throw _privateConstructorUsedError; //答え
  String get comment => throw _privateConstructorUsedError; //解説
  bool get isWeak => throw _privateConstructorUsedError; //苦手か？
  bool get isJudge => throw _privateConstructorUsedError; //正解したか?
  bool get isSaved => throw _privateConstructorUsedError; //保存したか?
  int get lapIndex => throw _privateConstructorUsedError; //何周目か？
  List<String> get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizItemCopyWith<QuizItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizItemCopyWith<$Res> {
  factory $QuizItemCopyWith(QuizItem value, $Res Function(QuizItem) then) =
      _$QuizItemCopyWithImpl<$Res, QuizItem>;
  @useResult
  $Res call(
      {int quizId,
      String question,
      String ans,
      String comment,
      bool isWeak,
      bool isJudge,
      bool isSaved,
      int lapIndex,
      List<String> choices});
}

/// @nodoc
class _$QuizItemCopyWithImpl<$Res, $Val extends QuizItem>
    implements $QuizItemCopyWith<$Res> {
  _$QuizItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? question = null,
    Object? ans = null,
    Object? comment = null,
    Object? isWeak = null,
    Object? isJudge = null,
    Object? isSaved = null,
    Object? lapIndex = null,
    Object? choices = null,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      ans: null == ans
          ? _value.ans
          : ans // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isWeak: null == isWeak
          ? _value.isWeak
          : isWeak // ignore: cast_nullable_to_non_nullable
              as bool,
      isJudge: null == isJudge
          ? _value.isJudge
          : isJudge // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizItemCopyWith<$Res> implements $QuizItemCopyWith<$Res> {
  factory _$$_QuizItemCopyWith(
          _$_QuizItem value, $Res Function(_$_QuizItem) then) =
      __$$_QuizItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quizId,
      String question,
      String ans,
      String comment,
      bool isWeak,
      bool isJudge,
      bool isSaved,
      int lapIndex,
      List<String> choices});
}

/// @nodoc
class __$$_QuizItemCopyWithImpl<$Res>
    extends _$QuizItemCopyWithImpl<$Res, _$_QuizItem>
    implements _$$_QuizItemCopyWith<$Res> {
  __$$_QuizItemCopyWithImpl(
      _$_QuizItem _value, $Res Function(_$_QuizItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizId = null,
    Object? question = null,
    Object? ans = null,
    Object? comment = null,
    Object? isWeak = null,
    Object? isJudge = null,
    Object? isSaved = null,
    Object? lapIndex = null,
    Object? choices = null,
  }) {
    return _then(_$_QuizItem(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      ans: null == ans
          ? _value.ans
          : ans // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isWeak: null == isWeak
          ? _value.isWeak
          : isWeak // ignore: cast_nullable_to_non_nullable
              as bool,
      isJudge: null == isJudge
          ? _value.isJudge
          : isJudge // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizItem extends _QuizItem {
  _$_QuizItem(
      {required this.quizId,
      required this.question,
      required this.ans,
      required this.comment,
      required this.isWeak,
      required this.isJudge,
      required this.isSaved,
      required this.lapIndex,
      required final List<String> choices})
      : _choices = choices,
        super._();

  factory _$_QuizItem.fromJson(Map<String, dynamic> json) =>
      _$$_QuizItemFromJson(json);

  @override
  final int quizId;
//問題番号
  @override
  final String question;
//問題文
  @override
  final String ans;
//答え
  @override
  final String comment;
//解説
  @override
  final bool isWeak;
//苦手か？
  @override
  final bool isJudge;
//正解したか?
  @override
  final bool isSaved;
//保存したか?
  @override
  final int lapIndex;
//何周目か？
  final List<String> _choices;
//何周目か？
  @override
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'QuizItem(quizId: $quizId, question: $question, ans: $ans, comment: $comment, isWeak: $isWeak, isJudge: $isJudge, isSaved: $isSaved, lapIndex: $lapIndex, choices: $choices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizItem &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.ans, ans) || other.ans == ans) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.isWeak, isWeak) || other.isWeak == isWeak) &&
            (identical(other.isJudge, isJudge) || other.isJudge == isJudge) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.lapIndex, lapIndex) ||
                other.lapIndex == lapIndex) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizId,
      question,
      ans,
      comment,
      isWeak,
      isJudge,
      isSaved,
      lapIndex,
      const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizItemCopyWith<_$_QuizItem> get copyWith =>
      __$$_QuizItemCopyWithImpl<_$_QuizItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizItemToJson(
      this,
    );
  }
}

abstract class _QuizItem extends QuizItem {
  factory _QuizItem(
      {required final int quizId,
      required final String question,
      required final String ans,
      required final String comment,
      required final bool isWeak,
      required final bool isJudge,
      required final bool isSaved,
      required final int lapIndex,
      required final List<String> choices}) = _$_QuizItem;
  _QuizItem._() : super._();

  factory _QuizItem.fromJson(Map<String, dynamic> json) = _$_QuizItem.fromJson;

  @override
  int get quizId;
  @override //問題番号
  String get question;
  @override //問題文
  String get ans;
  @override //答え
  String get comment;
  @override //解説
  bool get isWeak;
  @override //苦手か？
  bool get isJudge;
  @override //正解したか?
  bool get isSaved;
  @override //保存したか?
  int get lapIndex;
  @override //何周目か？
  List<String> get choices;
  @override
  @JsonKey(ignore: true)
  _$$_QuizItemCopyWith<_$_QuizItem> get copyWith =>
      throw _privateConstructorUsedError;
}
