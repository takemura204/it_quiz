///問題ジャンル
class QuizItem {
  final int id; //問題ID
  final String group; //問題のジャンル別に分ける
  final String title; //問題タイトル
  final bool isCompleted; //全て問題を解いたか
  ///問題形式
  final List<Quiz> quizList; //学習形式

  const QuizItem({
    required this.id,
    required this.group,
    required this.title,
    required this.isCompleted,
    required this.quizList,
  });
}

class Quiz {
  final int quizId; //問題番号
  final String question; //問題文
  final String ans; //答え
  final bool isWeak; //苦手か？
  final bool isJudge; //正解したか?
  final List<String> choices; //選択肢

  const Quiz({
    required this.quizId,
    required this.question,
    required this.ans,
    required this.isWeak,
    required this.isJudge,
    required this.choices,
  });
}
