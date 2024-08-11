// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_study_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeStudyScreenState {
//StudyScreen
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTutorialDone => throw _privateConstructorUsedError;
  bool get isAnsView => throw _privateConstructorUsedError;
  List<QuizItem> get quizItemList => throw _privateConstructorUsedError;
  List<QuizItem> get knowQuizItemList => throw _privateConstructorUsedError;
  List<QuizItem> get unKnowQuizItemList => throw _privateConstructorUsedError;
  int get itemIndex => throw _privateConstructorUsedError;
  int get lapIndex => throw _privateConstructorUsedError;
  AppinioSwiperDirection? get direction =>
      throw _privateConstructorUsedError; //StudyModal
  List<Quiz> get filterQuizList => throw _privateConstructorUsedError;
  List<String> get categoryList => throw _privateConstructorUsedError;
  List<Quiz> get selectedCategoryQuizList => throw _privateConstructorUsedError;
  List<QuizStatusType> get statusList => throw _privateConstructorUsedError;
  List<QuizStatusType> get selectedStatusList =>
      throw _privateConstructorUsedError;
  List<QuizImportanceType> get importanceList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStudyScreenStateCopyWith<HomeStudyScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStudyScreenStateCopyWith<$Res> {
  factory $HomeStudyScreenStateCopyWith(HomeStudyScreenState value,
          $Res Function(HomeStudyScreenState) then) =
      _$HomeStudyScreenStateCopyWithImpl<$Res, HomeStudyScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isTutorialDone,
      bool isAnsView,
      List<QuizItem> quizItemList,
      List<QuizItem> knowQuizItemList,
      List<QuizItem> unKnowQuizItemList,
      int itemIndex,
      int lapIndex,
      AppinioSwiperDirection? direction,
      List<Quiz> filterQuizList,
      List<String> categoryList,
      List<Quiz> selectedCategoryQuizList,
      List<QuizStatusType> statusList,
      List<QuizStatusType> selectedStatusList,
      List<QuizImportanceType> importanceList});
}

/// @nodoc
class _$HomeStudyScreenStateCopyWithImpl<$Res,
        $Val extends HomeStudyScreenState>
    implements $HomeStudyScreenStateCopyWith<$Res> {
  _$HomeStudyScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTutorialDone = null,
    Object? isAnsView = null,
    Object? quizItemList = null,
    Object? knowQuizItemList = null,
    Object? unKnowQuizItemList = null,
    Object? itemIndex = null,
    Object? lapIndex = null,
    Object? direction = freezed,
    Object? filterQuizList = null,
    Object? categoryList = null,
    Object? selectedCategoryQuizList = null,
    Object? statusList = null,
    Object? selectedStatusList = null,
    Object? importanceList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTutorialDone: null == isTutorialDone
          ? _value.isTutorialDone
          : isTutorialDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnsView: null == isAnsView
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      quizItemList: null == quizItemList
          ? _value.quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      knowQuizItemList: null == knowQuizItemList
          ? _value.knowQuizItemList
          : knowQuizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      unKnowQuizItemList: null == unKnowQuizItemList
          ? _value.unKnowQuizItemList
          : unKnowQuizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as AppinioSwiperDirection?,
      filterQuizList: null == filterQuizList
          ? _value.filterQuizList
          : filterQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      categoryList: null == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedCategoryQuizList: null == selectedCategoryQuizList
          ? _value.selectedCategoryQuizList
          : selectedCategoryQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      statusList: null == statusList
          ? _value.statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<QuizStatusType>,
      selectedStatusList: null == selectedStatusList
          ? _value.selectedStatusList
          : selectedStatusList // ignore: cast_nullable_to_non_nullable
              as List<QuizStatusType>,
      importanceList: null == importanceList
          ? _value.importanceList
          : importanceList // ignore: cast_nullable_to_non_nullable
              as List<QuizImportanceType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStudyScreenStateCopyWith<$Res>
    implements $HomeStudyScreenStateCopyWith<$Res> {
  factory _$$_HomeStudyScreenStateCopyWith(_$_HomeStudyScreenState value,
          $Res Function(_$_HomeStudyScreenState) then) =
      __$$_HomeStudyScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isTutorialDone,
      bool isAnsView,
      List<QuizItem> quizItemList,
      List<QuizItem> knowQuizItemList,
      List<QuizItem> unKnowQuizItemList,
      int itemIndex,
      int lapIndex,
      AppinioSwiperDirection? direction,
      List<Quiz> filterQuizList,
      List<String> categoryList,
      List<Quiz> selectedCategoryQuizList,
      List<QuizStatusType> statusList,
      List<QuizStatusType> selectedStatusList,
      List<QuizImportanceType> importanceList});
}

/// @nodoc
class __$$_HomeStudyScreenStateCopyWithImpl<$Res>
    extends _$HomeStudyScreenStateCopyWithImpl<$Res, _$_HomeStudyScreenState>
    implements _$$_HomeStudyScreenStateCopyWith<$Res> {
  __$$_HomeStudyScreenStateCopyWithImpl(_$_HomeStudyScreenState _value,
      $Res Function(_$_HomeStudyScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTutorialDone = null,
    Object? isAnsView = null,
    Object? quizItemList = null,
    Object? knowQuizItemList = null,
    Object? unKnowQuizItemList = null,
    Object? itemIndex = null,
    Object? lapIndex = null,
    Object? direction = freezed,
    Object? filterQuizList = null,
    Object? categoryList = null,
    Object? selectedCategoryQuizList = null,
    Object? statusList = null,
    Object? selectedStatusList = null,
    Object? importanceList = null,
  }) {
    return _then(_$_HomeStudyScreenState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTutorialDone: null == isTutorialDone
          ? _value.isTutorialDone
          : isTutorialDone // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnsView: null == isAnsView
          ? _value.isAnsView
          : isAnsView // ignore: cast_nullable_to_non_nullable
              as bool,
      quizItemList: null == quizItemList
          ? _value._quizItemList
          : quizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      knowQuizItemList: null == knowQuizItemList
          ? _value._knowQuizItemList
          : knowQuizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      unKnowQuizItemList: null == unKnowQuizItemList
          ? _value._unKnowQuizItemList
          : unKnowQuizItemList // ignore: cast_nullable_to_non_nullable
              as List<QuizItem>,
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      lapIndex: null == lapIndex
          ? _value.lapIndex
          : lapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as AppinioSwiperDirection?,
      filterQuizList: null == filterQuizList
          ? _value._filterQuizList
          : filterQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      categoryList: null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedCategoryQuizList: null == selectedCategoryQuizList
          ? _value._selectedCategoryQuizList
          : selectedCategoryQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      statusList: null == statusList
          ? _value._statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<QuizStatusType>,
      selectedStatusList: null == selectedStatusList
          ? _value._selectedStatusList
          : selectedStatusList // ignore: cast_nullable_to_non_nullable
              as List<QuizStatusType>,
      importanceList: null == importanceList
          ? _value._importanceList
          : importanceList // ignore: cast_nullable_to_non_nullable
              as List<QuizImportanceType>,
    ));
  }
}

/// @nodoc

class _$_HomeStudyScreenState implements _HomeStudyScreenState {
  const _$_HomeStudyScreenState(
      {this.isLoading = false,
      this.isTutorialDone = false,
      this.isAnsView = false,
      final List<QuizItem> quizItemList = const [],
      final List<QuizItem> knowQuizItemList = const [],
      final List<QuizItem> unKnowQuizItemList = const [],
      this.itemIndex = 0,
      this.lapIndex = 0,
      this.direction,
      final List<Quiz> filterQuizList = const [],
      final List<String> categoryList = const [],
      final List<Quiz> selectedCategoryQuizList = const [],
      final List<QuizStatusType> statusList = const [],
      final List<QuizStatusType> selectedStatusList = const [],
      final List<QuizImportanceType> importanceList = const []})
      : _quizItemList = quizItemList,
        _knowQuizItemList = knowQuizItemList,
        _unKnowQuizItemList = unKnowQuizItemList,
        _filterQuizList = filterQuizList,
        _categoryList = categoryList,
        _selectedCategoryQuizList = selectedCategoryQuizList,
        _statusList = statusList,
        _selectedStatusList = selectedStatusList,
        _importanceList = importanceList;

//StudyScreen
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isTutorialDone;
  @override
  @JsonKey()
  final bool isAnsView;
  final List<QuizItem> _quizItemList;
  @override
  @JsonKey()
  List<QuizItem> get quizItemList {
    if (_quizItemList is EqualUnmodifiableListView) return _quizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizItemList);
  }

  final List<QuizItem> _knowQuizItemList;
  @override
  @JsonKey()
  List<QuizItem> get knowQuizItemList {
    if (_knowQuizItemList is EqualUnmodifiableListView)
      return _knowQuizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knowQuizItemList);
  }

  final List<QuizItem> _unKnowQuizItemList;
  @override
  @JsonKey()
  List<QuizItem> get unKnowQuizItemList {
    if (_unKnowQuizItemList is EqualUnmodifiableListView)
      return _unKnowQuizItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unKnowQuizItemList);
  }

  @override
  @JsonKey()
  final int itemIndex;
  @override
  @JsonKey()
  final int lapIndex;
  @override
  final AppinioSwiperDirection? direction;
//StudyModal
  final List<Quiz> _filterQuizList;
//StudyModal
  @override
  @JsonKey()
  List<Quiz> get filterQuizList {
    if (_filterQuizList is EqualUnmodifiableListView) return _filterQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterQuizList);
  }

  final List<String> _categoryList;
  @override
  @JsonKey()
  List<String> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  final List<Quiz> _selectedCategoryQuizList;
  @override
  @JsonKey()
  List<Quiz> get selectedCategoryQuizList {
    if (_selectedCategoryQuizList is EqualUnmodifiableListView)
      return _selectedCategoryQuizList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategoryQuizList);
  }

  final List<QuizStatusType> _statusList;
  @override
  @JsonKey()
  List<QuizStatusType> get statusList {
    if (_statusList is EqualUnmodifiableListView) return _statusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusList);
  }

  final List<QuizStatusType> _selectedStatusList;
  @override
  @JsonKey()
  List<QuizStatusType> get selectedStatusList {
    if (_selectedStatusList is EqualUnmodifiableListView)
      return _selectedStatusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedStatusList);
  }

  final List<QuizImportanceType> _importanceList;
  @override
  @JsonKey()
  List<QuizImportanceType> get importanceList {
    if (_importanceList is EqualUnmodifiableListView) return _importanceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_importanceList);
  }

  @override
  String toString() {
    return 'HomeStudyScreenState(isLoading: $isLoading, isTutorialDone: $isTutorialDone, isAnsView: $isAnsView, quizItemList: $quizItemList, knowQuizItemList: $knowQuizItemList, unKnowQuizItemList: $unKnowQuizItemList, itemIndex: $itemIndex, lapIndex: $lapIndex, direction: $direction, filterQuizList: $filterQuizList, categoryList: $categoryList, selectedCategoryQuizList: $selectedCategoryQuizList, statusList: $statusList, selectedStatusList: $selectedStatusList, importanceList: $importanceList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeStudyScreenState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isTutorialDone, isTutorialDone) ||
                other.isTutorialDone == isTutorialDone) &&
            (identical(other.isAnsView, isAnsView) ||
                other.isAnsView == isAnsView) &&
            const DeepCollectionEquality()
                .equals(other._quizItemList, _quizItemList) &&
            const DeepCollectionEquality()
                .equals(other._knowQuizItemList, _knowQuizItemList) &&
            const DeepCollectionEquality()
                .equals(other._unKnowQuizItemList, _unKnowQuizItemList) &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex) &&
            (identical(other.lapIndex, lapIndex) ||
                other.lapIndex == lapIndex) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            const DeepCollectionEquality()
                .equals(other._filterQuizList, _filterQuizList) &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality().equals(
                other._selectedCategoryQuizList, _selectedCategoryQuizList) &&
            const DeepCollectionEquality()
                .equals(other._statusList, _statusList) &&
            const DeepCollectionEquality()
                .equals(other._selectedStatusList, _selectedStatusList) &&
            const DeepCollectionEquality()
                .equals(other._importanceList, _importanceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isTutorialDone,
      isAnsView,
      const DeepCollectionEquality().hash(_quizItemList),
      const DeepCollectionEquality().hash(_knowQuizItemList),
      const DeepCollectionEquality().hash(_unKnowQuizItemList),
      itemIndex,
      lapIndex,
      direction,
      const DeepCollectionEquality().hash(_filterQuizList),
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_selectedCategoryQuizList),
      const DeepCollectionEquality().hash(_statusList),
      const DeepCollectionEquality().hash(_selectedStatusList),
      const DeepCollectionEquality().hash(_importanceList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStudyScreenStateCopyWith<_$_HomeStudyScreenState> get copyWith =>
      __$$_HomeStudyScreenStateCopyWithImpl<_$_HomeStudyScreenState>(
          this, _$identity);
}

abstract class _HomeStudyScreenState implements HomeStudyScreenState {
  const factory _HomeStudyScreenState(
      {final bool isLoading,
      final bool isTutorialDone,
      final bool isAnsView,
      final List<QuizItem> quizItemList,
      final List<QuizItem> knowQuizItemList,
      final List<QuizItem> unKnowQuizItemList,
      final int itemIndex,
      final int lapIndex,
      final AppinioSwiperDirection? direction,
      final List<Quiz> filterQuizList,
      final List<String> categoryList,
      final List<Quiz> selectedCategoryQuizList,
      final List<QuizStatusType> statusList,
      final List<QuizStatusType> selectedStatusList,
      final List<QuizImportanceType> importanceList}) = _$_HomeStudyScreenState;

  @override //StudyScreen
  bool get isLoading;
  @override
  bool get isTutorialDone;
  @override
  bool get isAnsView;
  @override
  List<QuizItem> get quizItemList;
  @override
  List<QuizItem> get knowQuizItemList;
  @override
  List<QuizItem> get unKnowQuizItemList;
  @override
  int get itemIndex;
  @override
  int get lapIndex;
  @override
  AppinioSwiperDirection? get direction;
  @override //StudyModal
  List<Quiz> get filterQuizList;
  @override
  List<String> get categoryList;
  @override
  List<Quiz> get selectedCategoryQuizList;
  @override
  List<QuizStatusType> get statusList;
  @override
  List<QuizStatusType> get selectedStatusList;
  @override
  List<QuizImportanceType> get importanceList;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStudyScreenStateCopyWith<_$_HomeStudyScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
