import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/quiz/quiz_item_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

final quizItemProvider =
    StateNotifierProvider<QuizList, List<QuizItemState>>((ref) {
  // ここにQuizItemStateのリストを作成。
  final quizList = [...quizItems];
  return QuizList()..state = quizList;
});

class QuizList extends StateNotifier<List<QuizItemState>> {
  QuizList() : super([]);

  Future<void> toggleCompletion(int index) async {
    final prefs = await SharedPreferences.getInstance();
    state = state.map((quizItem) {
      if (quizItem.id == index) {
        prefs.setBool('isCompleted_$index', !quizItem.isCompleted);
        return quizItem.copyWith(isCompleted: !quizItem.isCompleted);
      }
      return quizItem;
    }).toList();
  }
}
