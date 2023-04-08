// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizItemTearOff {
  const _$QuizItemTearOff();

  _Create call(
      {int id = 0,
      String group = "",
      String title = "",
      bool isCompleted = false,
      List<Quiz> quizList = const []}) {
    return _Create(
      id: id,
      group: group,
      title: title,
      isCompleted: isCompleted,
      quizList: quizList,
    );
  }
}

/// @nodoc
const $QuizItem = _$QuizItemTearOff();

/// @nodoc
mixin _$QuizItem {
  int get id => throw _privateConstructorUsedError; //問題ID
  String get group => throw _privateConstructorUsedError; //問題のジャンル別に分ける
  String get title => throw _privateConstructorUsedError; //問題タイトル
  bool get isCompleted => throw _privateConstructorUsedError; //全て問題を解いたか
  List<Quiz> get quizList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizItemCopyWith<QuizItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizItemCopyWith<$Res> {
  factory $QuizItemCopyWith(QuizItem value, $Res Function(QuizItem) then) =
      _$QuizItemCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String group,
      String title,
      bool isCompleted,
      List<Quiz> quizList});
}

/// @nodoc
class _$QuizItemCopyWithImpl<$Res> implements $QuizItemCopyWith<$Res> {
  _$QuizItemCopyWithImpl(this._value, this._then);

  final QuizItem _value;
  // ignore: unused_field
  final $Res Function(QuizItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? group = freezed,
    Object? title = freezed,
    Object? isCompleted = freezed,
    Object? quizList = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      quizList: quizList == freezed
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res> implements $QuizItemCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String group,
      String title,
      bool isCompleted,
      List<Quiz> quizList});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res> extends _$QuizItemCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? id = freezed,
    Object? group = freezed,
    Object? title = freezed,
    Object? isCompleted = freezed,
    Object? quizList = freezed,
  }) {
    return _then(_Create(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      quizList: quizList == freezed
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.id = 0,
      this.group = "",
      this.title = "",
      this.isCompleted = false,
      this.quizList = const []});

  @JsonKey()
  @override
  final int id;
  @JsonKey()
  @override //問題ID
  final String group;
  @JsonKey()
  @override //問題のジャンル別に分ける
  final String title;
  @JsonKey()
  @override //問題タイトル
  final bool isCompleted;
  @JsonKey()
  @override //全て問題を解いたか
  final List<Quiz> quizList;

  @override
  String toString() {
    return 'QuizItem(id: $id, group: $group, title: $title, isCompleted: $isCompleted, quizList: $quizList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted) &&
            const DeepCollectionEquality().equals(other.quizList, quizList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isCompleted),
      const DeepCollectionEquality().hash(quizList));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements QuizItem {
  const factory _Create(
      {int id,
      String group,
      String title,
      bool isCompleted,
      List<Quiz> quizList}) = _$_Create;

  @override
  int get id;
  @override //問題ID
  String get group;
  @override //問題のジャンル別に分ける
  String get title;
  @override //問題タイトル
  bool get isCompleted;
  @override //全て問題を解いたか
  List<Quiz> get quizList;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
