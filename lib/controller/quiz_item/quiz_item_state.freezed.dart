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

/// @nodoc
mixin _$QuizItemState {
  int get id => throw _privateConstructorUsedError; //問題ID
  String get group => throw _privateConstructorUsedError; //問題のジャンル別に分ける
  String get title => throw _privateConstructorUsedError; //問題タイトル
  bool get isCompleted => throw _privateConstructorUsedError; //全て問題を解いたか
  List<QuizState> get quizList => throw _privateConstructorUsedError;

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
      List<QuizState> quizList});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $QuizItemStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String group,
      String title,
      bool isCompleted,
      List<QuizState> quizList});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$QuizItemStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? group = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? quizList = null,
  }) {
    return _then(_$_Create(
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
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {required this.id,
      required this.group,
      required this.title,
      required this.isCompleted,
      required final List<QuizState> quizList})
      : _quizList = quizList;

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

  @override
  String toString() {
    return 'QuizItemState(id: $id, group: $group, title: $title, isCompleted: $isCompleted, quizList: $quizList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, group, title, isCompleted,
      const DeepCollectionEquality().hash(_quizList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create implements QuizItemState {
  const factory _Create(
      {required final int id,
      required final String group,
      required final String title,
      required final bool isCompleted,
      required final List<QuizState> quizList}) = _$_Create;

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
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
