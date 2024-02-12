import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_23 {
  final quizItems = [
    QuizItem(
      question: '物流、すなわち商品やサービスの供給プロセスの最適化を図るための活動を何というか？',
      ans: 'ロジスティクス',
      choices: ["ベンチマーキング", "ロジスティクス", "カニバリゼーション", "ESG投資"],
      comment:
          "ロジスティクスは、生産地点から消費地点までの商品の流れ、すなわち供給プロセスを効率化し、コスト削減や顧客満足度の向上を図る活動。",
    ),
    QuizItem(
      question: '新製品が自社の既存製品の売上を奪う現象を何というか？',
      ans: 'カニバリゼーション',
      choices: ["ロジスティクス", "ベンチマーキング", "カニバリゼーション", "ESG投資"],
      comment: "カニバリゼーションは、新製品の導入によって、その新製品が自社の既存製品と競合し、既存製品の売上を奪う現象。",
    ),
    QuizItem(
      question: '環境、社会、企業統治の観点から投資対象を選定する投資戦略を何というか？',
      ans: 'ESG投資',
      choices: ["カニバリゼーション", "ロジスティクス", "ベンチマーキング", "ESG投資"],
      comment:
          "ESG投資は、環境（Environment）、社会（Social）、企業統治（Governance）の3つの観点から、持続可能で社会的に責任ある投資を行う戦略。",
    ),
    QuizItem(
      question: '業界内の競争の激しさを分析するためのフレームワークは何か？',
      ans: 'ファイブフォース分析',
      choices: ["ファイブフォース分析", "SWOT分析", "3C分析", "VRIO分析"],
      comment:
          "ファイブフォース分析は、マイケル・ポーターによって提唱されたモデルで、業界内の競争の激しさを分析するために、5つの力（新規参入の脅威、代替品の脅威、買い手の交渉力、売り手の交渉力、既存企業間の競争）を考慮するフレームワーク。",
    ),
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 221 + 1000);
  });
}
