import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';
import 'home_quiz_screen_state.dart';

final homeQuizScreenProvider = StateNotifierProvider<HomeQuizScreenController, HomeQuizScreenState>(
    (ref) => HomeQuizScreenController(ref: ref));

class HomeQuizScreenController extends StateNotifier<HomeQuizScreenState> {
  HomeQuizScreenController({required this.ref}) : super(const HomeQuizScreenState()) {
    _initState();
  }

  final Ref ref;

  Future _initState() async {
    setIsLoading(true);
    await _initQuizList();
    await _initCategoryList();
    setIsLoading(false);
  }

  ///QuizList取得
  Future _initQuizList() async {
    final quizList = ref.read(quizModelProvider).quizList;
    state = state.copyWith(filterQuizList: quizList);
  }

  /// CategoryList取得
  Future _initCategoryList() async {
    final isPremium = ref.read(authModelProvider).isPremium;
    final quizList = [...ref.read(quizModelProvider).quizList];
    quizList.sort((a, b) => a.categoryId.compareTo(b.categoryId));
    final categoryList = quizList.map((quizItem) => quizItem.category).toSet().toList();
    final randomCategoryList =
        quizList.where((x) => !x.isPremium).map((quizItem) => quizItem.category).toSet().toList();

    final correctRatios = categoryList.map((category) {
      final correctQuizLength = ref
          .read(quizModelProvider)
          .quizList
          .where((quiz) => quiz.category == category)
          .expand((quiz) => quiz.quizItemList)
          .where((quizItem) => quizItem.status == StatusType.correct)
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
        randomCategoryList: isPremium ? categoryList : randomCategoryList,
        correctRatios: correctRatios);
  }

  /// SelectQuiz更新
  void setSelectQuiz(Quiz quiz) {
    state = state.copyWith(selectQuiz: quiz);
  }

  ///selectStudyQuiz更新
  Future setNextQuiz() async {
    final selectQuiz = state.selectQuiz;
    if (selectQuiz == null) {
      return;
    }
    final quizItemList = selectQuiz.quizItemList;
    List<QuizItem> filterQuizItemList = [...quizItemList];

    // ステータスで絞り込み
    if (state.selectedStatusList.isNotEmpty) {
      filterQuizItemList = filterQuizItemList
          .where((quizItem) => state.selectedStatusList.contains(quizItem.status))
          .toList();
    }

    // 重要度で絞り込み
    if (state.selectedImportanceList.isNotEmpty) {
      filterQuizItemList = filterQuizItemList
          .where((quizItem) => state.selectedImportanceList.contains(quizItem.importance))
          .toList();
    }

    // 保存で絞り込み
    if (state.isSaved) {
      filterQuizItemList = filterQuizItemList.where((item) => item.isSaved).toList();
    }

    // 苦手で絞り込み
    if (state.isWeak) {
      filterQuizItemList = filterQuizItemList.where((item) => item.isWeak).toList();
    }

    // リストをシャッフルしてから指定された数だけ抽出
    final quizItemCount = state.selectedStudyLength;
    filterQuizItemList = (filterQuizItemList..shuffle()).take(quizItemCount).toList();

    final selectStudyQuiz = selectQuiz.copyWith(quizItemList: filterQuizItemList);
    state = state.copyWith(selectStudyQuiz: selectStudyQuiz);
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
    final selectWeakQuiz = state.selectWeakQuiz!.copyWith(quizItemList: pickedQuizList);

    state = state.copyWith(selectWeakQuiz: selectWeakQuiz);
  }

  ///TestQuiz開始
  void tapStartRandomQuizButton() {
    final randomCategoryList = state.randomCategoryList;
    final selectedTestLength = state.selectedTestLength;
    ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.random);
    ref.read(quizModelProvider.notifier).setRandomQuiz(randomCategoryList, selectedTestLength);
  }

  ///　出題範囲指定
  void setSelectedStatusList(List<StatusType> statusList) {
    final selectedStatusList = [...statusList];
    state = state.copyWith(selectedStatusList: selectedStatusList);
  }

  ///　出題範囲指定
  void setSelectedImportanceList(List<ImportanceType> importanceList) {
    final selectedImportanceList = [...importanceList];
    state = state.copyWith(selectedImportanceList: selectedImportanceList);
  }

  ///問題数指定
  void setStudyQuizLength(int length) {
    state = state.copyWith(selectedStudyLength: length);
  }

  ///問題数指定
  void setIsSaved(bool value) {
    state = state.copyWith(isSaved: value);
  }

  ///苦手指定
  void setIsWeak(bool value) {
    state = state.copyWith(isWeak: value);
  }

  void setTabIndex(int index) {
    final category = state.categoryList[index];
    state = state.copyWith(tabIndex: index, selectCategory: category);
  }

  ///問題範囲指定
  void setRandomCategory(String category) {
    final randomCategoryList = [...state.randomCategoryList];
    if (randomCategoryList.contains(category)) {
      state = state.copyWith(randomCategoryList: randomCategoryList..remove(category));
    } else {
      state = state.copyWith(randomCategoryList: randomCategoryList..add(category));
    }
  }

  void setIsisQuizStatusRecommend(bool value) {
    state = state.copyWith(isQuizStatusRecommend: value);
  }

  void setWeakLength(int length) {
    state = state.copyWith(selectedWeakLength: length);
  }

  void setRandomQuizLength(int length) {
    state = state.copyWith(selectedTestLength: length);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
