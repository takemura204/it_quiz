///クイズ形式のタイプ
enum QuizStyleType {
  study, //一問一答・四択
  weak, //苦手国府
  daily, //今日の一文
  random, //ランダム学習
}

///クイズ勉強のタイプ
enum StudyType {
  learn, //一問一答
  choice, //四択
}

///クイズの正誤
enum QuizStatusType {
  correct, //正解
  incorrect, //不正解
  learned, //学習済み
  unlearned, //未学習
}

extension QuizStatusTypeExtension on QuizStatusType {
  static QuizStatusType fromJson(String json) {
    switch (json) {
      case 'correct':
        return QuizStatusType.correct;
      case 'incorrect':
        return QuizStatusType.incorrect;
      case 'learned':
        return QuizStatusType.learned;
      case 'unlearned':
        return QuizStatusType.unlearned;
      default:
        throw StateError('Unknown QuizStatusType: $json');
    }
  }
}

///クイズの重要度
enum QuizImportanceType {
  high, // 非常に重要（星3）
  normal, // 重要（星2）
  low, // 普通重要（星1）
  none, // シラバス外（星0）
}

extension QuizImportanceTypeExtension on QuizImportanceType {
  static QuizImportanceType fromJson(String json) {
    switch (json) {
      case 'high':
        return QuizImportanceType.high;
      case 'normal':
        return QuizImportanceType.normal;
      case 'low':
        return QuizImportanceType.low;
      case 'none':
        return QuizImportanceType.none;
      default:
        throw StateError('Unknown QuizStatusType: $json');
    }
  }
}

///選択した期間
enum PeriodType {
  weekly, //周
  monthly, //月
}

///学習状況のタイプ
enum ChartType {
  quizCount, //問題数
  duration, //学習時間
}
