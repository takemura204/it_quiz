import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_study/home_study_screen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import 'home_study_modal_state.dart';

final homeStudyModalProvider = StateNotifierProvider<HomeStudyModalController, HomeStudyModalState>(
  (ref) => HomeStudyModalController(ref: ref),
);

class HomeStudyModalController extends StateNotifier<HomeStudyModalState>
    with LocatorMixin, WidgetsBindingObserver {
  HomeStudyModalController({required this.ref}) : super(const HomeStudyModalState()) {
    () async {
      await _initState();
    }();
  }

  final Ref ref;
  final filterQuizListName = 'study_filter_quiz_list';
  final categoryListName = 'study_category_list';
  final statusListName = 'study_status_list';
  final importanceListName = 'study_importance_list';

  /// プレミアムと無料会員でクイズを取得
  List<Quiz> getQuizList() {
    final isPremium = ref.read(authModelProvider).isPremium;
    final premiumQuizList = ref.read(quizModelProvider).quizList;
    final freeQuizList = premiumQuizList.where((x) => !x.isPremium).toList();
    final quizList = isPremium ? premiumQuizList : freeQuizList;
    return quizList;
  }

  Future _initState() async {
    setIsLoading(true);
    // resetData();
    await _initFilterQuizList();
    await _initCategoryList();
    await _initStatusList();
    await _initImportanceList();
    _saveDevice();
    setIsLoading(false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// FilterQuizList取得
  Future _initFilterQuizList() async {
    final quizList = getQuizList();
    final prefs = await SharedPreferences.getInstance();
    final filterQuizListData = prefs.getStringList(filterQuizListName);
    final List<Quiz> updatedFilterQuizList = [];
    if (filterQuizListData != null && filterQuizListData.isNotEmpty) {
      final localFilterQuizList =
          filterQuizListData.map((e) => Quiz.fromJson(json.decode(e))).toList();
      updatedFilterQuizList.addAll(localFilterQuizList);
    } else {
      updatedFilterQuizList.addAll(quizList);
    }
    state = state.copyWith(filterQuizList: updatedFilterQuizList);
  }

  /// CategoryList取得
  Future _initCategoryList() async {
    final quizList = getQuizList();
    final categoryList = quizList.map((quizItem) => quizItem.category).toSet().toList();
    quizList.sort((a, b) => a.categoryId.compareTo(b.categoryId));
    final prefs = await SharedPreferences.getInstance();
    final categoryListData = prefs.getStringList(categoryListName);
    final List<Quiz> updatedCategoryList = [];
    if (categoryListData != null && categoryListData.isNotEmpty) {
      final localCategoryList = categoryListData.map((e) => Quiz.fromJson(json.decode(e))).toList();
      updatedCategoryList.addAll(localCategoryList);
    } else {
      updatedCategoryList.addAll(quizList);
    }
    state =
        state.copyWith(categoryList: categoryList, selectedCategoryQuizList: updatedCategoryList);
  }

  /// StatusList取得
  Future _initStatusList() async {
    final quizList = getQuizList();
    final statusList = [
      StatusType.unlearned,
      StatusType.learned,
      StatusType.incorrect,
      StatusType.correct,
    ];
    quizList.sort((a, b) => a.categoryId.compareTo(b.categoryId));
    final prefs = await SharedPreferences.getInstance();
    final statusListData = prefs.getStringList(statusListName);
    final List<StatusType> updatedStatusList = [];
    if (statusListData != null && statusListData.isNotEmpty) {
      final localStatusList = statusListData.map((e) => StatusTypeExtension.fromJson(e)).toList();
      updatedStatusList.addAll(localStatusList);
    } else {
      updatedStatusList.addAll([]);
    }

    state = state.copyWith(statusList: statusList, selectedStatusList: updatedStatusList);
  }

  /// ImportanceList取得
  Future _initImportanceList() async {
    final quizList = getQuizList();
    final importanceList = [
      ImportanceType.high,
      ImportanceType.normal,
      ImportanceType.low,
      ImportanceType.none,
    ];
    quizList.sort((a, b) => a.categoryId.compareTo(b.categoryId));
    final prefs = await SharedPreferences.getInstance();
    final importanceListData = prefs.getStringList(importanceListName);
    final List<ImportanceType> updatedImportanceList = [];

    if (importanceListData != null && importanceListData.isNotEmpty) {
      final localStatusList =
          importanceListData.map((e) => ImportanceTypeExtension.fromJson(e)).toList();
      updatedImportanceList.addAll(localStatusList);
    } else {
      updatedImportanceList.addAll([]);
    }
    state = state.copyWith(
        importanceList: importanceList, selectedImportanceList: updatedImportanceList);
  }

  ///カテゴリで絞り込み
  Future updateCategoryQuizList({required Quiz quiz, required bool isSelected}) async {
    final quizList = getQuizList();
    final selectedCategoryQuizList = [...state.selectedCategoryQuizList];
    final matchQuiz = quizList.firstWhere((x) => x.id == quiz.id);
    if (isSelected) {
      selectedCategoryQuizList.removeWhere((x) => x.id == matchQuiz.id);
    } else {
      selectedCategoryQuizList.add(matchQuiz);
    }
    selectedCategoryQuizList.sort((a, b) => a.id.compareTo(b.id));
    state = state.copyWith(selectedCategoryQuizList: selectedCategoryQuizList);
    updateFilterQuizList();
  }

  ///カテゴリ一括絞り込み
  Future updateAllCategoryQuizList(
      {required List<Quiz> categoryQuizList, required bool isSelected}) async {
    final quizList = getQuizList();
    final selectedCategoryQuizList = [...state.selectedCategoryQuizList];
    if (isSelected) {
      selectedCategoryQuizList.removeWhere(
          (quiz) => categoryQuizList.any((categoryQuiz) => categoryQuiz.id == quiz.id));
    } else {
      selectedCategoryQuizList.addAll(categoryQuizList
          .where((quiz) => !selectedCategoryQuizList.any((x) => x.id == quiz.id))
          .map((quiz) => quizList.firstWhere((x) => x.id == quiz.id)));
    }
    selectedCategoryQuizList.sort((a, b) => a.id.compareTo(b.id));
    state = state.copyWith(selectedCategoryQuizList: selectedCategoryQuizList);
    updateFilterQuizList();
  }

  ///学習状況絞り込み
  void updateStatusQuizList(StatusType status) {
    final selectedStatusList = [...state.selectedStatusList];
    if (selectedStatusList.contains(status)) {
      selectedStatusList.remove(status);
    } else {
      selectedStatusList.add(status);
    }

    state = state.copyWith(selectedStatusList: selectedStatusList);
    updateFilterQuizList();
  }

  void updateAllStatusList() {
    state = state.copyWith(selectedStatusList: []);
    updateFilterQuizList();
  }

  ///重要度絞り込み
  void updateImportanceQuizList(ImportanceType importance) {
    final selectedImportanceList = [...state.selectedImportanceList];
    if (selectedImportanceList.contains(importance)) {
      selectedImportanceList.remove(importance);
    } else {
      selectedImportanceList.add(importance);
    }

    state = state.copyWith(selectedImportanceList: selectedImportanceList);
    updateFilterQuizList();
  }

  void updateAllImportanceList() {
    state = state.copyWith(selectedImportanceList: []);
    updateFilterQuizList();
  }

  ///絞り込みリスト更新
  Future updateFilterQuizList() async {
    final quizList = getQuizList();

    // カテゴリで絞り込み
    List<Quiz> filterQuizList = quizList
        .where((quiz) =>
            state.selectedCategoryQuizList.any((selectedQuiz) => selectedQuiz.id == quiz.id))
        .toList();

    // ステータスで絞り込み
    if (state.selectedStatusList.isNotEmpty) {
      filterQuizList = filterQuizList
          .map((quiz) {
            final filteredItems = quiz.quizItemList
                .where((quizItem) => state.selectedStatusList.contains(quizItem.status))
                .toList();
            return quiz.copyWith(quizItemList: filteredItems);
          })
          .where((quiz) => quiz.quizItemList.isNotEmpty)
          .toList();
    }

    // 重要度で絞り込み
    if (state.selectedImportanceList.isNotEmpty) {
      filterQuizList = filterQuizList
          .map((quiz) {
            final filteredItems = quiz.quizItemList
                .where((quizItem) => state.selectedImportanceList.contains(quizItem.importance))
                .toList();
            return quiz.copyWith(quizItemList: filteredItems);
          })
          .where((quiz) => quiz.quizItemList.isNotEmpty)
          .toList();
    }

    filterQuizList.sort((a, b) => a.id.compareTo(b.id));
    state = state.copyWith(filterQuizList: filterQuizList);
  }

  Future resetFilterQuizList() async {
    await _initCategoryList();
    await _initStatusList();
    await _initImportanceList();
    updateFilterQuizList();
  }

  void updateStudyQuizItemList() {
    final filterQuizList = state.filterQuizList;
    final filterQuizItemList = filterQuizList.expand((x) => x.quizItemList).toList();
    ref.read(homeStudyScreenProvider.notifier).updateStudyQuizItemList(filterQuizItemList);
    _saveDevice();
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void setIsShowCancelModal(bool value) {
    state = state.copyWith(isShowCancelModal: value);
  }

  /// 端末保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final filterQuizListData = state.filterQuizList.map((e) => json.encode(e.toJson())).toList();
    final categoryListData =
        state.selectedCategoryQuizList.map((e) => json.encode(e.toJson())).toList();
    final statusListData = state.selectedStatusList.map((e) => e.name).toList();
    final importanceListData = state.selectedImportanceList.map((e) => e.name).toList();

    await prefs.setStringList(filterQuizListName, filterQuizListData);
    await prefs.setStringList(categoryListName, categoryListData);
    await prefs.setStringList(statusListName, statusListData);
    await prefs.setStringList(importanceListName, importanceListData);
  }

  Future resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(filterQuizListName);
    prefs.remove(categoryListName);
    prefs.remove(statusListName);
    prefs.remove(importanceListName);
  }
}
