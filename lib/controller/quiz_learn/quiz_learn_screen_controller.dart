import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../entity/quiz_item.dart';
import '../../screen/screen_argument.dart';

final quizLearnScreenControllerProvider =
    StateNotifierProvider<QuizLearnScreenController, QuizLearnScreenState>(
  (ref) => QuizLearnScreenController(ref: ref),
);

class QuizLearnScreenController extends StateNotifier<QuizLearnScreenState>
    with LocatorMixin {
  QuizLearnScreenController({required this.ref})
      : super(const QuizLearnScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  void dispose() {
    super.dispose();
  }

  ///確認ボタンを押した時
  void tapConfirmButton() {
    switchAnsView();
  }

  ///知ってるボタンを押したとき
  void tapKnownButton(QuizLearnScreenArguments arguments) {
    addKnownQuestion(arguments);
    nextQuiz(arguments);
    switchAnsView();
    switchKnowState(arguments);
  }

  ///知らないボタンを押した時
  void tapUnKnownButton(QuizLearnScreenArguments arguments) {
    addUnKnownQuestion(arguments);
    nextQuiz(arguments);
    switchAnsView();
    switchUnKnowState(arguments);
  }

  ///クリアボタン
  void tapClearButton() {
    state = state.copyWith(
      quizIndex: 0,
      lapIndex: 0,
      isAnsView: false,
      knowRememberQuestions: [],
      unKnowRememberQuestions: [],
    );
  }

  void switchAnsView() {
    state = state.copyWith(isAnsView: !state.isAnsView);
  }

  ///次の問題に進む
  void nextQuiz(QuizLearnScreenArguments arguments) {
    final quizIndex = state.quizIndex;
    final lapIndex = state.lapIndex;
    if (quizIndex == arguments.item.rememberQuiz.length - 1) {
      state = state.copyWith(quizIndex: 0, lapIndex: lapIndex + 1);
    } else if (state.knowRememberQuestions.length ==
        arguments.item.rememberQuiz.length) {
      print("全部解き終わったよ！");
    } else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
  }

  ///知らないボタンを押した時の苦手リストに追加
  void switchUnKnowState(QuizLearnScreenArguments arguments) {
    final rememberQuestions = [...arguments.item.rememberQuiz];
    if (!rememberQuestions[state.quizIndex].isWeak) {
      rememberQuestions[state.quizIndex] = LearnQuiz(
        quizId: rememberQuestions[state.quizIndex].quizId,
        question: rememberQuestions[state.quizIndex].question,
        ans: rememberQuestions[state.quizIndex].ans,
        isWeak: true,
      );
    } else {
      return;
    }
  }

  ///知らないボタンを押した時の苦手リストから解除
  void switchKnowState(QuizLearnScreenArguments arguments) {
    final rememberQuestions = [...arguments.item.rememberQuiz];
    if (!rememberQuestions[state.quizIndex].isWeak) {
      rememberQuestions[state.quizIndex] = LearnQuiz(
        quizId: rememberQuestions[state.quizIndex].quizId,
        question: rememberQuestions[state.quizIndex].question,
        ans: rememberQuestions[state.quizIndex].ans,
        isWeak: false,
      );
    } else {
      return;
    }
  }

  void addKnownQuestion(QuizLearnScreenArguments arguments) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];

    //すでに知ってるリストに含まれているとき
    if (knowRememberQuestions
        .contains(arguments.item.rememberQuiz[state.quizIndex])) {
    }
    //、知らないリストに含まれている場合
    else if (unKnowRememberQuestions
        .contains(arguments.item.rememberQuiz[state.quizIndex])) {
      knowRememberQuestions.add(arguments.item.rememberQuiz[state.quizIndex]);
      unKnowRememberQuestions
          .remove(arguments.item.rememberQuiz[state.quizIndex]);
    }
    //それ以外
    else {
      knowRememberQuestions.add(arguments.item.rememberQuiz[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }

  //知らないリストに追加
  void addUnKnownQuestion(QuizLearnScreenArguments arguments) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];

    //すでに含まれている場合
    if (unKnowRememberQuestions
        .contains(arguments.item.rememberQuiz[state.quizIndex])) {
    }
    //知ってるリストに含まれている場合
    else if (knowRememberQuestions
        .contains(arguments.item.rememberQuiz[state.quizIndex])) {
      knowRememberQuestions
          .remove(arguments.item.rememberQuiz[state.quizIndex]);
      unKnowRememberQuestions.add(arguments.item.rememberQuiz[state.quizIndex]);
    }
    //それ以外
    else {
      unKnowRememberQuestions.add(arguments.item.rememberQuiz[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }
}
