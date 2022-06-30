import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_remember/quiz_remember_screen_controller.dart';
import 'package:kentei_quiz/controller/quiz_result/quiz_result_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../entity/quiz_item/quiz_item.dart';
import '../../screen/screen_argument.dart';
import '../home_review/home_review_screen_controller.dart';

final quizResultScreenControllerProvider =
    StateNotifierProvider<QuizResultScreenController, QuizResultScreenState>(
  (ref) => QuizResultScreenController(ref: ref),
);

class QuizResultScreenController extends StateNotifier<QuizResultScreenState>
    with LocatorMixin {
  QuizResultScreenController({required this.ref})
      : super(const QuizResultScreenState()) {
    initState();
  }

  final Ref ref;

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    addQuestions();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addQuestions() {
    final knowRememberQuestions = [
      ...ref.watch(quizRememberScreenControllerProvider).knowRememberQuestions
    ];
    final unKnowRememberQuestions = [
      ...ref.watch(quizRememberScreenControllerProvider).unKnowRememberQuestions
    ];
    state = state.copyWith(
        knowRememberQuestions: knowRememberQuestions,
        unKnowRememberQuestions: unKnowRememberQuestions);
  }

  ///知っている問題のチェックボックス切り替え
  void switchKnowCheckBox(int index) {
    final knowRememberQuestions = [...state.knowRememberQuestions];
    if (!knowRememberQuestions[index].isWeak) {
      knowRememberQuestions[index] = RememberQuiz(
        questionId: knowRememberQuestions[index].questionId,
        question: knowRememberQuestions[index].question,
        ans: knowRememberQuestions[index].ans,
        isWeak: true,
      );
      ref
          .read(homeReviewScreenControllerProvider.notifier)
          .addRememberQuestions(knowRememberQuestions[index]);
    } else if (knowRememberQuestions[index].isWeak) {
      knowRememberQuestions[index] = RememberQuiz(
        questionId: knowRememberQuestions[index].questionId,
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
  void switchUnKnowCheckBox(QuizResultScreenArguments arguments, int index) {
    final unknowRememberQuestions = [...state.unKnowRememberQuestions];
    if (!unknowRememberQuestions[index].isWeak) {
      unknowRememberQuestions[index] = RememberQuiz(
        questionId: unknowRememberQuestions[index].questionId,
        question: unknowRememberQuestions[index].question,
        ans: unknowRememberQuestions[index].ans,
        isWeak: true,
      );
    } else if (unknowRememberQuestions[index].isWeak) {
      unknowRememberQuestions[index] = RememberQuiz(
        questionId: unknowRememberQuestions[index].questionId,
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
