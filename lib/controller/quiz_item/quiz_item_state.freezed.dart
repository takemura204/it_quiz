// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizItemState _$QuizItemStateFromJson(Map<String, dynamic> json) {
  return _QuizItemState.fromJson(json);
}

/// @nodoc
mixin _$QuizItemState {
  int get id => throw _privateConstructorUsedError; //問題ID
  String get group => throw _privateConstructorUsedError; //問題のジャンル別に分ける
  String get title => throw _privateConstructorUsedError; //問題タイトル
  bool get isCompleted => throw _privateConstructorUsedError; //全て問題を解いたか
  List<QuizState> get quizList => throw _privateConstructorUsedError; //クイズ一覧
  int get score => throw _privateConstructorUsedError; //正解数
  DateTime? get timeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizItemStateCopyWith<QuizItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizItemStateCopyWith<$Res> {
  factory $QuizItemStateCopyWith(
          QuizItemState value, $Res Function(QuizItemState) then) =
      _$QuizItemStateCopyWithImpl<$Res, QuizItemState>;
  @useResult
  $Res call(
      {int id,
      String group,
      String title,
      bool isCompleted,
      List<QuizState> quizList,
      int score,
      DateTime? timeStamp});
}

/// @nodoc
class _$QuizItemStateCopyWithImpl<$Res, $Val extends QuizItemState>
    implements $QuizItemStateCopyWith<$Res> {
  _$QuizItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? group = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? quizList = null,
    Object? score = null,
    Object? timeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizItemStateCopyWith<$Res>
    implements $QuizItemStateCopyWith<$Res> {
  factory _$$_QuizItemStateCopyWith(
          _$_QuizItemState value, $Res Function(_$_QuizItemState) then) =
      __$$_QuizItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String group,
      String title,
      bool isCompleted,
      List<QuizState> quizList,
      int score,
      DateTime? timeStamp});
}

/// @nodoc
class __$$_QuizItemStateCopyWithImpl<$Res>
    extends _$QuizItemStateCopyWithImpl<$Res, _$_QuizItemState>
    implements _$$_QuizItemStateCopyWith<$Res> {
  __$$_QuizItemStateCopyWithImpl(
      _$_QuizItemState _value, $Res Function(_$_QuizItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? group = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? quizList = null,
    Object? score = null,
    Object? timeStamp = freezed,
  }) {
    return _then(_$_QuizItemState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
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
class _$_QuizItemState implements _QuizItemState {
  const _$_QuizItemState(
      {required this.id,
      required this.group,
      required this.title,
      required this.isCompleted,
      required final List<QuizState> quizList,
      required this.score,
      required this.timeStamp})
      : _quizList = quizList;

  factory _$_QuizItemState.fromJson(Map<String, dynamic> json) =>
      _$$_QuizItemStateFromJson(json);

  @override
  final int id;
//問題ID
  @override
  final String group;
//問題のジャンル別に分ける
  @override
  final String title;
//問題タイトル
  @override
  final bool isCompleted;
//全て問題を解いたか
  final List<QuizState> _quizList;
//全て問題を解いたか
  @override
  List<QuizState> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

//クイズ一覧
  @override
  final int score;
//正解数
  @override
  final DateTime? timeStamp;

  @override
  String toString() {
    return 'QuizItemState(id: $id, group: $group, title: $title, isCompleted: $isCompleted, quizList: $quizList, score: $score, timeStamp: $timeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizItemState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, group, title, isCompleted,
      const DeepCollectionEquality().hash(_quizList), score, timeStamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizItemStateCopyWith<_$_QuizItemState> get copyWith =>
      __$$_QuizItemStateCopyWithImpl<_$_QuizItemState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizItemStateToJson(
      this,
    );
  }
}

abstract class _QuizItemState implements QuizItemState {
  const factory _QuizItemState(
      {required final int id,
      required final String group,
      required final String title,
      required final bool isCompleted,
      required final List<QuizState> quizList,
      required final int score,
      required final DateTime? timeStamp}) = _$_QuizItemState;

  factory _QuizItemState.fromJson(Map<String, dynamic> json) =
      _$_QuizItemState.fromJson;

  @override
  int get id;
  @override //問題ID
  String get group;
  @override //問題のジャンル別に分ける
  String get title;
  @override //問題タイトル
  bool get isCompleted;
  @override //全て問題を解いたか
  List<QuizState> get quizList;
  @override //クイズ一覧
  int get score;
  @override //正解数
  DateTime? get timeStamp;
  @override
  @JsonKey(ignore: true)
  _$$_QuizItemStateCopyWith<_$_QuizItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
