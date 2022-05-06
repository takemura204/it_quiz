class OneQuestion {
  final int questionNumber; //問題番号
  final String question; //問題文
  final String ans; //答え
  final bool isKnow; //問題を知っているか？

  const OneQuestion({
    required this.question,
    required this.ans,
    required this.questionNumber,
    required this.isKnow,
  });
}

class OneQuestions {
  final List<OneQuestion> questions; //問題一覧
  final List<OneQuestion> unKnowQuestions; //知らない問題一覧
  final int correctScore;

  const OneQuestions({
    required this.questions,
    required this.unKnowQuestions,
    required this.correctScore,
  });
}
