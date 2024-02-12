import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_3 {
  final quizItems = [
    QuizItem(
      question: '株式会社において株主が集まる最高意思決定機関を何というか？',
      ans: '株主総会',
      choices: ["取締役会", "株主総会", "社員会議", "経営会議"],
      comment: "株主総会は、株式会社において株主が集まり、重要な経営判断を行う場。",
    ),
    QuizItem(
      question: '企業が関係者に対して情報を公開することを何というか？',
      ans: 'ディスクロージャー',
      choices: ["コミュニケーション", "ディスクロージャー", "トランスパレンシー", "レポーティング"],
      comment: "ディスクロージャーは、企業が自らの財務状況や経営戦略など重要な情報を公開すること。",
    ),
    QuizItem(
      question: '災害や事故が発生した際に事業を継続するための計画を何というか？',
      ans: 'BCP',
      choices: ["BCP", "BCM", "DRP", "ERP"],
      comment: "BCPは、災害や事故が発生しても事業活動を継続し、復旧するための予防策や手順を定めた計画。",
    ),
    QuizItem(
      question: '事業継続性を管理・維持するプロセスを何というか？',
      ans: 'BCM',
      choices: ["BCM", "BPM", "BCP", "BPR"],
      comment: "BCMは、災害や緊急事態に備えて、事業の継続性を確保するための組織的な取り組み。",
    ),
    QuizItem(
      question: '環境に配慮したITの利用を指す用語は何か？',
      ans: 'グリーンIT',
      choices: ["クラウドコンピューティング", "グリーンIT", "ビッグデータ", "IoT"],
      comment: "グリーンITは、エネルギー効率の良い技術やリサイクル可能な素材の利用など、環境負荷の低減を目指したITの活用を指す。",
    ),
    QuizItem(
      question: '国際社会が持続可能な発展を達成するための目標を何というか？',
      ans: 'SDGs',
      choices: ["CSR", "SDGs", "ESG", "ISO26000"],
      comment: "SDGsは、国連が定めた持続可能な開発のための国際的な目標で、貧困撲滅や環境保護など17の目標が含まれる。",
    ),
    QuizItem(
      question: '排出物や廃棄物をゼロにすることを目指す環境戦略を何というか？',
      ans: 'ゼロエミッション',
      choices: ["リサイクル", "カーボンニュートラル", "ゼロエミッション", "リデュース"],
      comment: "ゼロエミッションは、産業活動などによる排出物や廃棄物を最小限に抑え、可能な限りゼロにすることを目指す環境戦略。",
    ),
    QuizItem(
      question: '社会的責任を重視した投資を何というか？',
      ans: 'SRI',
      choices: ["ベンチャーキャピタル", "ヘッジファンド", "SRI", "プライベートエクイティ"],
      comment: "SRIは、投資対象となる企業の社会的責任や環境配慮などの要素を考慮に入れた投資活動。",
    ),
    QuizItem(
      question: '実際の業務を通じて行う教育訓練を何というか？',
      ans: 'OJT',
      choices: ["OJT", "Off-JT", "e-ラーニング", "アダプティブラーニング"],
      comment: "OJTは、実務の中で先輩や上司から直接指導を受けながら行う、実践的な教育訓練。",
    ),
    QuizItem(
      question: 'インターネットを利用した学習方法を何というか？',
      ans: 'e-ラーニング',
      choices: ["リモートラーニング", "e-ラーニング", "ブレンディッドラーニング", "フリップラーニング"],
      comment: "e-ラーニングは、インターネットやコンピュータを活用して、時間や場所に制約されずに学習できる方法。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 21 + 1000);
  });
}
