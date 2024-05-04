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
          initQuizList(),
          initCategoryList(),
          initStatusList(),
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
  Future initCategoryList() async {
    final isPremium = ref.read(authModelProvider).isPremium;
    // quizListを取得
    final List<Quiz> quizList = [...ref.read(quizModelProvider).quizList];
    // quizListをcategoryIdに基づいてインプレースでソート
    quizList.sort((a, b) => a.categoryId.compareTo(b.categoryId));

    // ソートされたリストからカテゴリー名を取り出して重複を削除
    final categoryList =
        quizList.map((quizItem) => quizItem.category).toSet().toList();

    final randomCategoryList = quizList
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
          .where((quizItem) => quizItem.status == QuizStatusType.correct)
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

  ///selectedRangeList読み込み
  Future initStatusList() async {
    final statusList = [
      QuizStatusType.unlearned,
      QuizStatusType.learned,
      QuizStatusType.correct,
      QuizStatusType.incorrect,
    ];
    state =
        state.copyWith(statusList: statusList, selectedStatusList: statusList);
  }

  ///QuizList取得
  Future initQuizList() async {
    final quizList = ref.read(quizModelProvider).quizList;
    state = state.copyWith(filterQuizList: quizList);
  }

  /// SelectQuiz更新
  void setSelectQuiz(Quiz quiz) {
    state = state.copyWith(selectQuiz: quiz);
  }

  ///selectStudyQuiz更新
  void setSelectStudyQuiz() {
    // selectQuiz の存在を確認
    final selectQuiz = state.selectQuiz;
    if (selectQuiz == null) {
      return;
    }

    // 既存の問題リストを取得
    final quizItemList = [...selectQuiz.quizItemList];

    // selectedStatusList に基づいて問題をフィルタリング
    final filteredQuizList = quizItemList
        .where((quizItem) => state.selectedStatusList.contains(quizItem.status))
        .toList();

    // 選択する問題の上限数を取得
    final selectedStudyLength = state.selectedStudyLength;

    // filteredQuizList から selectedStudyLength の数だけ問題を選択
    final pickedQuizList = filteredQuizList.take(selectedStudyLength).toList();

    // 更新された selectStudyQuiz を生成
    final selectStudyQuiz = selectQuiz.copyWith(quizItemList: pickedQuizList);

    // ステートを更新
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
    final selectWeakQuiz =
        state.selectWeakQuiz!.copyWith(quizItemList: pickedQuizList);

    state = state.copyWith(selectWeakQuiz: selectWeakQuiz);
  }

  ///TestQuiz開始
  void tapStartRandomQuizButton() {
    final randomCategoryList = state.randomCategoryList;
    final selectedTestLength = state.selectedTestLength;
    ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.random);
    ref
        .read(quizModelProvider.notifier)
        .setRandomQuiz(randomCategoryList, selectedTestLength);
  }

  void setTabIndex(int index) {
    final category = state.categoryList[index];
    state = state.copyWith(tabIndex: index, selectCategory: category);
  }

  ///　出題範囲指定
  void setQuizStatusList(QuizStatusType status) {
    final selectedStatusList = [...state.selectedStatusList];
    if (selectedStatusList.contains(status)) {
      state = state.copyWith(
          selectedStatusList: selectedStatusList..remove(status));
    } else {
      state =
          state.copyWith(selectedStatusList: selectedStatusList..add(status));
    }
  }

  ///問題範囲指定
  void setRandomCategory(String category) {
    final randomCategoryList = [...state.randomCategoryList];
    if (randomCategoryList.contains(category)) {
      state = state.copyWith(
          randomCategoryList: randomCategoryList..remove(category));
    } else {
      state =
          state.copyWith(randomCategoryList: randomCategoryList..add(category));
    }
  }

  ///問題数指定
  void setStudyLength(int length) {
    state = state.copyWith(selectedStudyLength: length);
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
