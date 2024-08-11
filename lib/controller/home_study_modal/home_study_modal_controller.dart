import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import 'home_study_modal_state.dart';

final homeStudyModalProvider = StateNotifierProvider<HomeStudyModalController, HomeStudyModalState>(
  (ref) => HomeStudyModalController(ref: ref),
  dependencies: [quizModelProvider],
);

class HomeStudyModalController extends StateNotifier<HomeStudyModalState>
    with LocatorMixin, WidgetsBindingObserver {
  HomeStudyModalController({required this.ref}) : super(const HomeStudyModalState()) {
    _initState();
  }

  final Ref ref;
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
    ref.listen<Quizzes>(quizModelProvider, (_, quizzes) async {
      if (quizzes.isLoading) {
        await Future.wait([
          _initFilterQuizList(),
          _initCategoryList(),
          _initStatusList(),
          _initImportanceList(),

          ///学習時間計測したい
        ]);
      }
      _saveDevice();
      setIsLoading(false);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future _initFilterQuizList() async {
    final quizList = getQuizList();
    state = state.copyWith(filterQuizList: quizList);
  }

  /// CategoryList取得
  Future _initCategoryList() async {
    final quizList = getQuizList();
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
    final categoryList = quizList.map((quizItem) => quizItem.category).toSet().toList();
    state =
        state.copyWith(categoryList: categoryList, selectedCategoryQuizList: updatedCategoryList);
  }

  /// StatusList取得
  Future _initStatusList() async {
    final statusList = [
      StatusType.unlearned,
      StatusType.learned,
      StatusType.incorrect,
      StatusType.correct,
    ];
    state = state.copyWith(statusList: statusList);
  }

  /// ImportanceList取得
  Future _initImportanceList() async {
    final importanceList = [
      ImportanceType.high,
      ImportanceType.normal,
      ImportanceType.low,
      ImportanceType.none,
    ];
    state = state.copyWith(importanceList: importanceList);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  ///カテゴリで絞り込み
  Future updateCategoryQuizList({required Quiz quiz, required bool isSelected}) async {
    final quizList = getQuizList();
    final selectedCategoryQuizList = [...state.selectedCategoryQuizList];
    final matchQuiz = quizList.firstWhere((x) => x.id == quiz.id);
    if (isSelected) {
      selectedCategoryQuizList.remove(matchQuiz);
    } else {
      selectedCategoryQuizList.add(matchQuiz);
    }
    selectedCategoryQuizList.sort((a, b) => a.id.compareTo(b.id));
    state = state.copyWith(selectedCategoryQuizList: selectedCategoryQuizList);
    _updateFilterQuizList();
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
    _updateFilterQuizList();
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
    _updateFilterQuizList();
  }

  void updateAllStatusList() {
    state = state.copyWith(selectedStatusList: []);
    _updateFilterQuizList();
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
    _updateFilterQuizList();
  }

  void updateAllImportanceList() {
    state = state.copyWith(selectedImportanceList: []);
    _updateFilterQuizList();
  }

  ///絞り込みリスト更新
  Future _updateFilterQuizList() async {
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

  /// 端末保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();

    // await prefs.setInt(itemIndexName, itemIndex);
  }

  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
  }
}
