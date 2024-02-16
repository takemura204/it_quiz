import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_39 {
  final quizItems = [];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 381 + 3000);
  });
}
