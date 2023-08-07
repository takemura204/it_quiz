// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  int get id => throw _privateConstructorUsedError; //問題ID
  String get category => throw _privateConstructorUsedError; //問題のジャンル別に分ける
  String get title => throw _privateConstructorUsedError; //問題タイトル
  bool get isCompleted => throw _privateConstructorUsedError; //全て問題を解いたか
  List<QuizItem> get quizItemList => throw _privateConstructorUsedError; //クイズ一覧
  int get correctNum => throw _privateConstructorUsedError; //正解数
  DateTime? get timeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {int id,
      String category,
      String title,
      bool isCompleted,
      List<QuizItem> quizItemList,
      int correctNum,
      DateTime? timeStamp});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? quizItemList = null,
    Object? correctNum = null,
    Object? timeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      quizItemList: null == quizItemList
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      correctNum: null == correctNum
          ? _value.correctNum
          : correctNum // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$_QuizCopyWith(_$_Quiz value, $Res Function(_$_Quiz) then) =
      __$$_QuizCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String category,
      String title,
      bool isCompleted,
      List<QuizItem> quizItemList,
      int correctNum,
      DateTime? timeStamp});
}

/// @nodoc
class __$$_QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res, _$_Quiz>
    implements _$$_QuizCopyWith<$Res> {
  __$$_QuizCopyWithImpl(_$_Quiz _value, $Res Function(_$_Quiz) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? quizItemList = null,
    Object? correctNum = null,
    Object? timeStamp = freezed,
  }) {
    return _then(_$_Quiz(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      quizItemList: null == quizItemList
          ? _value._quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      correctNum: null == correctNum
          ? _value.correctNum
          : correctNum // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quiz extends _Quiz {
  _$_Quiz(
      {required this.id,
      required this.category,
      required this.title,
      required this.isCompleted,
      required final List<QuizItem> quizItemList,
      required this.correctNum,
      required this.timeStamp})
      : _quizItemList = quizItemList,
        super._();

  factory _$_Quiz.fromJson(Map<String, dynamic> json) => _$$_QuizFromJson(json);

  @override
  final int id;
//問題ID
  @override
  final String category;
//問題のジャンル別に分ける
  @override
  final String title;
//問題タイトル
  @override
  final bool isCompleted;
//全て問題を解いたか
  final List<QuizItem> _quizItemList;
//全て問題を解いたか
  @override
  List<QuizItem> get quizItemList {
    if (_quizItemList is EqualUnmodifiableListView) return _quizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizItemList);
  }

//クイズ一覧
  @override
  final int correctNum;
//正解数
  @override
  final DateTime? timeStamp;

  @override
  String toString() {
    return 'Quiz(id: $id, category: $category, title: $title, isCompleted: $isCompleted, quizItemList: $quizItemList, correctNum: $correctNum, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quiz &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            (identical(other.correctNum, correctNum) ||
                other.correctNum == correctNum) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      title,
      isCompleted,
      const DeepCollectionEquality().hash(_quizItemList),
      correctNum,
      timeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizCopyWith<_$_Quiz> get copyWith =>
      __$$_QuizCopyWithImpl<_$_Quiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizToJson(
      this,
    );
  }
}

abstract class _Quiz extends Quiz {
  factory _Quiz(
      {required final int id,
      required final String category,
      required final String title,
      required final bool isCompleted,
      required final List<QuizItem> quizItemList,
      required final int correctNum,
      required final DateTime? timeStamp}) = _$_Quiz;
  _Quiz._() : super._();

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$_Quiz.fromJson;

  @override
  int get id;
  @override //問題ID
  String get category;
  @override //問題のジャンル別に分ける
  String get title;
  @override //問題タイトル
  bool get isCompleted;
  @override //全て問題を解いたか
  List<QuizItem> get quizItemList;
  @override //クイズ一覧
  int get correctNum;
  @override //正解数
  DateTime? get timeStamp;
  @override
  @JsonKey(ignore: true)
  _$$_QuizCopyWith<_$_Quiz> get copyWith => throw _privateConstructorUsedError;
}