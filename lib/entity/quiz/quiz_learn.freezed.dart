// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_learn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizLearn _$QuizLearnFromJson(Map<String, dynamic> json) {
  return _Create.fromJson(json);
}

/// @nodoc
class _$QuizLearnTearOff {
  const _$QuizLearnTearOff();

  _Create call(
      {@JsonKey(name: "quizId") required int quizId,
      @JsonKey(name: "question") required String question,
      @JsonKey(name: "ans") required String ans,
      bool isWeak = false}) {
    return _Create(
      quizId: quizId,
      question: question,
      ans: ans,
      isWeak: isWeak,
    );
  }

  QuizLearn fromJson(Map<String, Object?> json) {
    return QuizLearn.fromJson(json);
  }
}

/// @nodoc
const $QuizLearn = _$QuizLearnTearOff();

/// @nodoc
mixin _$QuizLearn {
  @JsonKey(name: "quizId")
  int get quizId => throw _privateConstructorUsedError;
  @JsonKey(name: "question")
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: "ans")
  String get ans => throw _privateConstructorUsedError;
  bool get isWeak => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizLearnCopyWith<QuizLearn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizLearnCopyWith<$Res> {
  factory $QuizLearnCopyWith(QuizLearn value, $Res Function(QuizLearn) then) =
      _$QuizLearnCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "quizId") int quizId,
      @JsonKey(name: "question") String question,
      @JsonKey(name: "ans") String ans,
      bool isWeak});
}

/// @nodoc
class _$QuizLearnCopyWithImpl<$Res> implements $QuizLearnCopyWith<$Res> {
  _$QuizLearnCopyWithImpl(this._value, this._then);

  final QuizLearn _value;
  // ignore: unused_field
  final $Res Function(QuizLearn) _then;

  @override
  $Res call({
    Object? quizId = freezed,
    Object? question = freezed,
    Object? ans = freezed,
    Object? isWeak = freezed,
  }) {
    return _then(_value.copyWith(
      quizId: quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      ans: ans == freezed
          ? _value.ans
          : ans // ignore: cast_nullable_to_non_nullable
              as String,
      isWeak: isWeak == freezed
          ? _value.isWeak
          : isWeak // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CreateCopyWith<$Res> implements $QuizLearnCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) then) =
      __$CreateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "quizId") int quizId,
      @JsonKey(name: "question") String question,
      @JsonKey(name: "ans") String ans,
      bool isWeak});
}

/// @nodoc
class __$CreateCopyWithImpl<$Res> extends _$QuizLearnCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(_Create _value, $Res Function(_Create) _then)
      : super(_value, (v) => _then(v as _Create));

  @override
  _Create get _value => super._value as _Create;

  @override
  $Res call({
    Object? quizId = freezed,
    Object? question = freezed,
    Object? ans = freezed,
    Object? isWeak = freezed,
  }) {
    return _then(_Create(
      quizId: quizId == freezed
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      ans: ans == freezed
          ? _value.ans
          : ans // ignore: cast_nullable_to_non_nullable
              as String,
      isWeak: isWeak == freezed
          ? _value.isWeak
          : isWeak // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Create extends _Create {
  const _$_Create(
      {@JsonKey(name: "quizId") required this.quizId,
      @JsonKey(name: "question") required this.question,
      @JsonKey(name: "ans") required this.ans,
      this.isWeak = false})
      : super._();

  factory _$_Create.fromJson(Map<String, dynamic> json) =>
      _$$_CreateFromJson(json);

  @override
  @JsonKey(name: "quizId")
  final int quizId;
  @override
  @JsonKey(name: "question")
  final String question;
  @override
  @JsonKey(name: "ans")
  final String ans;
  @JsonKey()
  @override
  final bool isWeak;

  @override
  String toString() {
    return 'QuizLearn(quizId: $quizId, question: $question, ans: $ans, isWeak: $isWeak)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Create &&
            const DeepCollectionEquality().equals(other.quizId, quizId) &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.ans, ans) &&
            const DeepCollectionEquality().equals(other.isWeak, isWeak));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(quizId),
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(ans),
      const DeepCollectionEquality().hash(isWeak));

  @JsonKey(ignore: true)
  @override
  _$CreateCopyWith<_Create> get copyWith =>
      __$CreateCopyWithImpl<_Create>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateToJson(this);
  }
}

abstract class _Create extends QuizLearn {
  const factory _Create(
      {@JsonKey(name: "quizId") required int quizId,
      @JsonKey(name: "question") required String question,
      @JsonKey(name: "ans") required String ans,
      bool isWeak}) = _$_Create;
  const _Create._() : super._();

  factory _Create.fromJson(Map<String, dynamic> json) = _$_Create.fromJson;

  @override
  @JsonKey(name: "quizId")
  int get quizId;
  @override
  @JsonKey(name: "question")
  String get question;
  @override
  @JsonKey(name: "ans")
  String get ans;
  @override
  bool get isWeak;
  @override
  @JsonKey(ignore: true)
  _$CreateCopyWith<_Create> get copyWith => throw _privateConstructorUsedError;
}
