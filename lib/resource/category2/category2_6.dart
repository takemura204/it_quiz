import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category2_6 {
  final quizItems = [
    QuizItem(
      question: 'オフィスや施設の物理的な環境や設備を管理することを何というか？',
      ans: 'ファシリティマネジメント',
      choices: ["ファシリティマネジメント", "資産管理", "ビルディングマネジメント", "環境マネジメント"],
      comment: "ファシリティマネジメントは、オフィスや施設の物理的な環境や設備を総合的に管理し、最適化する活動。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '電源の停止や不安定な電力供給からIT設備を保護する装置を何というか？',
      ans: 'UPS',
      choices: ["UPS", "サージプロテクター", "バックアップジェネレーター", "PDU"],
      comment:
          "UPS（Uninterruptible Power Supply）は、電源の停止や電力供給の不安定さからIT設備を保護するための装置。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '不正アクセスや物理的な侵入を防ぐために設置されるセキュリティ対策の一つは何か？',
      ans: 'セキュリティワイヤ',
      choices: ["セキュリティワイヤ", "バイオメトリクス", "カードキー", "監視カメラ"],
      comment:
          "セキュリティワイヤは、不正アクセスや物理的な侵入を防ぐために設置される、パソコンや機器を固定するためのセキュリティ対策の一つ。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '固定された個人のデスクがなく、働く場所をその日ごとに選べるオフィスのスタイルを何というか？',
      ans: 'フリーアドレス',
      choices: ["フリーアドレス", "オープンスペース", "ホットデスキング", "コワーキング"],
      comment: "フリーアドレスは、固定された個人のデスクがなく、その日の作業に応じて自由に働く場所を選べるオフィスのスタイル。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '電源からの突発的な電圧上昇（サージ）から機器を保護するための対策を何というか？',
      ans: 'サージ防護',
      choices: ["サージ防護", "過電流保護", "アース", "断熱"],
      comment: "サージ防護は、雷などによる電源からの突発的な電圧上昇（サージ）からコンピュータや電子機器を保護するための対策。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category2Index + 601);
  });
}
