// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_quiz_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeQuizScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Quiz> get filterQuizList => throw _privateConstructorUsedError;
  List<String> get categoryList => throw _privateConstructorUsedError;
  List<double> get correctRatios => throw _privateConstructorUsedError;
  List<String> get selectedTestCategory => throw _privateConstructorUsedError;
  String get selectCategory => throw _privateConstructorUsedError;
  int get itemIndex => throw _privateConstructorUsedError; //クイズ番号
  int get tabIndex => throw _privateConstructorUsedError; //クイズ番号
  bool get isSelected => throw _privateConstructorUsedError;
  List<String> get selectedFilterGroup => throw _privateConstructorUsedError;
  int get selectedStudyLength => throw _privateConstructorUsedError;
  int get selectedTestLength => throw _privateConstructorUsedError;
  int get selectedWeakLength => throw _privateConstructorUsedError;
  Quiz? get selectWeakQuiz => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeQuizScreenStateCopyWith<HomeQuizScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeQuizScreenStateCopyWith<$Res> {
  factory $HomeQuizScreenStateCopyWith(
          HomeQuizScreenState value, $Res Function(HomeQuizScreenState) then) =
      _$HomeQuizScreenStateCopyWithImpl<$Res, HomeQuizScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Quiz> filterQuizList,
      List<String> categoryList,
      List<double> correctRatios,
      List<String> selectedTestCategory,
      String selectCategory,
      int itemIndex,
      int tabIndex,
      bool isSelected,
      List<String> selectedFilterGroup,
      int selectedStudyLength,
      int selectedTestLength,
      int selectedWeakLength,
      Quiz? selectWeakQuiz});

  $QuizCopyWith<$Res>? get selectWeakQuiz;
}

/// @nodoc
class _$HomeQuizScreenStateCopyWithImpl<$Res, $Val extends HomeQuizScreenState>
    implements $HomeQuizScreenStateCopyWith<$Res> {
  _$HomeQuizScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? filterQuizList = null,
    Object? categoryList = null,
    Object? correctRatios = null,
    Object? selectedTestCategory = null,
    Object? selectCategory = null,
    Object? itemIndex = null,
    Object? tabIndex = null,
    Object? isSelected = null,
    Object? selectedFilterGroup = null,
    Object? selectedStudyLength = null,
    Object? selectedTestLength = null,
    Object? selectedWeakLength = null,
    Object? selectWeakQuiz = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      filterQuizList: null == filterQuizList
          ? _value.filterQuizList
          : filterQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      categoryList: null == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctRatios: null == correctRatios
          ? _value.correctRatios
          : correctRatios // ignore: cast_nullable_to_non_nullable
              as List<double>,
      selectedTestCategory: null == selectedTestCategory
          ? _value.selectedTestCategory
          : selectedTestCategory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectCategory: null == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as String,
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFilterGroup: null == selectedFilterGroup
          ? _value.selectedFilterGroup
          : selectedFilterGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedStudyLength: null == selectedStudyLength
          ? _value.selectedStudyLength
          : selectedStudyLength // ignore: cast_nullable_to_non_nullable
              as int,
      selectedTestLength: null == selectedTestLength
          ? _value.selectedTestLength
          : selectedTestLength // ignore: cast_nullable_to_non_nullable
              as int,
      selectedWeakLength: null == selectedWeakLength
          ? _value.selectedWeakLength
          : selectedWeakLength // ignore: cast_nullable_to_non_nullable
              as int,
      selectWeakQuiz: freezed == selectWeakQuiz
          ? _value.selectWeakQuiz
          : selectWeakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get selectWeakQuiz {
    if (_value.selectWeakQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.selectWeakQuiz!, (value) {
      return _then(_value.copyWith(selectWeakQuiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeQuizScreenStateCopyWith<$Res>
    implements $HomeQuizScreenStateCopyWith<$Res> {
  factory _$$_HomeQuizScreenStateCopyWith(_$_HomeQuizScreenState value,
          $Res Function(_$_HomeQuizScreenState) then) =
      __$$_HomeQuizScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Quiz> filterQuizList,
      List<String> categoryList,
      List<double> correctRatios,
      List<String> selectedTestCategory,
      String selectCategory,
      int itemIndex,
      int tabIndex,
      bool isSelected,
      List<String> selectedFilterGroup,
      int selectedStudyLength,
      int selectedTestLength,
      int selectedWeakLength,
      Quiz? selectWeakQuiz});

  @override
  $QuizCopyWith<$Res>? get selectWeakQuiz;
}

/// @nodoc
class __$$_HomeQuizScreenStateCopyWithImpl<$Res>
    extends _$HomeQuizScreenStateCopyWithImpl<$Res, _$_HomeQuizScreenState>
    implements _$$_HomeQuizScreenStateCopyWith<$Res> {
  __$$_HomeQuizScreenStateCopyWithImpl(_$_HomeQuizScreenState _value,
      $Res Function(_$_HomeQuizScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? filterQuizList = null,
    Object? categoryList = null,
    Object? correctRatios = null,
    Object? selectedTestCategory = null,
    Object? selectCategory = null,
    Object? itemIndex = null,
    Object? tabIndex = null,
    Object? isSelected = null,
    Object? selectedFilterGroup = null,
    Object? selectedStudyLength = null,
    Object? selectedTestLength = null,
    Object? selectedWeakLength = null,
    Object? selectWeakQuiz = freezed,
  }) {
    return _then(_$_HomeQuizScreenState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      filterQuizList: null == filterQuizList
          ? _value._filterQuizList
          : filterQuizList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      categoryList: null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctRatios: null == correctRatios
          ? _value._correctRatios
          : correctRatios // ignore: cast_nullable_to_non_nullable
              as List<double>,
      selectedTestCategory: null == selectedTestCategory
          ? _value._selectedTestCategory
          : selectedTestCategory // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectCategory: null == selectCategory
          ? _value.selectCategory
          : selectCategory // ignore: cast_nullable_to_non_nullable
              as String,
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFilterGroup: null == selectedFilterGroup
          ? _value._selectedFilterGroup
          : selectedFilterGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedStudyLength: null == selectedStudyLength
          ? _value.selectedStudyLength
          : selectedStudyLength // ignore: cast_nullable_to_non_nullable
              as int,
      selectedTestLength: null == selectedTestLength
          ? _value.selectedTestLength
          : selectedTestLength // ignore: cast_nullable_to_non_nullable
              as int,
      selectedWeakLength: null == selectedWeakLength
          ? _value.selectedWeakLength
          : selectedWeakLength // ignore: cast_nullable_to_non_nullable
              as int,
      selectWeakQuiz: freezed == selectWeakQuiz
          ? _value.selectWeakQuiz
          : selectWeakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
    ));
  }
}

/// @nodoc

class _$_HomeQuizScreenState implements _HomeQuizScreenState {
  const _$_HomeQuizScreenState(
      {this.isLoading = false,
      final List<Quiz> filterQuizList = const [],
      final List<String> categoryList = const [],
      final List<double> correctRatios = const [],
      final List<String> selectedTestCategory = const [],
      this.selectCategory = "",
      this.itemIndex = 0,
      this.tabIndex = 0,
      this.isSelected = false,
      final List<String> selectedFilterGroup = const [],
      this.selectedStudyLength = 10,
      this.selectedTestLength = 10,
      this.selectedWeakLength = 10,
      this.selectWeakQuiz})
      : _filterQuizList = filterQuizList,
        _categoryList = categoryList,
        _correctRatios = correctRatios,
        _selectedTestCategory = selectedTestCategory,
        _selectedFilterGroup = selectedFilterGroup;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Quiz> _filterQuizList;
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

  final List<double> _correctRatios;
  @override
  @JsonKey()
  List<double> get correctRatios {
    if (_correctRatios is EqualUnmodifiableListView) return _correctRatios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctRatios);
  }

  final List<String> _selectedTestCategory;
  @override
  @JsonKey()
  List<String> get selectedTestCategory {
    if (_selectedTestCategory is EqualUnmodifiableListView)
      return _selectedTestCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTestCategory);
  }

  @override
  @JsonKey()
  final String selectCategory;
  @override
  @JsonKey()
  final int itemIndex;
//クイズ番号
  @override
  @JsonKey()
  final int tabIndex;
//クイズ番号
  @override
  @JsonKey()
  final bool isSelected;
  final List<String> _selectedFilterGroup;
  @override
  @JsonKey()
  List<String> get selectedFilterGroup {
    if (_selectedFilterGroup is EqualUnmodifiableListView)
      return _selectedFilterGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedFilterGroup);
  }

  @override
  @JsonKey()
  final int selectedStudyLength;
  @override
  @JsonKey()
  final int selectedTestLength;
  @override
  @JsonKey()
  final int selectedWeakLength;
  @override
  final Quiz? selectWeakQuiz;

  @override
  String toString() {
    return 'HomeQuizScreenState(isLoading: $isLoading, filterQuizList: $filterQuizList, categoryList: $categoryList, correctRatios: $correctRatios, selectedTestCategory: $selectedTestCategory, selectCategory: $selectCategory, itemIndex: $itemIndex, tabIndex: $tabIndex, isSelected: $isSelected, selectedFilterGroup: $selectedFilterGroup, selectedStudyLength: $selectedStudyLength, selectedTestLength: $selectedTestLength, selectedWeakLength: $selectedWeakLength, selectWeakQuiz: $selectWeakQuiz)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeQuizScreenState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._filterQuizList, _filterQuizList) &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality()
                .equals(other._correctRatios, _correctRatios) &&
            const DeepCollectionEquality()
                .equals(other._selectedTestCategory, _selectedTestCategory) &&
            (identical(other.selectCategory, selectCategory) ||
                other.selectCategory == selectCategory) &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            const DeepCollectionEquality()
                .equals(other._selectedFilterGroup, _selectedFilterGroup) &&
            (identical(other.selectedStudyLength, selectedStudyLength) ||
                other.selectedStudyLength == selectedStudyLength) &&
            (identical(other.selectedTestLength, selectedTestLength) ||
                other.selectedTestLength == selectedTestLength) &&
            (identical(other.selectedWeakLength, selectedWeakLength) ||
                other.selectedWeakLength == selectedWeakLength) &&
            (identical(other.selectWeakQuiz, selectWeakQuiz) ||
                other.selectWeakQuiz == selectWeakQuiz));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_filterQuizList),
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_correctRatios),
      const DeepCollectionEquality().hash(_selectedTestCategory),
      selectCategory,
      itemIndex,
      tabIndex,
      isSelected,
      const DeepCollectionEquality().hash(_selectedFilterGroup),
      selectedStudyLength,
      selectedTestLength,
      selectedWeakLength,
      selectWeakQuiz);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeQuizScreenStateCopyWith<_$_HomeQuizScreenState> get copyWith =>
      __$$_HomeQuizScreenStateCopyWithImpl<_$_HomeQuizScreenState>(
          this, _$identity);
}

abstract class _HomeQuizScreenState implements HomeQuizScreenState {
  const factory _HomeQuizScreenState(
      {final bool isLoading,
      final List<Quiz> filterQuizList,
      final List<String> categoryList,
      final List<double> correctRatios,
      final List<String> selectedTestCategory,
      final String selectCategory,
      final int itemIndex,
      final int tabIndex,
      final bool isSelected,
      final List<String> selectedFilterGroup,
      final int selectedStudyLength,
      final int selectedTestLength,
      final int selectedWeakLength,
      final Quiz? selectWeakQuiz}) = _$_HomeQuizScreenState;

  @override
  bool get isLoading;
  @override
  List<Quiz> get filterQuizList;
  @override
  List<String> get categoryList;
  @override
  List<double> get correctRatios;
  @override
  List<String> get selectedTestCategory;
  @override
  String get selectCategory;
  @override
  int get itemIndex;
  @override //クイズ番号
  int get tabIndex;
  @override //クイズ番号
  bool get isSelected;
  @override
  List<String> get selectedFilterGroup;
  @override
  int get selectedStudyLength;
  @override
  int get selectedTestLength;
  @override
  int get selectedWeakLength;
  @override
  Quiz? get selectWeakQuiz;
  @override
  @JsonKey(ignore: true)
  _$$_HomeQuizScreenStateCopyWith<_$_HomeQuizScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
