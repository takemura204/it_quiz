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
  List<QuizState> get quizList => throw _privateConstructorUsedError;
  List<QuizState> get knowRememberQuestions =>
      throw _privateConstructorUsedError;
  List<QuizState> get unKnowRememberQuestions =>
      throw _privateConstructorUsedError;

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
      List<QuizState> quizList,
      List<QuizState> knowRememberQuestions,
      List<QuizState> unKnowRememberQuestions});
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
    Object? knowRememberQuestions = null,
    Object? unKnowRememberQuestions = null,
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
              as List<QuizState>,
      knowRememberQuestions: null == knowRememberQuestions
          ? _value.knowRememberQuestions
          : knowRememberQuestions // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      unKnowRememberQuestions: null == unKnowRememberQuestions
          ? _value.unKnowRememberQuestions
          : unKnowRememberQuestions // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
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
      List<QuizState> quizList,
      List<QuizState> knowRememberQuestions,
      List<QuizState> unKnowRememberQuestions});
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
    Object? knowRememberQuestions = null,
    Object? unKnowRememberQuestions = null,
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
              as List<QuizState>,
      knowRememberQuestions: null == knowRememberQuestions
          ? _value._knowRememberQuestions
          : knowRememberQuestions // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      unKnowRememberQuestions: null == unKnowRememberQuestions
          ? _value._unKnowRememberQuestions
          : unKnowRememberQuestions // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
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
      final List<QuizState> quizList = const [],
      final List<QuizState> knowRememberQuestions = const [],
      final List<QuizState> unKnowRememberQuestions = const []})
      : _quizList = quizList,
        _knowRememberQuestions = knowRememberQuestions,
        _unKnowRememberQuestions = unKnowRememberQuestions,
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
  final List<QuizState> _quizList;
//何周目
  @override
  @JsonKey()
  List<QuizState> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

  final List<QuizState> _knowRememberQuestions;
  @override
  @JsonKey()
  List<QuizState> get knowRememberQuestions {
    if (_knowRememberQuestions is EqualUnmodifiableListView)
      return _knowRememberQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knowRememberQuestions);
  }

  final List<QuizState> _unKnowRememberQuestions;
  @override
  @JsonKey()
  List<QuizState> get unKnowRememberQuestions {
    if (_unKnowRememberQuestions is EqualUnmodifiableListView)
      return _unKnowRememberQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unKnowRememberQuestions);
  }

  @override
  String toString() {
    return 'QuizLearnScreenState(isAnsView: $isAnsView, isResultScreen: $isResultScreen, quizIndex: $quizIndex, lapIndex: $lapIndex, quizList: $quizList, knowRememberQuestions: $knowRememberQuestions, unKnowRememberQuestions: $unKnowRememberQuestions)';
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
                .equals(other._knowRememberQuestions, _knowRememberQuestions) &&
            const DeepCollectionEquality().equals(
                other._unKnowRememberQuestions, _unKnowRememberQuestions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isAnsView,
      isResultScreen,
      quizIndex,
      lapIndex,
      const DeepCollectionEquality().hash(_quizList),
      const DeepCollectionEquality().hash(_knowRememberQuestions),
      const DeepCollectionEquality().hash(_unKnowRememberQuestions));

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
      final List<QuizState> quizList,
      final List<QuizState> knowRememberQuestions,
      final List<QuizState> unKnowRememberQuestions}) = _$_Create;
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
  List<QuizState> get quizList;
  @override
  List<QuizState> get knowRememberQuestions;
  @override
  List<QuizState> get unKnowRememberQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
