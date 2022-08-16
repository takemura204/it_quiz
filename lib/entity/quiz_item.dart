///問題ジャンル
class QuizItem {
  final int id; //問題ID
  final String group; //問題のジャンル別に分ける
  final String title; //問題タイトル
  ///問題形式
  final List<LearnQuiz> rememberQuiz; //学習形式
  final List<ChoiceQuiz> choiceQuiz; //学習形式

  const QuizItem({
    required this.id,
    required this.group,
    required this.title,
    required this.rememberQuiz,
    required this.choiceQuiz,
  });
}

///学習形式
class LearnQuiz {
  final int quizId; //問題番号
  final String question; //問題文
  final String ans; //答え
  final bool isWeak; //問題を知っているか？

  const LearnQuiz({
    required this.quizId,
    required this.question,
    required this.ans,
    required this.isWeak,
  });
}

class ChoiceQuiz {
  final int quizId; //問題番号
  final String question; //問題文
  final String ans; //答え
  final bool isWeak; //問題を知っているか？

  const ChoiceQuiz({
    required this.quizId,
    required this.question,
    required this.ans,
    required this.isWeak,
  });
}
