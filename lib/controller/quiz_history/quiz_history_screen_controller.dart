import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_history/quiz_history_screen_state.dart';
import 'package:kentei_quiz/model/quiz_item/quiz_item.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz_model.dart';

final quizHistoryScreenProvider =
    StateNotifierProvider<QuizHistoryScreenController, QuizHistoryScreenState>(
  (ref) => QuizHistoryScreenController(ref: ref),
);

class QuizHistoryScreenController extends StateNotifier<QuizHistoryScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  QuizHistoryScreenController({required this.ref}) : super(const QuizHistoryScreenState()) {
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
    scrollController.dispose();
    super.dispose();
  }

  void loadQuizList() {
    final quizList = [...state.quizList];
    final historyQuizList = ref.read(quizModelProvider).historyQuizList;
    quizList.addAll(historyQuizList);
    quizList.sort((a, b) => b.timeStamp!.compareTo(a.timeStamp!));
    state = state.copyWith(quizList: quizList);
  }

  void tapSavedBox(int index, int quizItemIndex) {
    final quizList = [...state.quizList];
    final quizItemList = quizList[index].quizItemList;
    print({
      quizItemList.first.word,
      quizItemList.first.isSaved,
    });
    quizItemList[quizItemIndex] = QuizItem(
      quizId: quizItemList[quizItemIndex].quizId,
      word: quizItemList[quizItemIndex].word,
      question: quizItemList[quizItemIndex].question,
      ans: quizItemList[quizItemIndex].ans,
      comment: quizItemList[quizItemIndex].comment,
      isWeak: quizItemList[quizItemIndex].isWeak,
      status: quizItemList[quizItemIndex].status,
      isSaved: !quizItemList[quizItemIndex].isSaved,
      choices: quizItemList[quizItemIndex].choices,
      lapIndex: quizItemList[quizItemIndex].lapIndex,
      isPremium: quizItemList[quizItemIndex].isPremium,
      source: quizItemList[quizItemIndex].source,
      importance: quizItemList[quizItemIndex].importance,
    );
    final updateQuiz = quizList[index].copyWith(quizItemList: quizItemList);

    ref.read(quizModelProvider.notifier).updateQuiz(updateQuiz);
    ref.read(quizModelProvider.notifier).createHistoryQuiz(updateQuiz);
  }
}
