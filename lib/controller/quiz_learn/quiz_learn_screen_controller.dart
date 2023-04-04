import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../entity/quiz_item.dart';
import '../../screen/screen_argument.dart';
import '../home_review/home_review_screen_controller.dart';

final quizLearnScreenControllerProvider =
    StateNotifierProvider<QuizLearnScreenController, QuizLearnScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizLearnScreenController extends StateNotifier<QuizLearnScreenState>
    with LocatorMixin {
  QuizLearnScreenController({required this.ref, required this.arguments})
      : super(const QuizLearnScreenState()) {
    initState();
  }

  final Ref ref;
  QuizLearnScreenArguments arguments;

  @override
  void dispose() {
    super.dispose();
  }

  ///確認ボタンを押した時
  void tapConfirmButton() {
    //画面切り替え
    switchAnsView();
  }

  ///知ってるボタンを押したとき
  void tapKnownButton() {
    //知ってるリストに追加
    addKnownQuestion();
    //次の問題
    nextQuiz();
    // 答え画面切り替え
    switchAnsView();
    //「知ってる」にScore切り替え
    switchKnowState();
  }

  ///知らないボタンを押した時
  void tapUnKnownButton() {
    //知らないリストに追加
    addUnKnownQuestion();
    //次の問題
    nextQuiz();
    //画面切り替え
    switchAnsView();
    //「知らない」に切り替え
    switchUnKnowState();
  }

  ///クリアボタン
  void tapClearButton() {
    state = state.copyWith(
      quizIndex: 0,
      lapIndex: 0,
      isAnsView: false,
      isResultScreen: false,
      knowRememberQuestions: [],
      unKnowRememberQuestions: [],
    );
  }

  ///正解画面に切り替え
  void switchAnsView() {
    state = state.copyWith(isAnsView: !state.isAnsView);
  }

  ///結果画面に切り替え
  void switchResultScreen() {
    state = state.copyWith(isResultScreen: !state.isResultScreen);
  }

  ///次の問題に進む
  void nextQuiz() {
    final quizIndex = state.quizIndex;
    final lapIndex = state.lapIndex;
    //問題が終わったが,「知ってる」リストに全て含まれていない場合
    if (quizIndex == arguments.item.quiz.length - 1 &&
        state.knowRememberQuestions.length != arguments.item.quiz.length) {
      state = state.copyWith(quizIndex: 0, lapIndex: lapIndex + 1);
    }
    //問題が終わり,「知ってる」リストに全て含まれている場合
    else if (state.knowRememberQuestions.length == arguments.item.quiz.length) {
      state = state.copyWith(
          quizIndex: 0, lapIndex: lapIndex + 1, isResultScreen: true);
    }
    //まだ問題が続蹴られる時
    else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
  }

  ///知らないボタンを押した時の苦手リストに追加
  void switchUnKnowState() {
    final quiz = [...arguments.item.quiz];
    if (!quiz[state.quizIndex].isWeak) {
      quiz[state.quizIndex] = Quiz(
        quizId: quiz[state.quizIndex].quizId,
        question: quiz[state.quizIndex].question,
        ans: quiz[state.quizIndex].ans,
        isWeak: true,
        choices: quiz[state.quizIndex].choices,
      );
    } else {
      return;
    }
  }

  ///知らないボタンを押した時の苦手リストから解除
  void switchKnowState() {
    final quiz = [...arguments.item.quiz];
    if (!quiz[state.quizIndex].isWeak) {
      quiz[state.quizIndex] = Quiz(
        quizId: quiz[state.quizIndex].quizId,
        question: quiz[state.quizIndex].question,
        ans: quiz[state.quizIndex].ans,
        isWeak: false,
        choices: quiz[state.quizIndex].choices,
      );
    } else {
      return;
    }
  }

  ///知ってるリストに追加
  void addKnownQuestion() {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];

    //すでに知ってるリストに含まれているとき
    if (knowRememberQuestions.contains(arguments.item.quiz[state.quizIndex])) {
    }
    //、知らないリストに含まれている場合
    else if (unKnowRememberQuestions
        .contains(arguments.item.quiz[state.quizIndex])) {
      knowRememberQuestions.add(arguments.item.quiz[state.quizIndex]);
      unKnowRememberQuestions.remove(arguments.item.quiz[state.quizIndex]);
    }
    //それ以外
    else {
      knowRememberQuestions.add(arguments.item.quiz[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }

  ///知らないリストに追加
  void addUnKnownQuestion() {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];

    //すでに含まれている場合
    if (unKnowRememberQuestions
        .contains(arguments.item.quiz[state.quizIndex])) {
    }
    //知ってるリストに含まれている場合
    else if (knowRememberQuestions
        .contains(arguments.item.quiz[state.quizIndex])) {
      knowRememberQuestions.remove(arguments.item.quiz[state.quizIndex]);
      unKnowRememberQuestions.add(arguments.item.quiz[state.quizIndex]);
    }
    //それ以外
    else {
      unKnowRememberQuestions.add(arguments.item.quiz[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }

  ///知っている問題のチェックボックス切り替え
  void switchKnowCheckBox(int index) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    //チェックした時
    if (!knowRememberQuestions[index].isWeak) {
      knowRememberQuestions[index] = Quiz(
        quizId: knowRememberQuestions[index].quizId,
        question: knowRememberQuestions[index].question,
        ans: knowRememberQuestions[index].ans,
        isWeak: true,
        choices: knowRememberQuestions[index].choices,
      );
      //復習リストに追加
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .addLearnQuiz(knowRememberQuestions[index]);
    }
    //チェックしてない時
    else {
      knowRememberQuestions[index] = Quiz(
        quizId: knowRememberQuestions[index].quizId,
        question: knowRememberQuestions[index].question,
        ans: knowRememberQuestions[index].ans,
        isWeak: false,
        choices: knowRememberQuestions[index].choices,
      );
      //復習リストから除外
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .removeLearnQuiz(knowRememberQuestions[index]);
    }
    state = state.copyWith(knowRememberQuestions: knowRememberQuestions);
  }

  ///知らない問題のチェックボックス切り替え
  void switchUnKnowCheckBox(int index) {
    final unknowRememberQuestions = [...state.unKnowRememberQuestions];
    if (!unknowRememberQuestions[index].isWeak) {
      unknowRememberQuestions[index] = Quiz(
        quizId: unknowRememberQuestions[index].quizId,
        question: unknowRememberQuestions[index].question,
        ans: unknowRememberQuestions[index].ans,
        isWeak: true,
        choices: unknowRememberQuestions[index].choices,
      );
    } else if (unknowRememberQuestions[index].isWeak) {
      unknowRememberQuestions[index] = Quiz(
        quizId: unknowRememberQuestions[index].quizId,
        question: unknowRememberQuestions[index].question,
        ans: unknowRememberQuestions[index].ans,
        isWeak: false,
        choices: unknowRememberQuestions[index].choices,
      );
    } else {
      return;
    }
    state = state.copyWith(unKnowRememberQuestions: unknowRememberQuestions);
  }
}
