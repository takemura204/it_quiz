// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quizzes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quizzes _$QuizzesFromJson(Map<String, dynamic> json) {
  return _Quizzes.fromJson(json);
}

/// @nodoc
mixin _$Quizzes {
  List<Quiz> get quizList => throw _privateConstructorUsedError; //クイズ一覧
  List<Quiz> get userQuizList =>
      throw _privateConstructorUsedError; //ユーザーが解いたクイズ一覧
  Quiz? get weakQuiz => throw _privateConstructorUsedError; //苦手克服
  Quiz? get dailyQuiz => throw _privateConstructorUsedError; //今日のクイズ
  Quiz? get testQuiz => throw _privateConstructorUsedError; //全てのクイズ
  List<QuizItem> get dailyQuizItem =>
      throw _privateConstructorUsedError; //デイリークイズ
  List<QuizItem> get weakQuizItem => throw _privateConstructorUsedError; //苦手クイズ
  List<QuizItem> get testQuizItem =>
      throw _privateConstructorUsedError; //テストクイズ
  int get selectQuizIndex => throw _privateConstructorUsedError; //選択したクイズ
  QuizType get quizType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizzesCopyWith<Quizzes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizzesCopyWith<$Res> {
  factory $QuizzesCopyWith(Quizzes value, $Res Function(Quizzes) then) =
      _$QuizzesCopyWithImpl<$Res, Quizzes>;
  @useResult
  $Res call(
      {List<Quiz> quizList,
      List<Quiz> userQuizList,
      Quiz? weakQuiz,
      Quiz? dailyQuiz,
      Quiz? testQuiz,
      List<QuizItem> dailyQuizItem,
      List<QuizItem> weakQuizItem,
      List<QuizItem> testQuizItem,
      int selectQuizIndex,
      QuizType quizType});

  $QuizCopyWith<$Res>? get weakQuiz;
  $QuizCopyWith<$Res>? get dailyQuiz;
  $QuizCopyWith<$Res>? get testQuiz;
}

/// @nodoc
class _$QuizzesCopyWithImpl<$Res, $Val extends Quizzes>
    implements $QuizzesCopyWith<$Res> {
  _$QuizzesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizList = null,
    Object? userQuizList = null,
    Object? weakQuiz = freezed,
    Object? dailyQuiz = freezed,
    Object? testQuiz = freezed,
    Object? dailyQuizItem = null,
    Object? weakQuizItem = null,
    Object? testQuizItem = null,
    Object? selectQuizIndex = null,
    Object? quizType = null,
  }) {
    return _then(_value.copyWith(
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      userQuizList: null == userQuizList
          ? _value.userQuizList
          : userQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      weakQuiz: freezed == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      dailyQuiz: freezed == dailyQuiz
          ? _value.dailyQuiz
          : dailyQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      testQuiz: freezed == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      dailyQuizItem: null == dailyQuizItem
          ? _value.dailyQuizItem
          : dailyQuizItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      weakQuizItem: null == weakQuizItem
          ? _value.weakQuizItem
          : weakQuizItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      testQuizItem: null == testQuizItem
          ? _value.testQuizItem
          : testQuizItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      selectQuizIndex: null == selectQuizIndex
          ? _value.selectQuizIndex
          : selectQuizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: null == quizType
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as QuizType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get weakQuiz {
    if (_value.weakQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.weakQuiz!, (value) {
      return _then(_value.copyWith(weakQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get dailyQuiz {
    if (_value.dailyQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.dailyQuiz!, (value) {
      return _then(_value.copyWith(dailyQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get testQuiz {
    if (_value.testQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.testQuiz!, (value) {
      return _then(_value.copyWith(testQuiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuizzesCopyWith<$Res> implements $QuizzesCopyWith<$Res> {
  factory _$$_QuizzesCopyWith(
          _$_Quizzes value, $Res Function(_$_Quizzes) then) =
      __$$_QuizzesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Quiz> quizList,
      List<Quiz> userQuizList,
      Quiz? weakQuiz,
      Quiz? dailyQuiz,
      Quiz? testQuiz,
      List<QuizItem> dailyQuizItem,
      List<QuizItem> weakQuizItem,
      List<QuizItem> testQuizItem,
      int selectQuizIndex,
      QuizType quizType});

  @override
  $QuizCopyWith<$Res>? get weakQuiz;
  @override
  $QuizCopyWith<$Res>? get dailyQuiz;
  @override
  $QuizCopyWith<$Res>? get testQuiz;
}

/// @nodoc
class __$$_QuizzesCopyWithImpl<$Res>
    extends _$QuizzesCopyWithImpl<$Res, _$_Quizzes>
    implements _$$_QuizzesCopyWith<$Res> {
  __$$_QuizzesCopyWithImpl(_$_Quizzes _value, $Res Function(_$_Quizzes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizList = null,
    Object? userQuizList = null,
    Object? weakQuiz = freezed,
    Object? dailyQuiz = freezed,
    Object? testQuiz = freezed,
    Object? dailyQuizItem = null,
    Object? weakQuizItem = null,
    Object? testQuizItem = null,
    Object? selectQuizIndex = null,
    Object? quizType = null,
  }) {
    return _then(_$_Quizzes(
      quizList: null == quizList
          ? _value._quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      userQuizList: null == userQuizList
          ? _value._userQuizList
          : userQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      weakQuiz: freezed == weakQuiz
          ? _value.weakQuiz
          : weakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      dailyQuiz: freezed == dailyQuiz
          ? _value.dailyQuiz
          : dailyQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      testQuiz: freezed == testQuiz
          ? _value.testQuiz
          : testQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      dailyQuizItem: null == dailyQuizItem
          ? _value._dailyQuizItem
          : dailyQuizItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      weakQuizItem: null == weakQuizItem
          ? _value._weakQuizItem
          : weakQuizItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      testQuizItem: null == testQuizItem
          ? _value._testQuizItem
          : testQuizItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      selectQuizIndex: null == selectQuizIndex
          ? _value.selectQuizIndex
          : selectQuizIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quizType: null == quizType
          ? _value.quizType
          : quizType // ignore: cast_nullable_to_non_nullable
              as QuizType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quizzes extends _Quizzes {
  _$_Quizzes(
      {final List<Quiz> quizList = const [],
      final List<Quiz> userQuizList = const [],
      this.weakQuiz,
      this.dailyQuiz,
      this.testQuiz,
      final List<QuizItem> dailyQuizItem = const [],
      final List<QuizItem> weakQuizItem = const [],
      final List<QuizItem> testQuizItem = const [],
      this.selectQuizIndex = 0,
      this.quizType = QuizType.study})
      : _quizList = quizList,
        _userQuizList = userQuizList,
        _dailyQuizItem = dailyQuizItem,
        _weakQuizItem = weakQuizItem,
        _testQuizItem = testQuizItem,
        super._();

  factory _$_Quizzes.fromJson(Map<String, dynamic> json) =>
      _$$_QuizzesFromJson(json);

  final List<Quiz> _quizList;
  @override
  @JsonKey()
  List<Quiz> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

//クイズ一覧
  final List<Quiz> _userQuizList;
//クイズ一覧
  @override
  @JsonKey()
  List<Quiz> get userQuizList {
    if (_userQuizList is EqualUnmodifiableListView) return _userQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userQuizList);
  }

//ユーザーが解いたクイズ一覧
  @override
  final Quiz? weakQuiz;
//苦手克服
  @override
  final Quiz? dailyQuiz;
//今日のクイズ
  @override
  final Quiz? testQuiz;
//全てのクイズ
  final List<QuizItem> _dailyQuizItem;
//全てのクイズ
  @override
  @JsonKey()
  List<QuizItem> get dailyQuizItem {
    if (_dailyQuizItem is EqualUnmodifiableListView) return _dailyQuizItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyQuizItem);
  }

//デイリークイズ
  final List<QuizItem> _weakQuizItem;
//デイリークイズ
  @override
  @JsonKey()
  List<QuizItem> get weakQuizItem {
    if (_weakQuizItem is EqualUnmodifiableListView) return _weakQuizItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weakQuizItem);
  }

//苦手クイズ
  final List<QuizItem> _testQuizItem;
//苦手クイズ
  @override
  @JsonKey()
  List<QuizItem> get testQuizItem {
    if (_testQuizItem is EqualUnmodifiableListView) return _testQuizItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_testQuizItem);
  }

//テストクイズ
  @override
  @JsonKey()
  final int selectQuizIndex;
//選択したクイズ
  @override
  @JsonKey()
  final QuizType quizType;

  @override
  String toString() {
    return 'Quizzes(quizList: $quizList, userQuizList: $userQuizList, weakQuiz: $weakQuiz, dailyQuiz: $dailyQuiz, testQuiz: $testQuiz, dailyQuizItem: $dailyQuizItem, weakQuizItem: $weakQuizItem, testQuizItem: $testQuizItem, selectQuizIndex: $selectQuizIndex, quizType: $quizType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quizzes &&
            const DeepCollectionEquality().equals(other._quizList, _quizList) &&
            const DeepCollectionEquality()
                .equals(other._userQuizList, _userQuizList) &&
            (identical(other.weakQuiz, weakQuiz) ||
                other.weakQuiz == weakQuiz) &&
            (identical(other.dailyQuiz, dailyQuiz) ||
                other.dailyQuiz == dailyQuiz) &&
            (identical(other.testQuiz, testQuiz) ||
                other.testQuiz == testQuiz) &&
            const DeepCollectionEquality()
                .equals(other._dailyQuizItem, _dailyQuizItem) &&
            const DeepCollectionEquality()
                .equals(other._weakQuizItem, _weakQuizItem) &&
            const DeepCollectionEquality()
                .equals(other._testQuizItem, _testQuizItem) &&
            (identical(other.selectQuizIndex, selectQuizIndex) ||
                other.selectQuizIndex == selectQuizIndex) &&
            (identical(other.quizType, quizType) ||
                other.quizType == quizType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_quizList),
      const DeepCollectionEquality().hash(_userQuizList),
      weakQuiz,
      dailyQuiz,
      testQuiz,
      const DeepCollectionEquality().hash(_dailyQuizItem),
      const DeepCollectionEquality().hash(_weakQuizItem),
      const DeepCollectionEquality().hash(_testQuizItem),
      selectQuizIndex,
      quizType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizzesCopyWith<_$_Quizzes> get copyWith =>
      __$$_QuizzesCopyWithImpl<_$_Quizzes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizzesToJson(
      this,
    );
  }
}

abstract class _Quizzes extends Quizzes {
  factory _Quizzes(
      {final List<Quiz> quizList,
      final List<Quiz> userQuizList,
      final Quiz? weakQuiz,
      final Quiz? dailyQuiz,
      final Quiz? testQuiz,
      final List<QuizItem> dailyQuizItem,
      final List<QuizItem> weakQuizItem,
      final List<QuizItem> testQuizItem,
      final int selectQuizIndex,
      final QuizType quizType}) = _$_Quizzes;
  _Quizzes._() : super._();

  factory _Quizzes.fromJson(Map<String, dynamic> json) = _$_Quizzes.fromJson;

  @override
  List<Quiz> get quizList;
  @override //クイズ一覧
  List<Quiz> get userQuizList;
  @override //ユーザーが解いたクイズ一覧
  Quiz? get weakQuiz;
  @override //苦手克服
  Quiz? get dailyQuiz;
  @override //今日のクイズ
  Quiz? get testQuiz;
  @override //全てのクイズ
  List<QuizItem> get dailyQuizItem;
  @override //デイリークイズ
  List<QuizItem> get weakQuizItem;
  @override //苦手クイズ
  List<QuizItem> get testQuizItem;
  @override //テストクイズ
  int get selectQuizIndex;
  @override //選択したクイズ
  QuizType get quizType;
  @override
  @JsonKey(ignore: true)
  _$$_QuizzesCopyWith<_$_Quizzes> get copyWith =>
      throw _privateConstructorUsedError;
}
