import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_learn_result/quiz_learn_result_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

final quizLearnResultScreenControllerProvider = StateNotifierProvider<
    QuizLearnResultScreenController, QuizLearnResultScreenState>(
  (ref) => QuizLearnResultScreenController(ref: ref),
);

class QuizLearnResultScreenController
    extends StateNotifier<QuizLearnResultScreenState> with LocatorMixin {
  QuizLearnResultScreenController({required this.ref})
      : super(const QuizLearnResultScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
