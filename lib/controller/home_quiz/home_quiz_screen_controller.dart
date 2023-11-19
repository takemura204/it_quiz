import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import 'home_quiz_screen_state.dart';

final homeQuizScreenProvider =
    StateNotifierProvider<HomeQuizScreenController, HomeQuizScreenState>(
  (ref) => HomeQuizScreenController(ref: ref),
);

class HomeQuizScreenController extends StateNotifier<HomeQuizScreenState>
    with LocatorMixin {
  HomeQuizScreenController({required this.ref})
      : super(const HomeQuizScreenState()) {
    initState();
  }

  final Ref ref;
  TabController? _tabController;

  @override
  Future initState() async {
    super.initState();
    await loadQuizList();
    await loadCategoryList();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  /// CategoryList取得
  Future loadCategoryList() async {
    // quizListを取得
    final List<Quiz> quizList = [...ref.read(quizModelProvider).quizList];

    // quizListをcategoryIdに基づいてインプレースでソート
    quizList.sort((a, b) => a.categoryId.compareTo(b.categoryId));

    // ソートされたリストからカテゴリー名を取り出して重複を削除
    final categoryList =
        quizList.map((quizItem) => quizItem.category).toSet().toList();

    state = state.copyWith(
        categoryList: categoryList, selectedTestCategory: categoryList);
  }

  ///QuizList取得
  Future loadQuizList() async {
    final quizList = ref.read(quizModelProvider).quizList;
    state = state.copyWith(filterQuizList: quizList);
  }

  ///TestQuiz開始
  void tapStartTestQuizButton() {
    final selectedTestCategory = state.selectedTestCategory;
    final selectedTestLength = state.selectedTestLength;
    ref.read(quizModelProvider.notifier).setQuizType(QuizType.test);
    ref
        .read(quizModelProvider.notifier)
        .createTestQuiz(selectedTestCategory, selectedTestLength);
  }

  void setTabIndex(int index) {
    final category = state.categoryList[index];
    state = state.copyWith(tabIndex: index, selectCategory: category);
  }

  ///問題範囲指定
  void selectTestCategory(String category) {
    final selectedTestCategory = [...state.selectedTestCategory];
    if (selectedTestCategory.contains(category)) {
      state = state.copyWith(
          selectedTestCategory: selectedTestCategory..remove(category));
    } else {
      state = state.copyWith(
          selectedTestCategory: selectedTestCategory..add(category));
    }
    print(state.selectedTestCategory);
  }

  ///問題数指定
  void selectTestLength(int length) {
    state = state.copyWith(selectedTestLength: length);
  }
}
