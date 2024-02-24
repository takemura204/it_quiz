import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category0_5 {
  final quizItems = [
    QuizItem(
      question: 'プロジェクトの全作業を階層的に分割し、表示するツールは何か？',
      ans: 'WBS',
      choices: ["WBS", "ガントチャート", "アローダイアグラム", "クリティカルパス分析"],
      comment:
          "WBS（Work Breakdown Structure）は、プロジェクトの作業を階層的に分割し、体系的に表示するためのツール。",
    ),
    QuizItem(
      question: '活動やイベントを矢印で表し、プロジェクトのスケジュールを示す図法は何か？',
      ans: 'アローダイアグラム',
      choices: ["アローダイアグラム", "ガントチャート", "WBS", "クリティカルパス分析"],
      comment: "アローダイアグラムは、プロジェクトの活動やイベントを矢印で表し、それらの順序関係を示すスケジュール図法。",
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
      question: 'ITサービス運用において、サービス障害や問題の報告と対応を行うプロセスは何か？',
      ans: 'インシデント管理',
      choices: ["インシデント管理", "問題管理", "変更管理", "リリース及び展開管理"],
      comment: "インシデント管理は、サービスの障害や問題が発生した際に、それを迅速に解決し、サービスの正常な運用を回復させるためのプロセス。",
    ),
    QuizItem(
      question: 'インシデントの根本原因を特定し、再発防止のための対策を講じるプロセスは何か？',
      ans: '問題管理',
      choices: ["問題管理", "インシデント管理", "変更管理", "構成管理"],
      comment: "問題管理は、インシデントの根本原因を特定し、再発防止のための対策を講じることで、サービスの品質を維持・向上させるプロセス。",
    ),
    QuizItem(
      question: 'ユーザーからの問い合わせやサポート要求に対応するための一元的な窓口は何か？',
      ans: 'サービスデスク',
      choices: ["サービスデスク", "コールセンター", "ヘルプデスク", "カスタマーサポート"],
      comment:
          "サービスデスクは、ユーザーからの問い合わせやサポート要求に対応するための一元的な窓口で、インシデント管理やリクエストフルフィルメントなどの機能を提供する。",
    ),
    QuizItem(
      question: 'オフィスや施設の物理的な環境や設備を管理することを何というか？',
      ans: 'ファシリティマネジメント',
      choices: ["ファシリティマネジメント", "資産管理", "ビルディングマネジメント", "環境マネジメント"],
      comment: "ファシリティマネジメントは、オフィスや施設の物理的な環境や設備を総合的に管理し、最適化する活動。",
    ),
    QuizItem(
      question: '組織内のリスクを管理し、業務プロセスを効果的かつ効率的に運用するための体系的な手法を何というか？',
      ans: '内部統制',
      choices: ["内部統制", "リスクマネジメント", "コンプライアンス", "品質保証"],
      comment: "内部統制は、組織の目標達成を支援し、不正や誤りを防ぎ、業務の効率性や有効性を高めるために設計された体系的な手法。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 41);
  });
}
