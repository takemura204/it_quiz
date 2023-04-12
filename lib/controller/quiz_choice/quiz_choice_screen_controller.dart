import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_study/home_study_screen_controller.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../quiz/quiz_state.dart';
import '../quiz_item/quiz_item_state.dart';

final quizChoiceScreenProvider =
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
  QuizItemState item;

  @override
  void initState() {
    addQuizList(); //クイズ追加
    shuffleChoice(); //選択肢表示
    super.initState();
  }

  ///クイズ更新
  void addQuizList() {
    //クイズリスト更新
    final quizList = [...state.quizList];
    quizList.addAll(item.quizList);
    state = state.copyWith(quizList: quizList);
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
    judgementQuiz(choice); //正誤判定,スコア判定
    switchAnsView(); //答え表示,次の問題
  }

  ///クイズ判定
  void judgementQuiz(String choice) {
    final quizList = [...state.quizList];
    final quizIndex = state.quizIndex;
    //正解
    if (choice == quizList[quizIndex].ans) {
      quizList[quizIndex] = QuizState(
        quizId: quizList[quizIndex].quizId,
        question: quizList[quizIndex].question,
        ans: quizList[quizIndex].ans,
        isJudge: true, //正解
        isWeak: quizList[quizIndex].isWeak, //苦手リスト除外
        choices: quizList[quizIndex].choices,
      );
      state = state.copyWith(isJudge: true, quizList: quizList);
    }
    //不正解
    else {
      quizList[quizIndex] = QuizState(
        quizId: quizList[quizIndex].quizId,
        question: quizList[quizIndex].question,
        ans: quizList[quizIndex].ans,
        choices: quizList[quizIndex].choices,
        isJudge: false, //不正解
        isWeak: true, //苦手リスト追加
      );
      state = state.copyWith(isJudge: false, quizList: quizList);
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
      setResult();
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
    );
  }

  ///チェックボックス切り替え
  void switchCheckBox(int index) {
    final quizList = [...state.quizList];
    quizList[index] = QuizState(
      quizId: quizList[index].quizId,
      question: quizList[index].question,
      ans: quizList[index].ans,
      isWeak: !quizList[index].isWeak,
      isJudge: quizList[index].isJudge,
      choices: quizList[index].choices,
    );
    state = state.copyWith(quizList: quizList);
  }

  ///クイズ更新
  void setResult() {
    final quizList = state.quizList;
    final correctList = quizList.where((x) => x.isJudge == true).toList();
    final isResult = quizList.length == correctList.length;
    ref
        .read(homeStudyScreenControllerProvider.notifier)
        .setQuizItem(isResult, quizList); //homeStudyScreenに反映
  }
}
