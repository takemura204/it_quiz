import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_true_false/quiz_true_false_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../screen/screen_argument.dart';

final quizTureFlaseScreenControllerProvider = StateNotifierProvider<
    QuizTrueFalseScreenController, QuizTrueFalseScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizTrueFalseScreenController
    extends StateNotifier<QuizTrueFalseScreenState> with LocatorMixin {
  QuizTrueFalseScreenController({required this.ref, required this.arguments})
      : super(const QuizTrueFalseScreenState()) {
    initState();
  }

  final Ref ref;
  QuizChoiceScreenArguments arguments;

  @override
  void initState() {
    //選択肢表示
    shuffleChoice();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///選択肢を混ぜる
  void shuffleChoice() {}
}
