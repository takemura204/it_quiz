import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_true_false/quiz_true_false_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../screen/screen_argument.dart';
import '../quiz/quiz_state.dart';

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

  ///選択肢を混ぜる
  void shuffleAns() {
    final choices = [...state.choices]..clear();
    final argumentsChoices = [
      ...arguments.item.quizList[state.quizIndex].choices
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
    final quizList = [...arguments.item.quizList];
    final correctList = [...state.correctList];
    final incorrectList = [...state.incorrectList];
    final quizIndex = state.quizIndex;

    //丸ボタンを押した時
    if (ans) {
      //正解の時
      if (randomAns == quizList[quizIndex].ans) {
        quizList[quizIndex] = QuizState(
          quizId: quizList[quizIndex].quizId,
          question: quizList[quizIndex].question,
          ans: quizList[quizIndex].ans,
          choices: quizList[quizIndex].choices,
          comment: quizList[quizIndex].comment,
          isJudge: true,
          isWeak: false,
        );
        //正解リストに追加
        correctList.add(quizList[quizIndex]);
        //スコア反映
        state = state.copyWith(isJudge: true, correctList: correctList);
      }
      //不正解の時
      else {
        quizList[quizIndex] = QuizState(
          quizId: quizList[quizIndex].quizId,
          question: quizList[quizIndex].question,
          ans: quizList[quizIndex].ans,
          choices: quizList[quizIndex].choices,
          comment: quizList[quizIndex].comment,
          isJudge: false,
          isWeak: true,
        );
        incorrectList.add(quizList[quizIndex]);

        state = state.copyWith(isJudge: false, incorrectList: incorrectList);
      }
    }
    //×ボタンを押した時
    else {
      //正解の時
      if (randomAns != quizList[quizIndex].ans) {
        //正解リストに追加
        correctList.add(quizList[quizIndex]);
        //スコア反映
        state = state.copyWith(isJudge: true, correctList: correctList);
      }
      //不正解の時
      else {
        quizList[quizIndex] = QuizState(
          quizId: quizList[quizIndex].quizId,
          question: quizList[quizIndex].question,
          ans: quizList[quizIndex].ans,
          comment: incorrectList[quizIndex].comment,
          choices: quizList[quizIndex].choices,
          isJudge: false,
          isWeak: true,
        );
        incorrectList.add(quizList[quizIndex]);

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
    if (quizIndex == arguments.item.quizList.length - 1) {
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
  void tapCorrectCheckBox(int quizIndex) {
    final correctList = [...state.correctList];
    //チェックした時
    if (!correctList[quizIndex].isWeak) {
      correctList[quizIndex] = QuizState(
        quizId: correctList[quizIndex].quizId,
        question: correctList[quizIndex].question,
        ans: correctList[quizIndex].ans,
        comment: correctList[quizIndex].comment,
        isWeak: true,
        isJudge: correctList[quizIndex].isJudge,
        choices: correctList[quizIndex].choices,
      );
    }
    //チェックしてない時
    else {
      correctList[quizIndex] = QuizState(
        quizId: correctList[quizIndex].quizId,
        question: correctList[quizIndex].question,
        ans: correctList[quizIndex].ans,
        comment: correctList[quizIndex].comment,
        isWeak: false,
        isJudge: correctList[quizIndex].isJudge,
        choices: correctList[quizIndex].choices,
      );
    }
    state = state.copyWith(correctList: correctList);
  }

  ///チェックボックス切り替え(不正解リスト)
  void tapIncorrectCheckBox(int quizIndex) {
    final incorrectList = [...state.incorrectList];
    //チェックした時
    if (!incorrectList[quizIndex].isWeak) {
      incorrectList[quizIndex] = QuizState(
        quizId: incorrectList[quizIndex].quizId,
        question: incorrectList[quizIndex].question,
        ans: incorrectList[quizIndex].ans,
        comment: incorrectList[quizIndex].comment,
        isWeak: true,
        isJudge: incorrectList[quizIndex].isJudge,
        choices: incorrectList[quizIndex].choices,
      );
    }
    //チェックしてない時
    else {
      incorrectList[quizIndex] = QuizState(
        quizId: incorrectList[quizIndex].quizId,
        question: incorrectList[quizIndex].question,
        ans: incorrectList[quizIndex].ans,
        comment: incorrectList[quizIndex].comment,
        isWeak: false,
        isJudge: incorrectList[quizIndex].isJudge,
        choices: incorrectList[quizIndex].choices,
      );
    }
    state = state.copyWith(incorrectList: incorrectList);
  }
}
