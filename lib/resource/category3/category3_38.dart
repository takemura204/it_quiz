import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_38 {
  final quizItems = [];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 371 + 3000);
  });
}
