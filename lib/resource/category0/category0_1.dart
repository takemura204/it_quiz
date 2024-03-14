import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category0_1 {
  final quizItems = [
    QuizItem(
      question: '組織の基本的な価値観や理念を示すものは何か？',
      ans: '経営理念',
      choices: ["経営理念", "株主総会", "決算", "CSR"],
      comment: "経営理念は、組織の基本的な価値観や理念を示し、組織の目的や存在意義を明確にするもの。",
    ),
    QuizItem(
      question: '企業が社会的責任を果たすことを目的とした経営活動は何か？',
      ans: 'CSR',
      choices: ["CSR", "SRI", "ディスクロージャ", "決算"],
      comment:
          "CSR（Corporate Social Responsibility）は、企業が環境保護や社会貢献など、社会的責任を果たすことを目的とした経営活動。",
    ),
    QuizItem(
      question: '計画・実行・評価・改善のサイクルを回すことで、継続的な改善を目指す手法は何か？',
      ans: 'PDCA',
      choices: ["PDCA", "コーポレートブランド", "ステークホルダ", "OODAループ"],
      comment:
          "PDCAサイクルは、計画（Plan）、実行（Do）、評価（Check）、改善（Act）のプロセスを繰り返すことで、業務やプロジェクトの継続的な改善を目指す手法。",
    ),
    QuizItem(
      question: '職場で実際の業務を通じて行われる教育訓練は何か？',
      ans: 'OJT',
      choices: ["OJT", "Off-JT", "e-ラーニング", "アダプティブラーニング"],
      comment: "OJT（On-the-Job Training）は、職場での実務を通じて、実際の業務環境の中で行われる教育訓練。",
    ),
    QuizItem(
      question: '企業の情報技術戦略を統括する最高情報責任者は何か？',
      ans: 'CIO',
      choices: ["CIO", "CEO", "持株会社", "ネットワーク組織"],
      comment:
          "CIO（Chief Information Officer）は、企業の情報技術（IT）戦略やシステムの統括を行う最高情報責任者。",
    ),
    QuizItem(
      question: '重要な少数と不重要な多数を区別して表示するグラフを何というか？',
      ans: 'パレート図',
      choices: ["ヒストグラム", "パレート図", "レーダチャート", "散布図"],
      comment: "パレート図は、問題の原因を重要度順に並べ、重要な少数（原因）が全体の大部分の結果を生んでいることを示すグラフ。",
    ),
    QuizItem(
      question: '大量のデータからパターンや関連性を発見するための分析プロセスを何というか？',
      ans: 'データマイニング',
      choices: ["データマイニング", "データスクレイピング", "データクレンジング", "データアーキテクチャ"],
      comment: "データマイニングは、大量のデータセットを分析し、統計的手法や機械学習などを用いて未知のパターンや関連性を発見するプロセス。",
    ),
    QuizItem(
      question: '多くの人が自由にアイデアを出し合うことで、新しいアイデアや解決策を生み出す集団的な創造活動を何というか？',
      ans: 'ブレーンストーミング',
      choices: ["ブレーンストーミング", "マインドマッピング", "アイデアソン", "シンクタンク"],
      comment:
          "ブレーンストーミングは、参加者が自由にアイデアを出し合い、批判や評価を避けながら、新しいアイデアや創造的な解決策を引き出すためのグループ活動。",
    ),
    QuizItem(
      question: '売上が変動費と固定費の合計に等しくなる売上高を何というか？',
      ans: '損益分岐点',
      choices: ["損益分岐点", "目標利益点", "変動費率", "固定費率"],
      comment: "損益分岐点は、企業の利益がゼロになる売上高の点で、この点を超えると利益が発生し、下回ると損失が発生する。",
    ),
    QuizItem(
      question: '企業の総資産に対する純利益の割合を示す指標を何というか？',
      ans: 'ROE',
      choices: ["ROE", "ROI", "ROA", "ROS"],
      comment: "ROEは、株主資本利益率とも呼ばれ、企業の自己資本に対する純利益の割合を示す指標。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 1, isPremium: false);
  });
}
