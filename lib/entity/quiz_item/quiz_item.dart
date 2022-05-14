///問題ジャンル
class QuizItem {
  final int id; //問題ID
  final String group; //問題のジャンル別に分ける
  final String title; //問題タイトル

  final List<RememberQuiz> oneQuestions; //一問一答形式

  const QuizItem({
    required this.id,
    required this.group,
    required this.title,
    required this.oneQuestions,
  });
}

///一問一答形式
class RememberQuiz {
  final int questionId; //問題番号
  final String question; //問題文
  final String ans; //答え
  final bool isKnow; //問題を知っているか？

  const RememberQuiz({
    required this.question,
    required this.ans,
    required this.questionId,
    required this.isKnow,
  });
}
