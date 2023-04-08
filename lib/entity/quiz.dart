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
