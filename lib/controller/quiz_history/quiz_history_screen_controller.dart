import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_history/quiz_history_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';

final quizHistoryScreenProvider =
    StateNotifierProvider<QuizHistoryScreenController, QuizHistoryScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizHistoryScreenController extends StateNotifier<QuizHistoryScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  QuizHistoryScreenController({required this.ref})
      : super(const QuizHistoryScreenState()) {
    initState();
  }

  final Ref ref;
  final scrollController = ScrollController();

  @override
  void initState() {
    loadQuizList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadQuizList() {
    final quizList = [...state.quizList];
    final historyQuizList = ref.read(quizModelProvider).historyQuizList;
    quizList.addAll(historyQuizList);
    quizList.sort((a, b) => b.timeStamp!.compareTo(a.timeStamp!));
    state = state.copyWith(quizList: quizList);
  }

  void tapCheckBox(int index, int quizItemIndex) {
    final quizList = [...state.quizList];
    final quizItemList = [...quizList[index].quizItemList];
    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      question: quizItemList[index].question,
      ans: quizItemList[index].ans,
      comment: quizItemList[index].comment,
      isWeak: !quizItemList[index].isWeak,
      isJudge: quizItemList[index].isJudge,
      isSaved: quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
    );
    final updateQuiz = quizList[index].copyWith(quizItemList: quizItemList);
    ref.read(quizModelProvider.notifier).updateQuiz(updateQuiz);
  }
}
