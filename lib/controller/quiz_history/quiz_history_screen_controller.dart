import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_history/quiz_history_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';

final quizHistoryScreenProvider =
    StateNotifierProvider<QuizHistoryScreenController, QuizHistoryScreenState>(
  (ref) => QuizHistoryScreenController(ref: ref),
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

    final targetQuizItem = quizItemList[quizItemIndex];
    quizItemList[quizItemIndex] =
        targetQuizItem.copyWith(isWeak: !targetQuizItem.isWeak);

    final updatedQuiz = quizList[index].copyWith(quizItemList: quizItemList);
    quizList[index] = updatedQuiz;

    state = state.copyWith(quizList: quizList);
    ref.read(quizModelProvider.notifier).updateHistoryQuiz(updatedQuiz);
  }
}
