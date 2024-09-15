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
  List<String> get categoryList =>
      throw _privateConstructorUsedError; //クイズのカテゴリリスト
  List<String> get randomCategoryList =>
      throw _privateConstructorUsedError; //ランダムモーダルの出題状況,
  List<StatusType> get statusList =>
      throw _privateConstructorUsedError; //クイズ出題状況
  List<StatusType> get selectedStatusList =>
      throw _privateConstructorUsedError; //クイズ出題状況
  List<ImportanceType> get selectedImportanceList =>
      throw _privateConstructorUsedError; //重要度
  List<double> get correctRatios => throw _privateConstructorUsedError;
  String get selectCategory => throw _privateConstructorUsedError;
  int get itemIndex => throw _privateConstructorUsedError; //クイズ番号
  int get tabIndex => throw _privateConstructorUsedError; //クイズ番号
  bool get isQuizStatusRecommend =>
      throw _privateConstructorUsedError; //おまかせモードか？
  List<String> get selectedFilterGroup => throw _privateConstructorUsedError;
  int get selectedStudyLength => throw _privateConstructorUsedError;
  int get selectedTestLength => throw _privateConstructorUsedError;
  int get selectedWeakLength => throw _privateConstructorUsedError;
  Quiz? get selectQuiz => throw _privateConstructorUsedError;
  Quiz? get selectStudyQuiz => throw _privateConstructorUsedError;
  Quiz? get selectWeakQuiz => throw _privateConstructorUsedError; //苦手克服
  bool get isRepeat => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  bool get isWeak => throw _privateConstructorUsedError;

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
      List<String> randomCategoryList,
      List<StatusType> statusList,
      List<StatusType> selectedStatusList,
      List<ImportanceType> selectedImportanceList,
      List<double> correctRatios,
      String selectCategory,
      int itemIndex,
      int tabIndex,
      bool isQuizStatusRecommend,
      List<String> selectedFilterGroup,
      int selectedStudyLength,
      int selectedTestLength,
      int selectedWeakLength,
      Quiz? selectQuiz,
      Quiz? selectStudyQuiz,
      Quiz? selectWeakQuiz,
      bool isRepeat,
      bool isSaved,
      bool isWeak});

  $QuizCopyWith<$Res>? get selectQuiz;
  $QuizCopyWith<$Res>? get selectStudyQuiz;
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
    Object? randomCategoryList = null,
    Object? statusList = null,
    Object? selectedStatusList = null,
    Object? selectedImportanceList = null,
    Object? correctRatios = null,
    Object? selectCategory = null,
    Object? itemIndex = null,
    Object? tabIndex = null,
    Object? isQuizStatusRecommend = null,
    Object? selectedFilterGroup = null,
    Object? selectedStudyLength = null,
    Object? selectedTestLength = null,
    Object? selectedWeakLength = null,
    Object? selectQuiz = freezed,
    Object? selectStudyQuiz = freezed,
    Object? selectWeakQuiz = freezed,
    Object? isRepeat = null,
    Object? isSaved = null,
    Object? isWeak = null,
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
      randomCategoryList: null == randomCategoryList
          ? _value.randomCategoryList
          : randomCategoryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      statusList: null == statusList
          ? _value.statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      selectedStatusList: null == selectedStatusList
          ? _value.selectedStatusList
          : selectedStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      selectedImportanceList: null == selectedImportanceList
          ? _value.selectedImportanceList
          : selectedImportanceList // ignore: cast_nullable_to_non_nullable
              as List<ImportanceType>,
      correctRatios: null == correctRatios
          ? _value.correctRatios
          : correctRatios // ignore: cast_nullable_to_non_nullable
              as List<double>,
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
      isQuizStatusRecommend: null == isQuizStatusRecommend
          ? _value.isQuizStatusRecommend
          : isQuizStatusRecommend // ignore: cast_nullable_to_non_nullable
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
      selectQuiz: freezed == selectQuiz
          ? _value.selectQuiz
          : selectQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      selectStudyQuiz: freezed == selectStudyQuiz
          ? _value.selectStudyQuiz
          : selectStudyQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      selectWeakQuiz: freezed == selectWeakQuiz
          ? _value.selectWeakQuiz
          : selectWeakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      isRepeat: null == isRepeat
          ? _value.isRepeat
          : isRepeat // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      isWeak: null == isWeak
          ? _value.isWeak
          : isWeak // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get selectQuiz {
    if (_value.selectQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.selectQuiz!, (value) {
      return _then(_value.copyWith(selectQuiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res>? get selectStudyQuiz {
    if (_value.selectStudyQuiz == null) {
      return null;
    }

    return $QuizCopyWith<$Res>(_value.selectStudyQuiz!, (value) {
      return _then(_value.copyWith(selectStudyQuiz: value) as $Val);
    });
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
      List<String> randomCategoryList,
      List<StatusType> statusList,
      List<StatusType> selectedStatusList,
      List<ImportanceType> selectedImportanceList,
      List<double> correctRatios,
      String selectCategory,
      int itemIndex,
      int tabIndex,
      bool isQuizStatusRecommend,
      List<String> selectedFilterGroup,
      int selectedStudyLength,
      int selectedTestLength,
      int selectedWeakLength,
      Quiz? selectQuiz,
      Quiz? selectStudyQuiz,
      Quiz? selectWeakQuiz,
      bool isRepeat,
      bool isSaved,
      bool isWeak});

  @override
  $QuizCopyWith<$Res>? get selectQuiz;
  @override
  $QuizCopyWith<$Res>? get selectStudyQuiz;
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
    Object? randomCategoryList = null,
    Object? statusList = null,
    Object? selectedStatusList = null,
    Object? selectedImportanceList = null,
    Object? correctRatios = null,
    Object? selectCategory = null,
    Object? itemIndex = null,
    Object? tabIndex = null,
    Object? isQuizStatusRecommend = null,
    Object? selectedFilterGroup = null,
    Object? selectedStudyLength = null,
    Object? selectedTestLength = null,
    Object? selectedWeakLength = null,
    Object? selectQuiz = freezed,
    Object? selectStudyQuiz = freezed,
    Object? selectWeakQuiz = freezed,
    Object? isRepeat = null,
    Object? isSaved = null,
    Object? isWeak = null,
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
      randomCategoryList: null == randomCategoryList
          ? _value._randomCategoryList
          : randomCategoryList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      statusList: null == statusList
          ? _value._statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      selectedStatusList: null == selectedStatusList
          ? _value._selectedStatusList
          : selectedStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      selectedImportanceList: null == selectedImportanceList
          ? _value._selectedImportanceList
          : selectedImportanceList // ignore: cast_nullable_to_non_nullable
              as List<ImportanceType>,
      correctRatios: null == correctRatios
          ? _value._correctRatios
          : correctRatios // ignore: cast_nullable_to_non_nullable
              as List<double>,
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
      isQuizStatusRecommend: null == isQuizStatusRecommend
          ? _value.isQuizStatusRecommend
          : isQuizStatusRecommend // ignore: cast_nullable_to_non_nullable
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
      selectQuiz: freezed == selectQuiz
          ? _value.selectQuiz
          : selectQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      selectStudyQuiz: freezed == selectStudyQuiz
          ? _value.selectStudyQuiz
          : selectStudyQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      selectWeakQuiz: freezed == selectWeakQuiz
          ? _value.selectWeakQuiz
          : selectWeakQuiz // ignore: cast_nullable_to_non_nullable
              as Quiz?,
      isRepeat: null == isRepeat
          ? _value.isRepeat
          : isRepeat // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      isWeak: null == isWeak
          ? _value.isWeak
          : isWeak // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeQuizScreenState implements _HomeQuizScreenState {
  const _$_HomeQuizScreenState(
      {this.isLoading = false,
      final List<Quiz> filterQuizList = const [],
      final List<String> categoryList = const [],
      final List<String> randomCategoryList = const [],
      final List<StatusType> statusList = const [],
      final List<StatusType> selectedStatusList = const [],
      final List<ImportanceType> selectedImportanceList = const [],
      final List<double> correctRatios = const [],
      this.selectCategory = "",
      this.itemIndex = 0,
      this.tabIndex = 0,
      this.isQuizStatusRecommend = true,
      final List<String> selectedFilterGroup = const [],
      this.selectedStudyLength = 10,
      this.selectedTestLength = 10,
      this.selectedWeakLength = 10,
      this.selectQuiz,
      this.selectStudyQuiz,
      this.selectWeakQuiz,
      this.isRepeat = false,
      this.isSaved = false,
      this.isWeak = false})
      : _filterQuizList = filterQuizList,
        _categoryList = categoryList,
        _randomCategoryList = randomCategoryList,
        _statusList = statusList,
        _selectedStatusList = selectedStatusList,
        _selectedImportanceList = selectedImportanceList,
        _correctRatios = correctRatios,
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

//クイズのカテゴリリスト
  final List<String> _randomCategoryList;
//クイズのカテゴリリスト
  @override
  @JsonKey()
  List<String> get randomCategoryList {
    if (_randomCategoryList is EqualUnmodifiableListView)
      return _randomCategoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_randomCategoryList);
  }

//ランダムモーダルの出題状況,
  final List<StatusType> _statusList;
//ランダムモーダルの出題状況,
  @override
  @JsonKey()
  List<StatusType> get statusList {
    if (_statusList is EqualUnmodifiableListView) return _statusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusList);
  }

//クイズ出題状況
  final List<StatusType> _selectedStatusList;
//クイズ出題状況
  @override
  @JsonKey()
  List<StatusType> get selectedStatusList {
    if (_selectedStatusList is EqualUnmodifiableListView)
      return _selectedStatusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedStatusList);
  }

//クイズ出題状況
  final List<ImportanceType> _selectedImportanceList;
//クイズ出題状況
  @override
  @JsonKey()
  List<ImportanceType> get selectedImportanceList {
    if (_selectedImportanceList is EqualUnmodifiableListView)
      return _selectedImportanceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedImportanceList);
  }

//重要度
  final List<double> _correctRatios;
//重要度
  @override
  @JsonKey()
  List<double> get correctRatios {
    if (_correctRatios is EqualUnmodifiableListView) return _correctRatios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctRatios);
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
  final bool isQuizStatusRecommend;
//おまかせモードか？
  final List<String> _selectedFilterGroup;
//おまかせモードか？
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
  final Quiz? selectQuiz;
  @override
  final Quiz? selectStudyQuiz;
  @override
  final Quiz? selectWeakQuiz;
//苦手克服
  @override
  @JsonKey()
  final bool isRepeat;
  @override
  @JsonKey()
  final bool isSaved;
  @override
  @JsonKey()
  final bool isWeak;

  @override
  String toString() {
    return 'HomeQuizScreenState(isLoading: $isLoading, filterQuizList: $filterQuizList, categoryList: $categoryList, randomCategoryList: $randomCategoryList, statusList: $statusList, selectedStatusList: $selectedStatusList, selectedImportanceList: $selectedImportanceList, correctRatios: $correctRatios, selectCategory: $selectCategory, itemIndex: $itemIndex, tabIndex: $tabIndex, isQuizStatusRecommend: $isQuizStatusRecommend, selectedFilterGroup: $selectedFilterGroup, selectedStudyLength: $selectedStudyLength, selectedTestLength: $selectedTestLength, selectedWeakLength: $selectedWeakLength, selectQuiz: $selectQuiz, selectStudyQuiz: $selectStudyQuiz, selectWeakQuiz: $selectWeakQuiz, isRepeat: $isRepeat, isSaved: $isSaved, isWeak: $isWeak)';
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
                .equals(other._randomCategoryList, _randomCategoryList) &&
            const DeepCollectionEquality()
                .equals(other._statusList, _statusList) &&
            const DeepCollectionEquality()
                .equals(other._selectedStatusList, _selectedStatusList) &&
            const DeepCollectionEquality().equals(
                other._selectedImportanceList, _selectedImportanceList) &&
            const DeepCollectionEquality()
                .equals(other._correctRatios, _correctRatios) &&
            (identical(other.selectCategory, selectCategory) ||
                other.selectCategory == selectCategory) &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            (identical(other.isQuizStatusRecommend, isQuizStatusRecommend) ||
                other.isQuizStatusRecommend == isQuizStatusRecommend) &&
            const DeepCollectionEquality()
                .equals(other._selectedFilterGroup, _selectedFilterGroup) &&
            (identical(other.selectedStudyLength, selectedStudyLength) ||
                other.selectedStudyLength == selectedStudyLength) &&
            (identical(other.selectedTestLength, selectedTestLength) ||
                other.selectedTestLength == selectedTestLength) &&
            (identical(other.selectedWeakLength, selectedWeakLength) ||
                other.selectedWeakLength == selectedWeakLength) &&
            (identical(other.selectQuiz, selectQuiz) ||
                other.selectQuiz == selectQuiz) &&
            (identical(other.selectStudyQuiz, selectStudyQuiz) ||
                other.selectStudyQuiz == selectStudyQuiz) &&
            (identical(other.selectWeakQuiz, selectWeakQuiz) ||
                other.selectWeakQuiz == selectWeakQuiz) &&
            (identical(other.isRepeat, isRepeat) ||
                other.isRepeat == isRepeat) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isWeak, isWeak) || other.isWeak == isWeak));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        const DeepCollectionEquality().hash(_filterQuizList),
        const DeepCollectionEquality().hash(_categoryList),
        const DeepCollectionEquality().hash(_randomCategoryList),
        const DeepCollectionEquality().hash(_statusList),
        const DeepCollectionEquality().hash(_selectedStatusList),
        const DeepCollectionEquality().hash(_selectedImportanceList),
        const DeepCollectionEquality().hash(_correctRatios),
        selectCategory,
        itemIndex,
        tabIndex,
        isQuizStatusRecommend,
        const DeepCollectionEquality().hash(_selectedFilterGroup),
        selectedStudyLength,
        selectedTestLength,
        selectedWeakLength,
        selectQuiz,
        selectStudyQuiz,
        selectWeakQuiz,
        isRepeat,
        isSaved,
        isWeak
      ]);

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
      final List<String> randomCategoryList,
      final List<StatusType> statusList,
      final List<StatusType> selectedStatusList,
      final List<ImportanceType> selectedImportanceList,
      final List<double> correctRatios,
      final String selectCategory,
      final int itemIndex,
      final int tabIndex,
      final bool isQuizStatusRecommend,
      final List<String> selectedFilterGroup,
      final int selectedStudyLength,
      final int selectedTestLength,
      final int selectedWeakLength,
      final Quiz? selectQuiz,
      final Quiz? selectStudyQuiz,
      final Quiz? selectWeakQuiz,
      final bool isRepeat,
      final bool isSaved,
      final bool isWeak}) = _$_HomeQuizScreenState;

  @override
  bool get isLoading;
  @override
  List<Quiz> get filterQuizList;
  @override
  List<String> get categoryList;
  @override //クイズのカテゴリリスト
  List<String> get randomCategoryList;
  @override //ランダムモーダルの出題状況,
  List<StatusType> get statusList;
  @override //クイズ出題状況
  List<StatusType> get selectedStatusList;
  @override //クイズ出題状況
  List<ImportanceType> get selectedImportanceList;
  @override //重要度
  List<double> get correctRatios;
  @override
  String get selectCategory;
  @override
  int get itemIndex;
  @override //クイズ番号
  int get tabIndex;
  @override //クイズ番号
  bool get isQuizStatusRecommend;
  @override //おまかせモードか？
  List<String> get selectedFilterGroup;
  @override
  int get selectedStudyLength;
  @override
  int get selectedTestLength;
  @override
  int get selectedWeakLength;
  @override
  Quiz? get selectQuiz;
  @override
  Quiz? get selectStudyQuiz;
  @override
  Quiz? get selectWeakQuiz;
  @override //苦手克服
  bool get isRepeat;
  @override
  bool get isSaved;
  @override
  bool get isWeak;
  @override
  @JsonKey(ignore: true)
  _$$_HomeQuizScreenStateCopyWith<_$_HomeQuizScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
