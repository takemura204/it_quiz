// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_search_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeSearchScreenState {
  List<QuizItem> get quizItemList => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  bool get isValidSearch => throw _privateConstructorUsedError;
  bool get isNotTextEmpty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeSearchScreenStateCopyWith<HomeSearchScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSearchScreenStateCopyWith<$Res> {
  factory $HomeSearchScreenStateCopyWith(HomeSearchScreenState value,
          $Res Function(HomeSearchScreenState) then) =
      _$HomeSearchScreenStateCopyWithImpl<$Res, HomeSearchScreenState>;
  @useResult
  $Res call(
      {List<QuizItem> quizItemList,
      String searchText,
      bool isValidSearch,
      bool isNotTextEmpty});
}

/// @nodoc
class _$HomeSearchScreenStateCopyWithImpl<$Res,
        $Val extends HomeSearchScreenState>
    implements $HomeSearchScreenStateCopyWith<$Res> {
  _$HomeSearchScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizItemList = null,
    Object? searchText = null,
    Object? isValidSearch = null,
    Object? isNotTextEmpty = null,
  }) {
    return _then(_value.copyWith(
      quizItemList: null == quizItemList
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      isValidSearch: null == isValidSearch
          ? _value.isValidSearch
          : isValidSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotTextEmpty: null == isNotTextEmpty
          ? _value.isNotTextEmpty
          : isNotTextEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $HomeSearchScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuizItem> quizItemList,
      String searchText,
      bool isValidSearch,
      bool isNotTextEmpty});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$HomeSearchScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizItemList = null,
    Object? searchText = null,
    Object? isValidSearch = null,
    Object? isNotTextEmpty = null,
  }) {
    return _then(_$_Create(
      quizItemList: null == quizItemList
          ? _value._quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      isValidSearch: null == isValidSearch
          ? _value.isValidSearch
          : isValidSearch // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotTextEmpty: null == isNotTextEmpty
          ? _value.isNotTextEmpty
          : isNotTextEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  _$_Create(
      {final List<QuizItem> quizItemList = const [],
      this.searchText = '',
      this.isValidSearch = false,
      this.isNotTextEmpty = false})
      : _quizItemList = quizItemList,
        super._();

  final List<QuizItem> _quizItemList;
  @override
  @JsonKey()
  List<QuizItem> get quizItemList {
    if (_quizItemList is EqualUnmodifiableListView) return _quizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizItemList);
  }

  @override
  @JsonKey()
  final String searchText;
  @override
  @JsonKey()
  final bool isValidSearch;
  @override
  @JsonKey()
  final bool isNotTextEmpty;

  @override
  String toString() {
    return 'HomeSearchScreenState(quizItemList: $quizItemList, searchText: $searchText, isValidSearch: $isValidSearch, isNotTextEmpty: $isNotTextEmpty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.isValidSearch, isValidSearch) ||
                other.isValidSearch == isValidSearch) &&
            (identical(other.isNotTextEmpty, isNotTextEmpty) ||
                other.isNotTextEmpty == isNotTextEmpty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_quizItemList),
      searchText,
      isValidSearch,
      isNotTextEmpty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends HomeSearchScreenState {
  factory _Create(
      {final List<QuizItem> quizItemList,
      final String searchText,
      final bool isValidSearch,
      final bool isNotTextEmpty}) = _$_Create;
  _Create._() : super._();

  @override
  List<QuizItem> get quizItemList;
  @override
  String get searchText;
  @override
  bool get isValidSearch;
  @override
  bool get isNotTextEmpty;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
