import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../home_review/home_review_screen_controller.dart';
import '../quiz/quiz_state.dart';
import '../quiz_item/quiz_item_state.dart';

final quizChoiceScreenControllerProvider =
    StateNotifierProvider<QuizChoiceScreenController, QuizChoiceScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizChoiceScreenController extends StateNotifier<QuizChoiceScreenState>
    with LocatorMixin {
  QuizChoiceScreenController({required this.ref, required this.item})
      : super(const QuizChoiceScreenState()) {
    initState();
  }
  final Ref ref;
  // QuizChoiceScreenArguments arguments;
  QuizItemState item;

  @override
  void initState() {
    //選択肢表示
    shuffleChoice();
    super.initState();
  }

  ///選択肢を混ぜる
  void shuffleChoice() {
    final choices = [...state.choices]..clear();
    final argumentsChoices = [...item.quizList[state.quizIndex].choices];
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
    final quizList = item.quizList;
    final correctList = [...state.correctList];

    //正解
    if (choice == quizList[state.quizIndex].ans) {
      quizList[state.quizIndex] = QuizState(
        quizId: quizList[state.quizIndex].quizId,
        question: quizList[state.quizIndex].question,
        ans: quizList[state.quizIndex].ans,
        isJudge: true, //正解
        isWeak: quizList[state.quizIndex].isWeak, //苦手リスト除外
        choices: quizList[state.quizIndex].choices,
      );
      //スコア反映
      correctList.add(quizList[state.quizIndex]);
      state = state.copyWith(isJudge: true, correctList: quizList);
    }
    //不正解
    else {
      quizList[state.quizIndex] = QuizState(
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
    //問題が終わった時
    if (quizIndex == item.quizList.length - 1) {
      state = state.copyWith(quizIndex: 0, isResultScreen: true);
      setQuizScore();
    }
    //問題がまだある時
    else {
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

  ///チェックボックス切り替え
  void tapCorrectCheckBox(int index) {
    final quizList = item.quizList;
    //チェックした時
    if (!quizList[index].isWeak) {
      quizList[index] = QuizState(
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
      quizList[index] = QuizState(
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

  ///クイズスコア反映
  void setQuizScore() {
    var quizItem = item;
    final scoreCount =
        quizItem.quizList.where((x) => x.isJudge == true).toList().length;
    final quizCount = quizItem.quizList.length;

    //全問正解の時
    if (scoreCount == quizCount) {
      quizItem = QuizItemState(
        id: quizItem.id,
        group: quizItem.group,
        title: quizItem.title,
        isCompleted: true,
        quizList: quizItem.quizList,
      );
    }
    //全問正解じゃない時
    else {
      quizItem = QuizItemState(
        id: quizItem.id,
        group: quizItem.group,
        title: quizItem.title,
        isCompleted: true,
        quizList: quizItem.quizList,
      );
    }
    print(quizItem.isCompleted);
    state = state.copyWith(
        scoreCount:
            item.quizList.where((x) => x.isJudge == true).toList().length,
        quizItem: quizItem);
  }
}
