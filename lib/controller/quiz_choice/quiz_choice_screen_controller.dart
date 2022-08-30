import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_state.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../screen/screen_argument.dart';
import '../home_review/home_review_screen_controller.dart';

final quizChoiceScreenControllerProvider =
    StateNotifierProvider<QuizChoiceScreenController, QuizChoiceScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizChoiceScreenController extends StateNotifier<QuizChoiceScreenState>
    with LocatorMixin {
  QuizChoiceScreenController({required this.ref, required this.arguments})
      : super(const QuizChoiceScreenState()) {
    initState();
  }
  final Ref ref;
  QuizChoiceScreenArguments arguments;

  @override
  void initState() {
    //選択肢表示
    shuffleChoice();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///選択肢を混ぜる
  void shuffleChoice() {
    final choices = [...state.choices]..clear();
    final argumentsChoices = [
      ...arguments.item.choiceQuiz[state.quizIndex].choices
    ];
    argumentsChoices.shuffle();
    choices.addAll(argumentsChoices);
    state = state.copyWith(choices: choices);
  }

  ///選択肢を押した時
  void tapChoiceButton(String choice) {
    //正誤判定,スコア判定
    judgementQuiz(choice);
    //答え表示,次の問題
    switchAnsView();
  }

  ///クイズ判定
  void judgementQuiz(String choice) {
    final choiceQuiz = [...arguments.item.choiceQuiz];
    final correctList = [...state.correctList];
    final incorrectList = [...state.incorrectList];

    //正誤
    if (choice == choiceQuiz[state.quizIndex].ans) {
      //スコア反映
      correctList.add(choiceQuiz[state.quizIndex]);
      state = state.copyWith(isJudge: true, correctList: correctList);
    }
    //不正解
    else {
      choiceQuiz[state.quizIndex] = ChoiceQuiz(
        quizId: choiceQuiz[state.quizIndex].quizId,
        question: choiceQuiz[state.quizIndex].question,
        ans: choiceQuiz[state.quizIndex].ans,
        choices: choiceQuiz[state.quizIndex].choices,
        isWeak: true,
      );
      incorrectList.add(choiceQuiz[state.quizIndex]);
      //復習リストに追加
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .addChoiceQuiz(choiceQuiz[state.quizIndex]);

      state = state.copyWith(isJudge: false, incorrectList: incorrectList);
    }
  }

  ///正解表示
  void switchAnsView() {
    state = state.copyWith(isAnsView: true);
    Future.delayed(const Duration(milliseconds: 800), () {
      state = state.copyWith(isAnsView: false);
      //次のクイズ
      nextQuiz();
    });
  }

  ///次の問題
  void nextQuiz() {
    final quizIndex = state.quizIndex;
    if (quizIndex == arguments.item.choiceQuiz.length - 1) {
      print("終了!");
      state = state.copyWith(quizIndex: 0, isResultScreen: true);
    } else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
    shuffleChoice();
  }

  ///クリアボタン
  void tapClearButton() {
    state = state.copyWith(
      quizIndex: 0,
      isAnsView: false,
      isResultScreen: false,
      correctList: [],
      incorrectList: [],
    );
  }

  ///結果画面に切り替え
  void switchResultScreen() {
    state = state.copyWith(isResultScreen: !state.isResultScreen);
  }

  ///チェックボックス切り替え(正解リスト)
  void tapCorrectCheckBox(int index) {
    final correctList = [...state.correctList];
    //チェックした時
    if (!correctList[index].isWeak) {
      correctList[index] = ChoiceQuiz(
        quizId: correctList[index].quizId,
        question: correctList[index].question,
        ans: correctList[index].ans,
        choices: correctList[index].choices,
        isWeak: true,
      );
      //復習リストに追加
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .addChoiceQuiz(correctList[index]);
    }
    //チェックしてない時
    else {
      correctList[index] = ChoiceQuiz(
        quizId: correctList[index].quizId,
        question: correctList[index].question,
        ans: correctList[index].ans,
        choices: correctList[index].choices,
        isWeak: false,
      );
    }
    state = state.copyWith(correctList: correctList);
  }

  ///チェックボックス切り替え(不正解リスト)
  void tapIncorrectCheckBox(int index) {
    final incorrectList = [...state.incorrectList];
    //チェックした時
    if (!incorrectList[index].isWeak) {
      incorrectList[index] = ChoiceQuiz(
        quizId: incorrectList[index].quizId,
        question: incorrectList[index].question,
        ans: incorrectList[index].ans,
        choices: incorrectList[index].choices,
        isWeak: true,
      );
      //復習リストに追加
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .addChoiceQuiz(incorrectList[index]);
    }
    //チェックしてない時
    else {
      incorrectList[index] = ChoiceQuiz(
        quizId: incorrectList[index].quizId,
        question: incorrectList[index].question,
        ans: incorrectList[index].ans,
        choices: incorrectList[index].choices,
        isWeak: false,
      );

      //復習リストから削除
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .removeChoiceQuiz(incorrectList[index]);
    }
    state = state.copyWith(incorrectList: incorrectList);
  }
}
