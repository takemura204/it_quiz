import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_remember/quiz_remember_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../screen/screen_argument.dart';

final quizRememberScreenControllerProvider = StateNotifierProvider<
    QuizRememberScreenController, QuizRememberScreenState>(
  (ref) => QuizRememberScreenController(ref: ref),
);

class QuizRememberScreenController
    extends StateNotifier<QuizRememberScreenState> with LocatorMixin {
  QuizRememberScreenController({required this.ref})
      : super(const QuizRememberScreenState());

  final Ref ref;

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    // db.collection(collectionPath)
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///確認ボタンを押した時
  void tapConfirmButton() {
    switchAnsView();
  }

  ///知ってるボタンを押したとき
  void tapKnownButton(QuizRememberScreenArguments arguments) {
    addKnownQuestion(arguments);
    nextQuiz(arguments);
    switchAnsView();
  }

  ///知らないボタンを押した時
  void tapUnKnownButton(QuizRememberScreenArguments arguments) {
    addUnKnownQuestion(arguments);
    nextQuiz(arguments);
    switchAnsView();
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
  void nextQuiz(QuizRememberScreenArguments arguments) {
    final quizIndex = state.quizIndex;
    final lapIndex = state.lapIndex;
    if (quizIndex == arguments.item.rememberQuestions.length - 1) {
      state = state.copyWith(quizIndex: 0, lapIndex: lapIndex + 1);
    } else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
  }

  ///知っているか、知ってないか分類
  void classifyQuiz(QuizRememberScreenArguments arguments) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];
    //すでに含まれている場合
    if (knowRememberQuestions
            .contains(arguments.item.rememberQuestions[state.quizIndex]) ||
        unKnowRememberQuestions
            .contains(arguments.item.rememberQuestions[state.quizIndex])) {
    } else if (state.knowRememberQuestions
        .contains(arguments.item.rememberQuestions[state.quizIndex])) {
    } else {
      unKnowRememberQuestions
          .add(arguments.item.rememberQuestions[state.quizIndex]);
    }
    state = state.copyWith(
        knowRememberQuestions: knowRememberQuestions,
        unKnowRememberQuestions: unKnowRememberQuestions);
  }

  void addKnownQuestion(QuizRememberScreenArguments arguments) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];

    //すでに知ってるリストに含まれているとき
    if (knowRememberQuestions
        .contains(arguments.item.rememberQuestions[state.quizIndex])) {
      print("すでに入っているよ");
    }
    //、知らないリストに含まれている場合
    else if (unKnowRememberQuestions
        .contains(arguments.item.rememberQuestions[state.quizIndex])) {
      knowRememberQuestions
          .add(arguments.item.rememberQuestions[state.quizIndex]);
      unKnowRememberQuestions
          .remove(arguments.item.rememberQuestions[state.quizIndex]);
      print("変更したよ");
    }
    //それ以外
    else {
      knowRememberQuestions
          .add(arguments.item.rememberQuestions[state.quizIndex]);
      print("新しく入れたよ！");
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }

  //知らないリストに追加
  void addUnKnownQuestion(QuizRememberScreenArguments arguments) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    final unKnowRememberQuestions = [...state.unKnowRememberQuestions];

    //すでに含まれている場合
    if (unKnowRememberQuestions
        .contains(arguments.item.rememberQuestions[state.quizIndex])) {
      print("すでに入っているよ");
    }
    //知ってるリストに含まれている場合
    else if (knowRememberQuestions
        .contains(arguments.item.rememberQuestions[state.quizIndex])) {
      knowRememberQuestions
          .remove(arguments.item.rememberQuestions[state.quizIndex]);
      unKnowRememberQuestions
          .add(arguments.item.rememberQuestions[state.quizIndex]);
      print("変更したよ！");
    }
    //それ以外
    else {
      unKnowRememberQuestions
          .add(arguments.item.rememberQuestions[state.quizIndex]);
      print("新しく入れたよ！");
    }
    state = state.copyWith(
      knowRememberQuestions: knowRememberQuestions,
      unKnowRememberQuestions: unKnowRememberQuestions,
    );
  }
}
