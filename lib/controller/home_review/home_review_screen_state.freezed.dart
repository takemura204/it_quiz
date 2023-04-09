// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_review_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeReviewScreenState {
  int get currentIndex => throw _privateConstructorUsedError;
  List<QuizItemState> get reviewItem => throw _privateConstructorUsedError;
  List<QuizState> get quizList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeReviewScreenStateCopyWith<HomeReviewScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeReviewScreenStateCopyWith<$Res> {
  factory $HomeReviewScreenStateCopyWith(HomeReviewScreenState value,
          $Res Function(HomeReviewScreenState) then) =
      _$HomeReviewScreenStateCopyWithImpl<$Res, HomeReviewScreenState>;
  @useResult
  $Res call(
      {int currentIndex,
      List<QuizItemState> reviewItem,
      List<QuizState> quizList});
}

/// @nodoc
class _$HomeReviewScreenStateCopyWithImpl<$Res,
        $Val extends HomeReviewScreenState>
    implements $HomeReviewScreenStateCopyWith<$Res> {
  _$HomeReviewScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? reviewItem = null,
    Object? quizList = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      reviewItem: null == reviewItem
          ? _value.reviewItem
          : reviewItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItemState>,
      quizList: null == quizList
          ? _value.quizList
          : quizList // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $HomeReviewScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentIndex,
      List<QuizItemState> reviewItem,
      List<QuizState> quizList});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$HomeReviewScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? reviewItem = null,
    Object? quizList = null,
  }) {
    return _then(_$_Create(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      reviewItem: null == reviewItem
          ? _value._reviewItem
          : reviewItem // ignore: cast_nullable_to_non_nullable
              as List<QuizItemState>,
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
      {this.currentIndex = 0,
      final List<QuizItemState> reviewItem = const [],
      final List<QuizState> quizList = const []})
      : _reviewItem = reviewItem,
        _quizList = quizList;

  @override
  @JsonKey()
  final int currentIndex;
  final List<QuizItemState> _reviewItem;
  @override
  @JsonKey()
  List<QuizItemState> get reviewItem {
    if (_reviewItem is EqualUnmodifiableListView) return _reviewItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewItem);
  }

  final List<QuizState> _quizList;
  @override
  @JsonKey()
  List<QuizState> get quizList {
    if (_quizList is EqualUnmodifiableListView) return _quizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizList);
  }

  @override
  String toString() {
    return 'HomeReviewScreenState(currentIndex: $currentIndex, reviewItem: $reviewItem, quizList: $quizList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality()
                .equals(other._reviewItem, _reviewItem) &&
            const DeepCollectionEquality().equals(other._quizList, _quizList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentIndex,
      const DeepCollectionEquality().hash(_reviewItem),
      const DeepCollectionEquality().hash(_quizList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create implements HomeReviewScreenState {
  const factory _Create(
      {final int currentIndex,
      final List<QuizItemState> reviewItem,
      final List<QuizState> quizList}) = _$_Create;

  @override
  int get currentIndex;
  @override
  List<QuizItemState> get reviewItem;
  @override
  List<QuizState> get quizList;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
