import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_true_false/quiz_true_false_state.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../screen/screen_argument.dart';

final quizTureFalseScreenControllerProvider = StateNotifierProvider<
    QuizTrueFalseScreenController, QuizTrueFalseScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizTrueFalseScreenController
    extends StateNotifier<QuizTrueFalseScreenState> with LocatorMixin {
  QuizTrueFalseScreenController({required this.ref, required this.arguments})
      : super(const QuizTrueFalseScreenState()) {
    initState();
  }

  final Ref ref;
  QuizTrueFalseScreenArguments arguments;

  @override
  void initState() {
    //選択肢表示
    shuffleAns();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///選択肢を混ぜる
  void shuffleAns() {
    final choices = [...state.choices]..clear();
    final argumentsChoices = [
      ...arguments.item.trueFalseQuiz[state.quizIndex].choices
    ];
    argumentsChoices.shuffle();
    choices.addAll(argumentsChoices);

    final randomAns = choices.first;
    state = state.copyWith(choices: choices, randomAns: randomAns);
  }

  ///選択肢を押した時
  void tapBoolButton(bool ans) {
    //正誤判定,スコア判定
    judgementQuiz(ans);
    //答え表示,次の問題
    switchAnsView();
  }

  ///クイズ判定
  void judgementQuiz(bool ans) {
    final randomAns = state.choices.first;
    final trueFalseQuiz = [...arguments.item.trueFalseQuiz];
    final correctList = [...state.correctList];
    final incorrectList = [...state.incorrectList];

    //丸ボタンを押した時
    if (ans) {
      //正解の時
      if (randomAns == trueFalseQuiz[state.quizIndex].ans) {
        //正解リストに追加
        correctList.add(trueFalseQuiz[state.quizIndex]);
        //スコア反映
        state = state.copyWith(isJudge: true, correctList: correctList);
      }
      //不正解の時
      else {
        trueFalseQuiz[state.quizIndex] = TrueFalseQuiz(
          quizId: trueFalseQuiz[state.quizIndex].quizId,
          question: trueFalseQuiz[state.quizIndex].question,
          ans: trueFalseQuiz[state.quizIndex].ans,
          choices: trueFalseQuiz[state.quizIndex].choices,
          isWeak: true,
        );
        incorrectList.add(trueFalseQuiz[state.quizIndex]);
        //復習リストに追加
        // ref
        //     .read(homeReviewScreenControllerProvider.notifier)
        //     .addChoiceQuiz(trueFalseQuiz[state.quizIndex]);

        state = state.copyWith(isJudge: false, incorrectList: incorrectList);
      }
    }
    //×ボタンを押した時
    else {
      //正解の時
      if (randomAns != trueFalseQuiz[state.quizIndex].ans) {
        //正解リストに追加
        correctList.add(trueFalseQuiz[state.quizIndex]);
        //スコア反映
        state = state.copyWith(isJudge: true, correctList: correctList);
      }
      //不正解の時
      else {
        trueFalseQuiz[state.quizIndex] = TrueFalseQuiz(
          quizId: trueFalseQuiz[state.quizIndex].quizId,
          question: trueFalseQuiz[state.quizIndex].question,
          ans: trueFalseQuiz[state.quizIndex].ans,
          choices: trueFalseQuiz[state.quizIndex].choices,
          isWeak: true,
        );
        incorrectList.add(trueFalseQuiz[state.quizIndex]);
        //復習リストに追加
        // ref
        //     .read(homeReviewScreenControllerProvider.notifier)
        //     .addChoiceQuiz(trueFalseQuiz[state.quizIndex]);

        state = state.copyWith(isJudge: false, incorrectList: incorrectList);
      }
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
    shuffleAns();
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
      correctList[index] = TrueFalseQuiz(
        quizId: correctList[index].quizId,
        question: correctList[index].question,
        ans: correctList[index].ans,
        isWeak: true,
        choices: correctList[index].choices,
      );
      //復習リストに追加
      // ref
      //     .read(homeReviewScreenControllerProvider.notifier)
      //     .addChoiceQuiz(correctList[index]);
    }
    //チェックしてない時
    else {
      correctList[index] = TrueFalseQuiz(
        quizId: correctList[index].quizId,
        question: correctList[index].question,
        ans: correctList[index].ans,
        isWeak: false,
        choices: correctList[index].choices,
      );
    }
    state = state.copyWith(correctList: correctList);
  }

  ///チェックボックス切り替え(不正解リスト)
  void tapIncorrectCheckBox(int index) {
    final incorrectList = [...state.incorrectList];
    //チェックした時
    if (!incorrectList[index].isWeak) {
      incorrectList[index] = TrueFalseQuiz(
        quizId: incorrectList[index].quizId,
        question: incorrectList[index].question,
        ans: incorrectList[index].ans,
        isWeak: true,
        choices: incorrectList[index].choices,
      );
      //復習リストに追加
      // ref
      //     .read(homeReviewScreenControllerProvider.notifier)
      //     .addChoiceQuiz(incorrectList[index]);
    }
    //チェックしてない時
    else {
      incorrectList[index] = TrueFalseQuiz(
        quizId: incorrectList[index].quizId,
        question: incorrectList[index].question,
        ans: incorrectList[index].ans,
        isWeak: false,
        choices: incorrectList[index].choices,
      );

      //復習リストから削除
      // ref
      //     .read(homeReviewScreenControllerProvider.notifier)
      //     .removeChoiceQuiz(incorrectList[index]);
    }
    state = state.copyWith(incorrectList: incorrectList);
  }
}
