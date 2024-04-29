import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';
import 'home_quiz_screen_state.dart';

final homeQuizScreenProvider =
    StateNotifierProvider<HomeQuizScreenController, HomeQuizScreenState>(
  (ref) => HomeQuizScreenController(ref: ref),
  dependencies: [quizModelProvider],
);

class HomeQuizScreenController extends StateNotifier<HomeQuizScreenState> {
  HomeQuizScreenController({required this.ref})
      : super(const HomeQuizScreenState()) {
    _initState();
  }

  final Ref ref;

  Future _initState() async {
    setIsLoading(true);
    ref.listen<Quizzes>(quizModelProvider, (_, quizzes) async {
      if (quizzes.isLoading) {
        await Future.wait([
          loadQuizList(),
          loadCategoryList(),
        ]);
      }
      setIsLoading(false);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// CategoryList取得
  Future loadCategoryList() async {
    final isPremium = ref.read(authModelProvider).isPremium;
    // quizListを取得
    final List<Quiz> quizList = [...ref.read(quizModelProvider).quizList];
    // quizListをcategoryIdに基づいてインプレースでソート
    quizList.sort((a, b) => a.categoryId.compareTo(b.categoryId));

    // ソートされたリストからカテゴリー名を取り出して重複を削除
    final categoryList =
        quizList.map((quizItem) => quizItem.category).toSet().toList();

    final selectedTestCategory = quizList
        .where((x) => !x.isPremium)
        .map((quizItem) => quizItem.category)
        .toSet()
        .toList();

    final correctRatios = categoryList.map((category) {
      final correctQuizLength = ref
          .read(quizModelProvider)
          .quizList
          .where((quiz) => quiz.category == category)
          .expand((quiz) => quiz.quizItemList)
          .where((quizItem) => quizItem.isJudge == QuizStatusType.correct)
          .toList()
          .length;

      final quizLength = ref
          .read(quizModelProvider)
          .quizList
          .where((quiz) => quiz.category == category)
          .expand((quiz) => quiz.quizItemList)
          .toList()
          .length;

      return (quizLength > 0) ? (correctQuizLength / quizLength) * 100 : 0.0;
    }).toList();

    state = state.copyWith(
        categoryList: categoryList,
        selectedTestCategory: isPremium ? categoryList : selectedTestCategory,
        correctRatios: correctRatios);
  }

  ///QuizList取得
  Future loadQuizList() async {
    final quizList = ref.read(quizModelProvider).quizList;
    state = state.copyWith(filterQuizList: quizList);
  }

  /// SelectQuiz更新
  void setSelectQuiz(Quiz quiz) {
    state = state.copyWith(selectQuiz: quiz);
  }

  ///selectStudyQuiz更新
  void setSelectStudyQuiz() {
    final selectQuiz = state.selectQuiz;
    if (selectQuiz != null) {
      // 既存の問題リストを取得
      final quizItemList = [...selectQuiz.quizItemList];
      // 選択する問題の上限数を取得
      final selectedStudyLength = state.selectedStudyLength;

      // pickedQuizListを定義し、selectedWeakLengthの数だけ問題を選択
      final pickedQuizList = quizItemList.take(selectedStudyLength).toList();

      // 更新された selectStudyQuiz を生成
      final selectStudyQuiz = selectQuiz.copyWith(quizItemList: pickedQuizList);

      state = state.copyWith(selectStudyQuiz: selectStudyQuiz);
    }
  }

  ///WeakQuiz開始
  void setSelectWeakQuiz() {
    final weakQuiz = ref.read(quizModelProvider).weakQuiz!;
    final weakItemList = [...weakQuiz.quizItemList];
    state = state.copyWith(selectWeakQuiz: weakQuiz);

    final selectedWeakLength = state.selectedWeakLength;
    final random = Random();
    final pickedQuizList = <QuizItem>[];
    for (int i = 0; i < selectedWeakLength; i++) {
      if (weakItemList.isNotEmpty) {
        final randomIndex = random.nextInt(weakItemList.length);
        pickedQuizList.add(weakItemList[randomIndex]);
        weakItemList.removeAt(randomIndex);
      } else {
        break;
      }
    }
    final selectWeakQuiz =
        state.selectWeakQuiz!.copyWith(quizItemList: pickedQuizList);

    state = state.copyWith(selectWeakQuiz: selectWeakQuiz);
  }

  ///TestQuiz開始
  void tapStartTestQuizButton() {
    final selectedTestCategory = state.selectedTestCategory;
    final selectedTestLength = state.selectedTestLength;
    ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.random);
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
  }

  ///問題数指定
  void selectStudyLength(int length) {
    state = state.copyWith(selectedStudyLength: length);
  }

  void selectWeakLength(int length) {
    state = state.copyWith(selectedWeakLength: length);
  }

  void selectTestLength(int length) {
    state = state.copyWith(selectedTestLength: length);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
