// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizState _$QuizStateFromJson(Map<String, dynamic> json) {
  return _QuizState.fromJson(json);
}

/// @nodoc
mixin _$QuizState {
  int get quizId => throw _privateConstructorUsedError; //問題番号
  String get question => throw _privateConstructorUsedError; //問題文
  String get ans => throw _privateConstructorUsedError; //答え
  String get comment => throw _privateConstructorUsedError; //解説
  bool get isWeak => throw _privateConstructorUsedError; //苦手か？
  bool get isJudge => throw _privateConstructorUsedError; //正解したか?
  List<String> get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizStateCopyWith<QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res, QuizState>;
  @useResult
  $Res call(
      {int quizId,
      String question,
      String ans,
      String comment,
      bool isWeak,
      bool isJudge,
      List<String> choices});
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

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
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$$_QuizStateCopyWith(
          _$_QuizState value, $Res Function(_$_QuizState) then) =
      __$$_QuizStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quizId,
      String question,
      String ans,
      String comment,
      bool isWeak,
      bool isJudge,
      List<String> choices});
}

/// @nodoc
class __$$_QuizStateCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$_QuizState>
    implements _$$_QuizStateCopyWith<$Res> {
  __$$_QuizStateCopyWithImpl(
      _$_QuizState _value, $Res Function(_$_QuizState) _then)
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
    Object? choices = null,
  }) {
    return _then(_$_QuizState(
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
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizState implements _QuizState {
  const _$_QuizState(
      {required this.quizId,
      required this.question,
      required this.ans,
      required this.comment,
      required this.isWeak,
      required this.isJudge,
      required final List<String> choices})
      : _choices = choices;

  factory _$_QuizState.fromJson(Map<String, dynamic> json) =>
      _$$_QuizStateFromJson(json);

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
  final List<String> _choices;
//正解したか?
  @override
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'QuizState(quizId: $quizId, question: $question, ans: $ans, comment: $comment, isWeak: $isWeak, isJudge: $isJudge, choices: $choices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizState &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.ans, ans) || other.ans == ans) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.isWeak, isWeak) || other.isWeak == isWeak) &&
            (identical(other.isJudge, isJudge) || other.isJudge == isJudge) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quizId, question, ans, comment,
      isWeak, isJudge, const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizStateCopyWith<_$_QuizState> get copyWith =>
      __$$_QuizStateCopyWithImpl<_$_QuizState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizStateToJson(
      this,
    );
  }
}

abstract class _QuizState implements QuizState {
  const factory _QuizState(
      {required final int quizId,
      required final String question,
      required final String ans,
      required final String comment,
      required final bool isWeak,
      required final bool isJudge,
      required final List<String> choices}) = _$_QuizState;

  factory _QuizState.fromJson(Map<String, dynamic> json) =
      _$_QuizState.fromJson;

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
  List<String> get choices;
  @override
  @JsonKey(ignore: true)
  _$$_QuizStateCopyWith<_$_QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}
