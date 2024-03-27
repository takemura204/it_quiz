import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/user/user.model.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../model/quiz_item/quiz_item.dart';
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
    final isPremium = ref.read(userModelProvider).isPremium;
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
      final correctNum = ref
          .read(quizModelProvider)
          .quizList
          .where((quiz) => quiz.category == category)
          .fold<int>(
            0,
            (sum, quiz) => sum + quiz.correctNum,
          );
      final quizLength = ref
          .read(quizModelProvider)
          .quizList
          .where((quiz) => quiz.category == category)
          .expand((quiz) => quiz.quizItemList)
          .toList()
          .length;
      return (quizLength > 0) ? (correctNum / quizLength) * 100 : 0.0;
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

  ///WeakQuiz開始
  void tapStartWeakQuizButton() {
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
  }

  ///問題数指定
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
