// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_learn_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizLearnScreenStateTearOff {
  const _$QuizLearnScreenStateTearOff();

  _Create call(
      {bool isAnsView = false,
      int quizIndex = 0,
      int lapIndex = 0,
      List<RememberQuiz> knowRememberQuestions = const [],
      List<RememberQuiz> unKnowRememberQuestions = const []}) {
    return _Create(
      isAnsView: isAnsView,
      quizIndex: quizIndex,
      lapIndex: lapIndex,
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }
}

/// @nodoc
const $QuizLearnScreenState = _$QuizLearnScreenStateTearOff();

/// @nodoc
mixin _$QuizLearnScreenState {
  bool get isAnsView => throw _privateConstructorUsedError;
  int get quizIndex => throw _privateConstructorUsedError; //問題番号
  int get lapIndex => throw _privateConstructorUsedError; //何周目
  List<RememberQuiz> get knowRememberQuestions =>
      throw _privateConstructorUsedError;
  List<RememberQuiz> get unKnowRememberQuestions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizLearnScreenStateCopyWith<QuizLearnScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizLearnScreenStateCopyWith<$Res> {
  factory $QuizLearnScreenStateCopyWith(QuizLearnScreenState value,
          $Res Function(QuizLearnScreenState) then) =
      _$QuizLearnScreenStateCopyWithImpl<$Res>;
  $Res call(
      {bool isAnsView,
      int quizIndex,
      int lapIndex,
      List<RememberQuiz> knowRememberQuestions,
      List<RememberQuiz> unKnowRememberQuestions});
}

/// @nodoc
class _$QuizLearnScreenStateCopyWithImpl<$Res>
    implements $QuizLearnScreenStateCopyWith<$Res> {
  _$QuizLearnScreenStateCopyWithImpl(this._value, this._then);

  final QuizLearnScreenState _value;
  // ignore: unused_field
  final $Res Function(QuizLearnScreenState) _then;

  @override
  $Res call({
    Object? isAnsView = freezed,
    Object? quizIndex = freezed,
    Object? lapIndex = freezed,
    Object? knowRememberQuestions = freezed,
    Object? unKnowRememberQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      isAnsView: isAnsView == freezed
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      quizIndex: quizIndex == freezed
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lapIndex: lapIndex == freezed
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      knowRememberQuestions: knowRememberQuestions == freezed
          ? _value.knowRememberQuestions
          : knowRememberQuestions // ignore: cast_nullable_to_non_nullable
              as List<RememberQuiz>,
      unKnowRememberQuestions: unKnowRememberQuestions == freezed
          ? _value.unKnowRememberQuestions
          : unKnowRememberQuestions // ignore: cast_nullable_to_non_nullable
              as List<RememberQuiz>,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $QuizLearnScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isAnsView,
      int quizIndex,
      int lapIndex,
      List<RememberQuiz> knowRememberQuestions,
      List<RememberQuiz> unKnowRememberQuestions});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res>
    extends _$QuizLearnScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? isAnsView = freezed,
    Object? quizIndex = freezed,
    Object? lapIndex = freezed,
    Object? knowRememberQuestions = freezed,
    Object? unKnowRememberQuestions = freezed,
  }) {
    return _then(_Create(
      isAnsView: isAnsView == freezed
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      quizIndex: quizIndex == freezed
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lapIndex: lapIndex == freezed
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      knowRememberQuestions: knowRememberQuestions == freezed
          ? _value.knowRememberQuestions
          : knowRememberQuestions // ignore: cast_nullable_to_non_nullable
              as List<RememberQuiz>,
      unKnowRememberQuestions: unKnowRememberQuestions == freezed
          ? _value.unKnowRememberQuestions
          : unKnowRememberQuestions // ignore: cast_nullable_to_non_nullable
              as List<RememberQuiz>,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.isAnsView = false,
      this.quizIndex = 0,
      this.lapIndex = 0,
      this.knowRememberQuestions = const [],
      this.unKnowRememberQuestions = const []});

  @JsonKey()
  @override
  final bool isAnsView;
  @JsonKey()
  @override
  final int quizIndex;
  @JsonKey()
  @override //問題番号
  final int lapIndex;
  @JsonKey()
  @override //何周目
  final List<RememberQuiz> knowRememberQuestions;
  @JsonKey()
  @override
  final List<RememberQuiz> unKnowRememberQuestions;

  @override
  String toString() {
    return 'QuizLearnScreenState(isAnsView: $isAnsView, quizIndex: $quizIndex, lapIndex: $lapIndex, knowRememberQuestions: $knowRememberQuestions, unKnowRememberQuestions: $unKnowRememberQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality().equals(other.isAnsView, isAnsView) &&
            const DeepCollectionEquality().equals(other.quizIndex, quizIndex) &&
            const DeepCollectionEquality().equals(other.lapIndex, lapIndex) &&
            const DeepCollectionEquality()
                .equals(other.knowRememberQuestions, knowRememberQuestions) &&
            const DeepCollectionEquality().equals(
                other.unKnowRememberQuestions, unKnowRememberQuestions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAnsView),
      const DeepCollectionEquality().hash(quizIndex),
      const DeepCollectionEquality().hash(lapIndex),
      const DeepCollectionEquality().hash(knowRememberQuestions),
      const DeepCollectionEquality().hash(unKnowRememberQuestions));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements QuizLearnScreenState {
  const factory _Create(
      {bool isAnsView,
      int quizIndex,
      int lapIndex,
      List<RememberQuiz> knowRememberQuestions,
      List<RememberQuiz> unKnowRememberQuestions}) = _$_Create;

  @override
  bool get isAnsView;
  @override
  int get quizIndex;
  @override //問題番号
  int get lapIndex;
  @override //何周目
  List<RememberQuiz> get knowRememberQuestions;
  @override
  List<RememberQuiz> get unKnowRememberQuestions;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
