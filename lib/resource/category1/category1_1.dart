import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_1 {
  final quizItems = [
    QuizItem(
      question: '組織の基本的な価値観や理念を示すものは何か？',
      ans: '経営理念',
      choices: ["経営理念", "株主総会", "決算", "CSR"],
      comment: "経営理念は、組織の基本的な価値観や理念を示し、組織の目的や存在意義を明確にするもの。",
    ),
    QuizItem(
      question: '株式会社において、最高意思決定機関とされる会は何か？',
      ans: '株主総会',
      choices: ["株主総会", "監査役", "ディスクロージャ", "CSR"],
      comment: "株主総会は、株式会社において株主の意思決定を行う最高機関で、重要な経営判断がなされる場。",
    ),
    QuizItem(
      question: '企業が一定期間の経済活動の結果を財務的にまとめた報告は何か？',
      ans: '決算',
      choices: ["決算", "CSR", "SRI", "ディスクロージャ"],
      comment: "決算は、企業が一定期間の経済活動の結果を財務的にまとめ、収益や費用、利益などを報告すること。",
    ),
    QuizItem(
      question: '企業が社会的責任を果たすことを目的とした経営活動は何か？',
      ans: 'CSR',
      choices: ["CSR", "SRI", "ディスクロージャ", "決算"],
      comment:
          "CSR（Corporate Social Responsibility）は、企業が環境保護や社会貢献など、社会的責任を果たすことを目的とした経営活動。",
    ),
    QuizItem(
      question: '社会的に責任ある投資を意味する、投資の選択基準の一つは何か？',
      ans: 'SRI',
      choices: ["SRI", "CSR", "決算", "グリーンIT"],
      comment:
          "SRI（Socially Responsible Investment）は、環境保護や社会貢献などの社会的責任を考慮して投資を行うこと。",
    ),
    QuizItem(
      question: '企業が自らの経営状況や財務情報などを公開することを何というか？',
      ans: 'ディスクロージャ',
      choices: ["ディスクロージャ", "CSR", "SRI", "監査役"],
      comment: "ディスクロージャは、企業が株主や投資家などのステークホルダーに対して、経営状況や財務情報などを透明に公開すること。",
    ),
    QuizItem(
      question: '企業の監査を行い、経営の健全性を監視する役職は何か？',
      ans: '監査役',
      choices: ["監査役", "CSR", "ディスクロージャ", "SRI"],
      comment: "監査役は、企業の財務報告の正確性や経営の健全性を監視し、株主に報告する役職。",
    ),
    QuizItem(
      question: '企業活動において環境への影響を考慮し、持続可能な経営を目指す取り組みは何か？',
      ans: 'グリーンIT',
      choices: ["グリーンIT", "SDGs", "ゼロエミッション", "CSR"],
      comment: "グリーンITは、情報技術を活用して環境負荷を低減し、エネルギー効率の良い持続可能な経営を目指す取り組み。",
    ),
    QuizItem(
      question: '国際社会の持続可能な発展を目指し、国連が掲げる目標は何か？',
      ans: 'SDGs',
      choices: ["SDGs", "グリーンIT", "CSR", "ゼロエミッション"],
      comment:
          "SDGs（Sustainable Development Goals）は、国際社会の持続可能な発展を目指し、国連が掲げる17の目標。",
    ),
    QuizItem(
      question: '環境への負荷をゼロにすることを目指す環境保全の取り組みは何か？',
      ans: 'ゼロエミッション',
      choices: ["ゼロエミッション", "SDGs", "グリーンIT", "CSR"],
      comment: "ゼロエミッションは、産業活動などによる環境への負荷（CO2排出など）をゼロにすることを目指す環境保全の取り組み。",
    ),
  ];

  // quizId を自動的に割り当て
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 1 + 1000);
  });
}
