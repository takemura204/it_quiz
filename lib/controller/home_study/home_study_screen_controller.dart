import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_study_screen_state.dart';

final homeStudyScreenControllerProvider =
    StateNotifierProvider<HomeStudyScreenController, HomeStudyScreenState>(
  (ref) => throw UnimplementedError(),
);

class HomeStudyScreenController extends StateNotifier<HomeStudyScreenState>
    with LocatorMixin {
  HomeStudyScreenController({required this.ref, required this.item})
      : super(const HomeStudyScreenState()) {
    initState();
  }

  final Ref ref;

  late final QuizItem item;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    super.dispose();
  }

  ///クイズスコア反映
  void setQuizScore() {
    final score = item.quizList.where((x) => x.isJudge == true).toList().length;
    final quizCount = item.quizList.length;
    if (quizCount == score) {
      final quizItem = item.copyWith(isCompleted: true);
      state = state.copyWith(quizItem: quizItem);
      print("全問正解");
      print(state.quizItem?.isCompleted);
    } else {
      item.copyWith(isCompleted: false);
    }
    print(state.quizItem?.isCompleted);
  }
}
