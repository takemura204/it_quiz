import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:state_notifier/state_notifier.dart';

final quizItemControllerProvider =
    StateNotifierProvider<QuizItemController, QuizItemState>(
  (ref) => QuizItemController(ref: ref),
);

class QuizItemController extends StateNotifier<QuizItemState>
    with LocatorMixin {
  QuizItemController({required this.ref})
      : super(const QuizItemState(
          id: 1,
          group: "TeamA",
          title: "問題A-1",
          isCompleted: false,
          quizList: [],
        )) {
    initState();
  }

  final Ref ref;

  // @override
  // void initState() {
  //   super.initState();
  // }
}
