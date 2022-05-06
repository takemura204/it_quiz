import 'package:kentei_quiz/entity/quiz/quiz_one_question.dart';

class QuizItem {
  final int id; //問題ID
  final String group; //問題のジャンル別に分ける
  final String title; //問題タイトル

  final List<OneQuestions> oneQuestions;

  const QuizItem({
    required this.id,
    required this.group,
    required this.title,
    required this.oneQuestions,
  });
}
