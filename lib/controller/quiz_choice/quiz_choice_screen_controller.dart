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
      ...arguments.item.quizList[state.quizIndex].choices
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
    final quizList = arguments.item.quizList;
    final correctList = [...state.correctList];

    //正解
    if (choice == quizList[state.quizIndex].ans) {
      quizList[state.quizIndex] = Quiz(
        quizId: quizList[state.quizIndex].quizId,
        question: quizList[state.quizIndex].question,
        ans: quizList[state.quizIndex].ans,
        isJudge: true, //正解
        isWeak: false, //苦手リスト除外
        choices: quizList[state.quizIndex].choices,
      );
      //スコア反映
      correctList.add(quizList[state.quizIndex]);
      state = state.copyWith(isJudge: true, correctList: quizList);
    }
    //不正解
    else {
      quizList[state.quizIndex] = Quiz(
        quizId: quizList[state.quizIndex].quizId,
        question: quizList[state.quizIndex].question,
        ans: quizList[state.quizIndex].ans,
        choices: quizList[state.quizIndex].choices,
        isJudge: false, //不正解
        isWeak: true, //苦手リスト追加
      );
      correctList.add(quizList[state.quizIndex]);
      //復習リストに追加
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .addChoiceQuiz(quizList[state.quizIndex]);

      state = state.copyWith(isJudge: false, correctList: quizList);
    }
    print(quizList[state.quizIndex].isJudge);
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
    if (quizIndex == arguments.item.quizList.length - 1) {
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

  ///チェックボックス切り替え
  void tapCorrectCheckBox(int index) {
    final quizList = arguments.item.quizList;

    //チェックした時
    if (!quizList[index].isWeak) {
      quizList[index] = Quiz(
        quizId: quizList[index].quizId,
        question: quizList[index].question,
        ans: quizList[index].ans,
        isWeak: true,
        isJudge: quizList[index].isJudge,
        choices: quizList[index].choices,
      );
      //復習リストに追加
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .addLearnQuiz(quizList[index]);
    }
    //チェック外した時
    else {
      quizList[index] = Quiz(
        quizId: quizList[index].quizId,
        question: quizList[index].question,
        ans: quizList[index].ans,
        isWeak: false,
        isJudge: quizList[index].isJudge,
        choices: quizList[index].choices,
      );
      //復習リストから除外
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .removeLearnQuiz(quizList[index]);
    }
    state = state.copyWith(correctList: quizList);
  }
}
