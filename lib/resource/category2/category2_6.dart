import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category2_6 {
  final quizItems = [
    QuizItem(
      question: '情報技術サービスの提供と運用を効果的に管理し、顧客に価値を提供するための組織的なアプローチを何というか？',
      ans: 'ITサービスマネジメント',
      choices: ["ITサービスマネジメント", "ITガバナンス", "IT戦略計画", "IT運用管理"],
      comment: "ITサービスマネジメントは、ITサービスの提供と運用を効果的に管理し、顧客に価値を提供するための組織的なアプローチ。",
    ),
    QuizItem(
      question: 'ITサービスマネジメントのベストプラクティスを体系化したフレームワークは何か？',
      ans: 'ITIL',
      choices: ["ITIL", "PMBOK", "ISO/IEC 20000", "COBIT"],
      comment:
          "ITIL（Information Technology Infrastructure Library）は、ITサービスマネジメントのベストプラクティスを体系化したフレームワーク。",
    ),
    QuizItem(
      question: 'サービス提供者と顧客の間で合意されたサービスレベルの品質を定義する文書は何か？',
      ans: 'SLA',
      choices: ["SLA", "SLO", "OLA", "SLM"],
      comment:
          "SLA（Service Level Agreement）は、サービス提供者と顧客間で合意されたサービスレベルの品質、範囲、責任などを定義する文書。",
    ),
    QuizItem(
      question: '合意されたサービスレベルを維持し、継続的に改善するプロセスを何というか？',
      ans: 'SLM',
      choices: ["SLM", "SLA", "ITIL", "QoS"],
      comment:
          "SLM（Service Level Management）は、合意されたサービスレベルを維持し、サービス品質を継続的に改善するためのプロセス。",
    ),
    QuizItem(
      question: 'オフィスや施設の物理的な環境や設備を管理することを何というか？',
      ans: 'ファシリティマネジメント',
      choices: ["ファシリティマネジメント", "資産管理", "ビルディングマネジメント", "環境マネジメント"],
      comment: "ファシリティマネジメントは、オフィスや施設の物理的な環境や設備を総合的に管理し、最適化する活動。",
    ),
    QuizItem(
      question: '電源の停止や不安定な電力供給からIT設備を保護する装置を何というか？',
      ans: 'UPS',
      choices: ["UPS", "サージプロテクター", "バックアップジェネレーター", "PDU"],
      comment:
          "UPS（Uninterruptible Power Supply）は、電源の停止や電力供給の不安定さからIT設備を保護するための装置。",
    ),
    QuizItem(
      question: '不正アクセスや物理的な侵入を防ぐために設置されるセキュリティ対策の一つは何か？',
      ans: 'セキュリティワイヤ',
      choices: ["セキュリティワイヤ", "バイオメトリクス", "カードキー", "監視カメラ"],
      comment:
          "セキュリティワイヤは、不正アクセスや物理的な侵入を防ぐために設置される、パソコンや機器を固定するためのセキュリティ対策の一つ。",
    ),
    QuizItem(
      question: '固定された個人のデスクがなく、働く場所をその日ごとに選べるオフィスのスタイルを何というか？',
      ans: 'フリーアドレス',
      choices: ["フリーアドレス", "オープンスペース", "ホットデスキング", "コワーキング"],
      comment: "フリーアドレスは、固定された個人のデスクがなく、その日の作業に応じて自由に働く場所を選べるオフィスのスタイル。",
    ),
    QuizItem(
      question: '電源からの突発的な電圧上昇（サージ）から機器を保護するための対策を何というか？',
      ans: 'サージ防護',
      choices: ["サージ防護", "過電流保護", "アース", "断熱"],
      comment: "サージ防護は、雷などによる電源からの突発的な電圧上昇（サージ）からコンピュータや電子機器を保護するための対策。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 51 + 2000);
  });
}
