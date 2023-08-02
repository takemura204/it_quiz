// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_learn_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizLearnScreenState {
  bool get isAnsView => throw _privateConstructorUsedError; //正解画面切り替え
  bool get isResultScreen => throw _privateConstructorUsedError; //結果画面切り替え
  int get quizIndex => throw _privateConstructorUsedError; //問題番号
  int get lapIndex => throw _privateConstructorUsedError; //何周目
  List<QuizItem> get quizList => throw _privateConstructorUsedError;
  List<QuizItem> get knowQuizList => throw _privateConstructorUsedError;
  List<QuizItem> get unKnowQuizList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizLearnScreenStateCopyWith<QuizLearnScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizLearnScreenStateCopyWith<$Res> {
  factory $QuizLearnScreenStateCopyWith(QuizLearnScreenState value,
          $Res Function(QuizLearnScreenState) then) =
      _$QuizLearnScreenStateCopyWithImpl<$Res, QuizLearnScreenState>;
  @useResult
  $Res call(
      {bool isAnsView,
      bool isResultScreen,
      int quizIndex,
      int lapIndex,
      List<QuizItem> quizList,
      List<QuizItem> knowQuizList,
      List<QuizItem> unKnowQuizList});
}

/// @nodoc
class _$QuizLearnScreenStateCopyWithImpl<$Res,
        $Val extends QuizLearnScreenState>
    implements $QuizLearnScreenStateCopyWith<$Res> {
  _$QuizLearnScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnsView = null,
    Object? isResultScreen = null,
    Object? quizIndex = null,
    Object? lapIndex = null,
    Object? quizList = null,
    Object? knowQuizList = null,
    Object? unKnowQuizList = null,
  }) {
    return _then(_value.copyWith(
      isAnsView: null == isAnsView
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultScreen: null == isResultScreen
          ? _value.isResultScreen
          : isResultScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      quizIndex: null == quizIndex
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      knowQuizList: null == knowQuizList
          ? _value.knowQuizList
          : knowQuizList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      unKnowQuizList: null == unKnowQuizList
          ? _value.unKnowQuizList
          : unKnowQuizList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $QuizLearnScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAnsView,
      bool isResultScreen,
      int quizIndex,
      int lapIndex,
      List<QuizItem> quizList,
      List<QuizItem> knowQuizList,
      List<QuizItem> unKnowQuizList});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$QuizLearnScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnsView = null,
    Object? isResultScreen = null,
    Object? quizIndex = null,
    Object? lapIndex = null,
    Object? quizList = null,
    Object? knowQuizList = null,
    Object? unKnowQuizList = null,
  }) {
    return _then(_$_Create(
      isAnsView: null == isAnsView
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      isResultScreen: null == isResultScreen
          ? _value.isResultScreen
          : isResultScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      quizIndex: null == quizIndex
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      knowQuizList: null == knowQuizList
          ? _value._knowQuizList
          : knowQuizList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      unKnowQuizList: null == unKnowQuizList
          ? _value._unKnowQuizList
          : unKnowQuizList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  const _$_Create(
      {this.isAnsView = false,
      this.isResultScreen = false,
      this.quizIndex = 0,
      this.lapIndex = 0,
      final List<QuizItem> quizList = const [],
      final List<QuizItem> knowQuizList = const [],
      final List<QuizItem> unKnowQuizList = const []})
      : _quizList = quizList,
        _knowQuizList = knowQuizList,
        _unKnowQuizList = unKnowQuizList,
        super._();

  @override
  @JsonKey()
  final bool isAnsView;
//正解画面切り替え
  @override
  @JsonKey()
  final bool isResultScreen;
//結果画面切り替え
  @override
  @JsonKey()
  final int quizIndex;
//問題番号
  @override
  @JsonKey()
  final int lapIndex;
//何周目
  final List<QuizItem> _quizList;
//何周目
  @override
  @JsonKey()
  List<QuizItem> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

  final List<QuizItem> _knowQuizList;
  @override
  @JsonKey()
  List<QuizItem> get knowQuizList {
    if (_knowQuizList is EqualUnmodifiableListView) return _knowQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knowQuizList);
  }

  final List<QuizItem> _unKnowQuizList;
  @override
  @JsonKey()
  List<QuizItem> get unKnowQuizList {
    if (_unKnowQuizList is EqualUnmodifiableListView) return _unKnowQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unKnowQuizList);
  }

  @override
  String toString() {
    return 'QuizLearnScreenState(isAnsView: $isAnsView, isResultScreen: $isResultScreen, quizIndex: $quizIndex, lapIndex: $lapIndex, quizList: $quizList, knowQuizList: $knowQuizList, unKnowQuizList: $unKnowQuizList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.isAnsView, isAnsView) ||
                other.isAnsView == isAnsView) &&
            (identical(other.isResultScreen, isResultScreen) ||
                other.isResultScreen == isResultScreen) &&
            (identical(other.quizIndex, quizIndex) ||
                other.quizIndex == quizIndex) &&
            (identical(other.lapIndex, lapIndex) ||
                other.lapIndex == lapIndex) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList) &&
            const DeepCollectionEquality()
                .equals(other._knowQuizList, _knowQuizList) &&
            const DeepCollectionEquality()
                .equals(other._unKnowQuizList, _unKnowQuizList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAnsView,
      isResultScreen,
      quizIndex,
      lapIndex,
      const DeepCollectionEquality().hash(_quizList),
      const DeepCollectionEquality().hash(_knowQuizList),
      const DeepCollectionEquality().hash(_unKnowQuizList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends QuizLearnScreenState {
  const factory _Create(
      {final bool isAnsView,
      final bool isResultScreen,
      final int quizIndex,
      final int lapIndex,
      final List<QuizItem> quizList,
      final List<QuizItem> knowQuizList,
      final List<QuizItem> unKnowQuizList}) = _$_Create;
  const _Create._() : super._();

  @override
  bool get isAnsView;
  @override //正解画面切り替え
  bool get isResultScreen;
  @override //結果画面切り替え
  int get quizIndex;
  @override //問題番号
  int get lapIndex;
  @override //何周目
  List<QuizItem> get quizList;
  @override
  List<QuizItem> get knowQuizList;
  @override
  List<QuizItem> get unKnowQuizList;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
