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
enum StatusType {
  correct, //正解
  incorrect, //不正解
  learned, //学習済み
  unlearned, //未学習
}

extension StatusTypeExtension on StatusType {
  static StatusType fromJson(String json) {
    switch (json) {
      case 'correct':
        return StatusType.correct;
      case 'incorrect':
        return StatusType.incorrect;
      case 'learned':
        return StatusType.learned;
      case 'unlearned':
        return StatusType.unlearned;
      default:
        throw StateError('Unknown StatusType: $json');
    }
  }
}

///クイズの重要度
enum ImportanceType {
  high, // 非常に重要（星3）
  normal, // 重要（星2）
  low, // 普通重要（星1）
  none, // シラバス外（星0）
}

extension ImportanceTypeExtension on ImportanceType {
  static ImportanceType fromJson(String json) {
    switch (json) {
      case 'high':
        return ImportanceType.high;
      case 'normal':
        return ImportanceType.normal;
      case 'low':
        return ImportanceType.low;
      case 'none':
        return ImportanceType.none;
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
