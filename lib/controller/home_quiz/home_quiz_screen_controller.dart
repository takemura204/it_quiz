import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import 'home_quiz_screen_state.dart';

final homeQuizScreenProvider =
    StateNotifierProvider<HomeQuizScreenController, HomeQuizScreenState>(
  (ref) => HomeQuizScreenController(ref: ref),
);

class HomeQuizScreenController extends StateNotifier<HomeQuizScreenState>
    with LocatorMixin {
  HomeQuizScreenController({required this.ref})
      : super(const HomeQuizScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  void initState() {
    super.initState();
    addCategory();
  }

  void addCategory() {
    final testGroup = [...state.testGroup];
    final categoryList = ref
        .read(quizModelProvider)
        .quizList
        .map((quizItem) => quizItem.category)
        .toSet()
        .toList();
    testGroup.addAll(categoryList);
    state = state.copyWith(testGroup: testGroup);
    print(testGroup);
  }

  ///TestQuiz開始
  void tapStartTestQuizButton() {
    final testGroup = state.testGroup;
    final selectedTestLength = state.selectedTestLength;
    ref.read(quizModelProvider.notifier).setQuizType(QuizType.test);
    ref
        .read(quizModelProvider.notifier)
        .createTestQuiz(testGroup, selectedTestLength);
  }

  ///問題範囲指定
  void selectGroup(String group) {
    final testGroup = [...state.testGroup];
    if (testGroup.contains(group)) {
      state = state.copyWith(testGroup: testGroup..remove(group));
    } else {
      state = state.copyWith(testGroup: testGroup..add(group));
    }
  }

  ///問題数指定
  void selectTestLength(int length) {
    state = state.copyWith(selectedTestLength: length);
  }
}
