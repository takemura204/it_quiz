import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_remember/quiz_remember_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

final quizRememberScreenControllerProvider = StateNotifierProvider<
    QuizRememberScreenController, QuizRememberScreenState>(
  (ref) => QuizRememberScreenController(ref: ref),
);

class QuizRememberScreenController
    extends StateNotifier<QuizRememberScreenState> with LocatorMixin {
  QuizRememberScreenController({required this.ref})
      : super(const QuizRememberScreenState());

  final Ref ref;

  @override
  void dispose() {
    super.dispose();
  }

  ///確認ボタンを押した時
  void tapConfirmButton() {
    switchAnsView();
  }

  ///知ってるボタンを押した時
  void tapKnowButton() {
    switchAnsView();
    print("知っている");
  }

  ///知らないボタンを押した時
  void tapUnkowButton() {
    switchAnsView();
    print("知らない");
  }

  void switchAnsView() {
    state = state.copyWith(isAnsView: !state.isAnsView);
  }

  void changeNextQuiz() {}
}
