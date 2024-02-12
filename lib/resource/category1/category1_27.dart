import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_27 {
  final quizItems = [
    QuizItem(
      question: 'オンライン上で広告を表示し、製品やサービスを宣伝することを何というか？',
      ans: 'インターネット広告',
      choices: ["Webマーケティング", "インターネット広告", "オプトインメール広告", "バナー広告"],
      comment: "インターネット広告は、ウェブサイトやSNSなどオンライン上に表示される広告で、製品やサービスの宣伝に利用される。",
    ),
    QuizItem(
      question: 'ユーザーの同意を得てメールマーケティングを行う際の同意方式を何というか？',
      ans: 'オプトインメール広告',
      choices: ["インターネット広告", "オプトインメール広告", "バナー広告", "リスティング広告"],
      comment:
          "オプトインメール広告は、ユーザーがメールマーケティングの受信にあらかじめ同意（オプトイン）した上で、メール広告を送付する手法。",
    ),
    QuizItem(
      question: 'ウェブサイト上の特定のスペースに表示される広告を何というか？',
      ans: 'バナー広告',
      choices: ["オプトインメール広告", "バナー広告", "リスティング広告", "SEO"],
      comment: "バナー広告は、ウェブサイトのヘッダーやサイドバーなど特定のスペースに表示される、画像やアニメーション形式の広告。",
    ),
    QuizItem(
      question: '検索エンジンの検索結果に合わせて表示される広告を何というか？',
      ans: 'リスティング広告',
      choices: ["バナー広告", "リスティング広告", "SEO", "アフィリエイト"],
      comment: "リスティング広告は、検索エンジンの検索結果ページに、キーワードに応じて表示されるテキスト広告のこと。",
    ),
    QuizItem(
      question: '組織の戦略を多次元的に評価し、管理するためのフレームワークを何というか？',
      ans: 'バランススコアカード',
      choices: ["バランススコアカード", "CSF", "KGI", "KPI"],
      comment:
          "バランススコアカードは、財務、顧客、内部ビジネスプロセス、学習と成長の4つの視点から組織の戦略を多次元的に評価し、管理するためのフレームワーク。",
    ),
    QuizItem(
      question: '組織の目標達成に不可欠な要因を何というか？',
      ans: 'CSF',
      choices: ["KPI", "KGI", "バリューエンジニアリング", "CSF"],
      comment:
          "CSF（Critical Success Factors）は、組織が目標を達成するために必ず達成すべき、重要な成功要因のこと。",
    ),
    QuizItem(
      question: '組織が最終的に達成すべき成果を何というか？',
      ans: 'KGI',
      choices: ["CSF", "KPI", "KGI", "バランススコアカード"],
      comment: "KGI（Key Goal Indicator）は、組織が設定した戦略や目標を達成するための最終的な成果指標のこと。",
    ),
    QuizItem(
      question: '組織の業績を測るために設定される具体的な指標を何というか？',
      ans: 'KPI',
      choices: ["KGI", "CSF", "バリューエンジニアリング", "KPI"],
      comment:
          "KPI（Key Performance Indicator）は、組織の業績や成果を測るために設定される具体的な指標のことで、目標達成の進捗を測定するために用いられる。",
    ),
    QuizItem(
      question: '製品やサービスの価値を最大化するために、コストと機能のバランスを見直す手法を何というか？',
      ans: 'バリューエンジニアリング',
      choices: ["KPI", "KGI", "バリューエンジニアリング", "バランススコアカード"],
      comment:
          "バリューエンジニアリングは、製品やサービスのコストを削減しつつ、顧客にとっての価値を最大化するために、コストと機能のバランスを見直す手法。",
    )
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 261 + 1000);
  });
}
