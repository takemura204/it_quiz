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
    final quizList = arguments.item.quizList;
    quizList[state.quizIndex] = Quiz(
      quizId: quizList[state.quizIndex].quizId,
      question: quizList[state.quizIndex].question,
      ans: quizList[state.quizIndex].ans,
      isWeak: quizList[state.quizIndex].isWeak,
      isJudge: true, //「知っている」に更新
      choices: quizList[state.quizIndex].choices,
    );

    addKnownQuestion(); //知ってるリストに追加
    nextQuiz(); //次の問題
    switchAnsView(); // 答え画面切り替え
  }

  ///知らないボタンを押した時
  void tapUnKnownButton() {
    final quizList = arguments.item.quizList;
    quizList[state.quizIndex] = Quiz(
      quizId: quizList[state.quizIndex].quizId,
      question: quizList[state.quizIndex].question,
      ans: quizList[state.quizIndex].ans,
      isWeak: quizList[state.quizIndex].isWeak,
      isJudge: false, //「知らない」に更新
      choices: quizList[state.quizIndex].choices,
    );

    addUnKnownQuestion(); //知らないリストに追加
    nextQuiz(); //次の問題
    switchAnsView(); //答え画面に切り替え
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
    //問題が終わって,「知ってる」リストに全て含まれていない場合
    if (quizIndex == arguments.item.quizList.length - 1 &&
        state.knowRememberQuestions.length != arguments.item.quizList.length) {
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
        isWeak: quiz[state.quizIndex].isWeak,
        isJudge: false,
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
    if (knowRememberQuestions
        .contains(arguments.item.quizList[state.quizIndex])) {
    }
    //、知らないリストに含まれている場合
    else if (unKnowRememberQuestions
        .contains(arguments.item.quizList[state.quizIndex])) {
      knowRememberQuestions.add(arguments.item.quizList[state.quizIndex]);
      unKnowRememberQuestions.remove(arguments.item.quizList[state.quizIndex]);
    }
    //それ以外
    else {
      knowRememberQuestions.add(arguments.item.quizList[state.quizIndex]);
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
        .contains(arguments.item.quizList[state.quizIndex])) {
    }
    //知ってるリストに含まれている場合
    else if (knowRememberQuestions
        .contains(arguments.item.quizList[state.quizIndex])) {
      knowRememberQuestions.remove(arguments.item.quizList[state.quizIndex]);
      unKnowRememberQuestions.add(arguments.item.quizList[state.quizIndex]);
    }
    //それ以外
    else {
      unKnowRememberQuestions.add(arguments.item.quizList[state.quizIndex]);
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }

  ///知っている問題のチェックボックス切り替え
  void switchKnowCheckBox(int index) {
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
    state = state.copyWith(knowRememberQuestions: quizList);
  }
}
