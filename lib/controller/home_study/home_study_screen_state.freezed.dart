// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_study_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStudyScreenStateTearOff {
  const _$HomeStudyScreenStateTearOff();

  _Create call(
      {int quizIndex = 0,
      List<QuizItem> quizItemList = const [],
      QuizItem? quizItem,
      int score = 0,
      bool isCompleted = false}) {
    return _Create(
      quizIndex: quizIndex,
      quizItemList: quizItemList,
      quizItem: quizItem,
      score: score,
      isCompleted: isCompleted,
    );
  }
}

/// @nodoc
const $HomeStudyScreenState = _$HomeStudyScreenStateTearOff();

/// @nodoc
mixin _$HomeStudyScreenState {
  int get quizIndex => throw _privateConstructorUsedError; //クイズ番号
  List<QuizItem> get quizItemList => throw _privateConstructorUsedError;
  QuizItem? get quizItem => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError; //正解数
  bool get isCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStudyScreenStateCopyWith<HomeStudyScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStudyScreenStateCopyWith<$Res> {
  factory $HomeStudyScreenStateCopyWith(HomeStudyScreenState value,
          $Res Function(HomeStudyScreenState) then) =
      _$HomeStudyScreenStateCopyWithImpl<$Res>;
  $Res call(
      {int quizIndex,
      List<QuizItem> quizItemList,
      QuizItem? quizItem,
      int score,
      bool isCompleted});

  $QuizItemCopyWith<$Res>? get quizItem;
}

/// @nodoc
class _$HomeStudyScreenStateCopyWithImpl<$Res>
    implements $HomeStudyScreenStateCopyWith<$Res> {
  _$HomeStudyScreenStateCopyWithImpl(this._value, this._then);

  final HomeStudyScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeStudyScreenState) _then;

  @override
  $Res call({
    Object? quizIndex = freezed,
    Object? quizItemList = freezed,
    Object? quizItem = freezed,
    Object? score = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      quizIndex: quizIndex == freezed
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizItemList: quizItemList == freezed
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      quizItem: quizItem == freezed
          ? _value.quizItem
          : quizItem // ignore: cast_nullable_to_non_nullable
              as QuizItem?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $QuizItemCopyWith<$Res>? get quizItem {
    if (_value.quizItem == null) {
      return null;
    }

    return $QuizItemCopyWith<$Res>(_value.quizItem!, (value) {
      return _then(_value.copyWith(quizItem: value));
    });
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res>
    implements $HomeStudyScreenStateCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int quizIndex,
      List<QuizItem> quizItemList,
      QuizItem? quizItem,
      int score,
      bool isCompleted});

  @override
  $QuizItemCopyWith<$Res>? get quizItem;
}

/// @nodoc
class __$CreateCopyWithImpl<$Res>
    extends _$HomeStudyScreenStateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? quizIndex = freezed,
    Object? quizItemList = freezed,
    Object? quizItem = freezed,
    Object? score = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_Create(
      quizIndex: quizIndex == freezed
          ? _value.quizIndex
          : quizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizItemList: quizItemList == freezed
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      quizItem: quizItem == freezed
          ? _value.quizItem
          : quizItem // ignore: cast_nullable_to_non_nullable
              as QuizItem?,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.quizIndex = 0,
      this.quizItemList = const [],
      this.quizItem,
      this.score = 0,
      this.isCompleted = false});

  @JsonKey()
  @override
  final int quizIndex;
  @JsonKey()
  @override //クイズ番号
  final List<QuizItem> quizItemList;
  @override
  final QuizItem? quizItem;
  @JsonKey()
  @override
  final int score;
  @JsonKey()
  @override //正解数
  final bool isCompleted;

  @override
  String toString() {
    return 'HomeStudyScreenState(quizIndex: $quizIndex, quizItemList: $quizItemList, quizItem: $quizItem, score: $score, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality().equals(other.quizIndex, quizIndex) &&
            const DeepCollectionEquality()
                .equals(other.quizItemList, quizItemList) &&
            const DeepCollectionEquality().equals(other.quizItem, quizItem) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(quizIndex),
      const DeepCollectionEquality().hash(quizItemList),
      const DeepCollectionEquality().hash(quizItem),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(isCompleted));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);
}

abstract class _Create implements HomeStudyScreenState {
  const factory _Create(
      {int quizIndex,
      List<QuizItem> quizItemList,
      QuizItem? quizItem,
      int score,
      bool isCompleted}) = _$_Create;

  @override
  int get quizIndex;
  @override //クイズ番号
  List<QuizItem> get quizItemList;
  @override
  QuizItem? get quizItem;
  @override
  int get score;
  @override //正解数
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
