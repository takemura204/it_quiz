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
  void initState() {
    addQuizList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addQuizList() {
    final quizList = [...state.quizList];
    quizList.addAll(arguments.item.quizList);
    state = state.copyWith(quizList: quizList);
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
    final quizList = state.quizList;
    final knowRememberQuestions = state.knowRememberQuestions;
    final unKnowRememberQuestions = state.unKnowRememberQuestions;
    //問題が終わったが,「知ってる」リストに全て含まれていない場合
    if (quizIndex == quizList.length - 1 &&
        knowRememberQuestions.length != arguments.item.quizList.length) {
      quizList.clear();
      quizList.addAll(unKnowRememberQuestions);
      state = state.copyWith(quizIndex: 0, lapIndex: lapIndex + 1);
    }
    //問題が終わり,「知ってる」リストに全て含まれている場合
    else if (state.knowRememberQuestions.length ==
        arguments.item.quizList.length) {
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
    final quiz = [...arguments.item.quizList];
    if (!quiz[state.quizIndex].isWeak) {
      quiz[state.quizIndex] = Quiz(
        quizId: quiz[state.quizIndex].quizId,
        question: quiz[state.quizIndex].question,
        ans: quiz[state.quizIndex].ans,
        isWeak: true,
        isJudge: quiz[state.quizIndex].isJudge,
        choices: quiz[state.quizIndex].choices,
      );
    } else {
      return;
    }
  }

  ///知らないボタンを押した時の苦手リストから解除
  void switchKnowState() {
    final quizList = [...arguments.item.quizList];
    if (!quizList[state.quizIndex].isWeak) {
      quizList[state.quizIndex] = Quiz(
        quizId: quizList[state.quizIndex].quizId,
        question: quizList[state.quizIndex].question,
        ans: quizList[state.quizIndex].ans,
        isWeak: false,
        isJudge: quizList[state.quizIndex].isJudge,
        choices: quizList[state.quizIndex].choices,
      );
    } else {
      return;
    }
  }

  ///知ってるリストに追加
  void addKnownQuestion() {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];
    final quizList = [...state.quizList];

    //すでに知ってるリストに含まれているとき
    if (knowRememberQuestions.contains(quizList[state.quizIndex])) {
    }
    //、知らないリストに含まれている場合
    else if (unKnowRememberQuestions.contains(quizList[state.quizIndex])) {
      knowRememberQuestions.add(quizList[state.quizIndex]);
      unKnowRememberQuestions.remove(quizList[state.quizIndex]);
    }
    //それ以外
    else {
      knowRememberQuestions.add(quizList[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
      quizList: quizList,
    );
  }

  ///知らないリストに追加
  void addUnKnownQuestion() {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];
    final quizList = [...state.quizList];

    //すでに含まれている場合
    if (unKnowRememberQuestions.contains(quizList[state.quizIndex])) {
    }
    //知ってるリストに含まれている場合
    else if (knowRememberQuestions.contains(quizList[state.quizIndex])) {
      knowRememberQuestions.remove(quizList[state.quizIndex]);
      unKnowRememberQuestions.add(quizList[state.quizIndex]);
    }
    //それ以外
    else {
      unKnowRememberQuestions.add(quizList[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
      quizList: quizList,
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
        isJudge: knowRememberQuestions[state.quizIndex].isJudge,
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
        isJudge: knowRememberQuestions[state.quizIndex].isJudge,
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
        isJudge: unknowRememberQuestions[state.quizIndex].isJudge,
        choices: unknowRememberQuestions[index].choices,
      );
    } else if (unknowRememberQuestions[index].isWeak) {
      unknowRememberQuestions[index] = Quiz(
        quizId: unknowRememberQuestions[index].quizId,
        question: unknowRememberQuestions[index].question,
        ans: unknowRememberQuestions[index].ans,
        isWeak: false,
        isJudge: unknowRememberQuestions[state.quizIndex].isJudge,
        choices: unknowRememberQuestions[index].choices,
      );
    } else {
      return;
    }
    state = state.copyWith(unKnowRememberQuestions: unknowRememberQuestions);
  }
}
