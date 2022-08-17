import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_state.dart';
import 'package:state_notifier/state_notifier.dart';

final quizChoiceScreenControllerProvider =
    StateNotifierProvider<QuizChoiceScreenController, QuizChoiceScreenState>(
  (ref) => QuizChoiceScreenController(ref: ref),
);

class QuizChoiceScreenController extends StateNotifier<QuizChoiceScreenState>
    with LocatorMixin {
  QuizChoiceScreenController({required this.ref})
      : super(const QuizChoiceScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  void dispose() {
    super.dispose();
  }
}
