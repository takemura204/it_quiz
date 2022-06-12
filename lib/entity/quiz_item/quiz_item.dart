///問題ジャンル
class QuizItem {
  final int id; //問題ID
  final String group; //問題のジャンル別に分ける
  final String title; //問題タイトル

  ///一問一答問題
  final List<RememberQuiz> rememberQuestions; //一問一答形式
  final List<RememberQuiz> knowRememberQuestions; //知っている問題
  final List<RememberQuiz> unKnowRememberQuestions; //知らない問題

  const QuizItem({
    required this.id,
    required this.group,
    required this.title,
    required this.rememberQuestions,
    required this.knowRememberQuestions,
    required this.unKnowRememberQuestions,
  });
}

///一問一答形式
class RememberQuiz {
  final int questionId; //問題番号
  final String question; //問題文
  final String ans; //答え
  final bool isWeak; //問題を知っているか？

  const RememberQuiz({
    required this.question,
    required this.ans,
    required this.questionId,
    required this.isWeak,
  });
}
