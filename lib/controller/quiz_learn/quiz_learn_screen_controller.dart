import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../entity/quiz_item.dart';
import '../../screen/screen_argument.dart';
import '../home_review/home_review_screen_controller.dart';

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
    //画面切り替え
    switchAnsView();
  }

  ///知ってるボタンを押したとき
  void tapKnownButton(QuizLearnScreenArguments arguments) {
    //知ってるリストに追加
    addKnownQuestion(arguments);
    //次の問題
    nextQuiz(arguments);
    // 答え画面切り替え
    switchAnsView();
    //「知ってる」にScore切り替え
    switchKnowState(arguments);
  }

  ///知らないボタンを押した時
  void tapUnKnownButton(QuizLearnScreenArguments arguments) {
    //知らないリストに追加
    addUnKnownQuestion(arguments);
    //次の問題
    nextQuiz(arguments);
    //画面切り替え
    switchAnsView();
    //「知らない」に切り替え
    switchUnKnowState(arguments);
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
  void nextQuiz(QuizLearnScreenArguments arguments) {
    final quizIndex = state.quizIndex;
    final lapIndex = state.lapIndex;
    //問題が終わったが,「知ってる」リストに全て含まれていない場合
    if (quizIndex == arguments.item.learnQuiz.length - 1 &&
        state.knowRememberQuestions.length != arguments.item.learnQuiz.length) {
      state = state.copyWith(quizIndex: 0, lapIndex: lapIndex + 1);
    }
    //問題が終わり,「知ってる」リストに全て含まれている場合
    else if (state.knowRememberQuestions.length ==
        arguments.item.learnQuiz.length) {
      state = state.copyWith(
          quizIndex: 0, lapIndex: lapIndex + 1, isResultScreen: true);
    }
    //まだ問題が続蹴られる時
    else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
  }

  ///知らないボタンを押した時の苦手リストに追加
  void switchUnKnowState(QuizLearnScreenArguments arguments) {
    final rememberQuestions = [...arguments.item.learnQuiz];
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
    final rememberQuestions = [...arguments.item.learnQuiz];
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

  ///知ってるリストに追加
  void addKnownQuestion(QuizLearnScreenArguments arguments) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];

    //すでに知ってるリストに含まれているとき
    if (knowRememberQuestions
        .contains(arguments.item.learnQuiz[state.quizIndex])) {
    }
    //、知らないリストに含まれている場合
    else if (unKnowRememberQuestions
        .contains(arguments.item.learnQuiz[state.quizIndex])) {
      knowRememberQuestions.add(arguments.item.learnQuiz[state.quizIndex]);
      unKnowRememberQuestions.remove(arguments.item.learnQuiz[state.quizIndex]);
    }
    //それ以外
    else {
      knowRememberQuestions.add(arguments.item.learnQuiz[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }

  ///知らないリストに追加
  void addUnKnownQuestion(QuizLearnScreenArguments arguments) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];

    //すでに含まれている場合
    if (unKnowRememberQuestions
        .contains(arguments.item.learnQuiz[state.quizIndex])) {
    }
    //知ってるリストに含まれている場合
    else if (knowRememberQuestions
        .contains(arguments.item.learnQuiz[state.quizIndex])) {
      knowRememberQuestions.remove(arguments.item.learnQuiz[state.quizIndex]);
      unKnowRememberQuestions.add(arguments.item.learnQuiz[state.quizIndex]);
    }
    //それ以外
    else {
      unKnowRememberQuestions.add(arguments.item.learnQuiz[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }

  ///知っている問題のチェックボックス切り替え
  void switchKnowCheckBox(int index) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    if (!knowRememberQuestions[index].isWeak) {
      knowRememberQuestions[index] = LearnQuiz(
        quizId: knowRememberQuestions[index].quizId,
        question: knowRememberQuestions[index].question,
        ans: knowRememberQuestions[index].ans,
        isWeak: true,
      );
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .addRememberQuestions(knowRememberQuestions[index]);
    } else if (knowRememberQuestions[index].isWeak) {
      knowRememberQuestions[index] = LearnQuiz(
        quizId: knowRememberQuestions[index].quizId,
        question: knowRememberQuestions[index].question,
        ans: knowRememberQuestions[index].ans,
        isWeak: false,
      );
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .removeRememberQuestions(knowRememberQuestions[index]);
    } else {
      return;
    }
    state = state.copyWith(knowRememberQuestions: knowRememberQuestions);
  }

  ///知らない問題のチェックボックス切り替え
  void switchUnKnowCheckBox(QuizLearnScreenArguments arguments, int index) {
    final unknowRememberQuestions = [...state.unKnowRememberQuestions];
    if (!unknowRememberQuestions[index].isWeak) {
      unknowRememberQuestions[index] = LearnQuiz(
        quizId: unknowRememberQuestions[index].quizId,
        question: unknowRememberQuestions[index].question,
        ans: unknowRememberQuestions[index].ans,
        isWeak: true,
      );
    } else if (unknowRememberQuestions[index].isWeak) {
      unknowRememberQuestions[index] = LearnQuiz(
        quizId: unknowRememberQuestions[index].quizId,
        question: unknowRememberQuestions[index].question,
        ans: unknowRememberQuestions[index].ans,
        isWeak: false,
      );
    } else {
      return;
    }
    state = state.copyWith(unKnowRememberQuestions: unknowRememberQuestions);
  }
}
