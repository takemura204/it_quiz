import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../screen/screen_argument.dart';

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
    final choiceQuiz = [...arguments.item.choiceQuiz][state.quizIndex];
    final correctList = [...state.correctList];
    final incorrectList = [...state.incorrectList];

    //正誤
    if (choice == choiceQuiz.ans) {
      //スコア反映
      correctList.add(choiceQuiz);
      print("correctList");
      state = state.copyWith(isJudge: true, correctList: correctList);
    }
    //不正解
    else {
      incorrectList.add(choiceQuiz);
      print("incorrectList");
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
}
