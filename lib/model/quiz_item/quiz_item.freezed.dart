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
  String get word => throw _privateConstructorUsedError; //単語
  String get comment => throw _privateConstructorUsedError; //解説
  String get question => throw _privateConstructorUsedError; //問題文
  String get ans => throw _privateConstructorUsedError; //答え
  List<String> get choices => throw _privateConstructorUsedError; //選択肢
  String get source => throw _privateConstructorUsedError; //出典
  bool get isWeak => throw _privateConstructorUsedError; //苦手か？
  bool get isSaved => throw _privateConstructorUsedError; //保存したか?
  bool get isKnow => throw _privateConstructorUsedError; //知っているか？
  StatusType get status => throw _privateConstructorUsedError; //クイズの状態
  ImportanceType get importance => throw _privateConstructorUsedError; //重要度
  int get lapIndex => throw _privateConstructorUsedError; //何周目か？
  bool get isPremium => throw _privateConstructorUsedError;

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
      String word,
      String comment,
      String question,
      String ans,
      List<String> choices,
      String source,
      bool isWeak,
      bool isSaved,
      bool isKnow,
      StatusType status,
      ImportanceType importance,
      int lapIndex,
      bool isPremium});
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
    Object? word = null,
    Object? comment = null,
    Object? question = null,
    Object? ans = null,
    Object? choices = null,
    Object? source = null,
    Object? isWeak = null,
    Object? isSaved = null,
    Object? isKnow = null,
    Object? status = null,
    Object? importance = null,
    Object? lapIndex = null,
    Object? isPremium = null,
  }) {
    return _then(_value.copyWith(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      ans: null == ans
          ? _value.ans
          : ans // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      isWeak: null == isWeak
          ? _value.isWeak
          : isWeak // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      isKnow: null == isKnow
          ? _value.isKnow
          : isKnow // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as ImportanceType,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
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
      String word,
      String comment,
      String question,
      String ans,
      List<String> choices,
      String source,
      bool isWeak,
      bool isSaved,
      bool isKnow,
      StatusType status,
      ImportanceType importance,
      int lapIndex,
      bool isPremium});
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
    Object? word = null,
    Object? comment = null,
    Object? question = null,
    Object? ans = null,
    Object? choices = null,
    Object? source = null,
    Object? isWeak = null,
    Object? isSaved = null,
    Object? isKnow = null,
    Object? status = null,
    Object? importance = null,
    Object? lapIndex = null,
    Object? isPremium = null,
  }) {
    return _then(_$_QuizItem(
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      ans: null == ans
          ? _value.ans
          : ans // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      isWeak: null == isWeak
          ? _value.isWeak
          : isWeak // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      isKnow: null == isKnow
          ? _value.isKnow
          : isKnow // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      importance: null == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as ImportanceType,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizItem extends _QuizItem {
  _$_QuizItem(
      {this.quizId = 0,
      this.word = '',
      this.comment = '',
      this.question = '',
      this.ans = '',
      final List<String> choices = const [],
      this.source = '',
      this.isWeak = false,
      this.isSaved = false,
      this.isKnow = false,
      this.status = StatusType.unlearned,
      this.importance = ImportanceType.normal,
      this.lapIndex = 0,
      this.isPremium = true})
      : _choices = choices,
        super._();

  factory _$_QuizItem.fromJson(Map<String, dynamic> json) =>
      _$$_QuizItemFromJson(json);

  @override
  @JsonKey()
  final int quizId;
//問題番号
  @override
  @JsonKey()
  final String word;
//単語
  @override
  @JsonKey()
  final String comment;
//解説
  @override
  @JsonKey()
  final String question;
//問題文
  @override
  @JsonKey()
  final String ans;
//答え
  final List<String> _choices;
//答え
  @override
  @JsonKey()
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

//選択肢
  @override
  @JsonKey()
  final String source;
//出典
  @override
  @JsonKey()
  final bool isWeak;
//苦手か？
  @override
  @JsonKey()
  final bool isSaved;
//保存したか?
  @override
  @JsonKey()
  final bool isKnow;
//知っているか？
  @override
  @JsonKey()
  final StatusType status;
//クイズの状態
  @override
  @JsonKey()
  final ImportanceType importance;
//重要度
  @override
  @JsonKey()
  final int lapIndex;
//何周目か？
  @override
  @JsonKey()
  final bool isPremium;

  @override
  String toString() {
    return 'QuizItem(quizId: $quizId, word: $word, comment: $comment, question: $question, ans: $ans, choices: $choices, source: $source, isWeak: $isWeak, isSaved: $isSaved, isKnow: $isKnow, status: $status, importance: $importance, lapIndex: $lapIndex, isPremium: $isPremium)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizItem &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.ans, ans) || other.ans == ans) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.isWeak, isWeak) || other.isWeak == isWeak) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isKnow, isKnow) || other.isKnow == isKnow) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.importance, importance) ||
                other.importance == importance) &&
            (identical(other.lapIndex, lapIndex) ||
                other.lapIndex == lapIndex) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quizId,
      word,
      comment,
      question,
      ans,
      const DeepCollectionEquality().hash(_choices),
      source,
      isWeak,
      isSaved,
      isKnow,
      status,
      importance,
      lapIndex,
      isPremium);

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
      {final int quizId,
      final String word,
      final String comment,
      final String question,
      final String ans,
      final List<String> choices,
      final String source,
      final bool isWeak,
      final bool isSaved,
      final bool isKnow,
      final StatusType status,
      final ImportanceType importance,
      final int lapIndex,
      final bool isPremium}) = _$_QuizItem;
  _QuizItem._() : super._();

  factory _QuizItem.fromJson(Map<String, dynamic> json) = _$_QuizItem.fromJson;

  @override
  int get quizId;
  @override //問題番号
  String get word;
  @override //単語
  String get comment;
  @override //解説
  String get question;
  @override //問題文
  String get ans;
  @override //答え
  List<String> get choices;
  @override //選択肢
  String get source;
  @override //出典
  bool get isWeak;
  @override //苦手か？
  bool get isSaved;
  @override //保存したか?
  bool get isKnow;
  @override //知っているか？
  StatusType get status;
  @override //クイズの状態
  ImportanceType get importance;
  @override //重要度
  int get lapIndex;
  @override //何周目か？
  bool get isPremium;
  @override
  @JsonKey(ignore: true)
  _$$_QuizItemCopyWith<_$_QuizItem> get copyWith =>
      throw _privateConstructorUsedError;
}
