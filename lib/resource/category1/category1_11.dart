import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///ビジネス戦略と目標・評価
List<QuizItem> get category1_11 {
  final quizItems = [
    QuizItem(
      question: '組織の戦略を多次元的に評価し、管理するためのフレームワークを何というか？',
      ans: 'バランススコアカード',
      choices: ["バランススコアカード", "CSF", "KGI", "KPI"],
      comment:
          "バランススコアカードは、財務、顧客、内部ビジネスプロセス、学習と成長の4つの視点から組織の戦略を多次元的に評価し、管理するためのフレームワーク。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '組織の目標達成に不可欠な要因を何というか？',
      ans: 'CSF',
      choices: ["KPI", "KGI", "バリューエンジニアリング", "CSF"],
      comment:
          "CSF（Critical Success Factors）は、組織が目標を達成するために必ず達成すべき、重要な成功要因のこと。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '組織が最終的に達成すべき成果を何というか？',
      ans: 'KGI',
      choices: ["CSF", "KPI", "KGI", "バランススコアカード"],
      comment: "KGI（Key Goal Indicator）は、組織が設定した戦略や目標を達成するための最終的な成果指標のこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '組織の業績を測るために設定される具体的な指標を何というか？',
      ans: 'KPI',
      choices: ["KGI", "CSF", "バリューエンジニアリング", "KPI"],
      comment:
          "KPI（Key Performance Indicator）は、組織の業績や成果を測るために設定される具体的な指標のことで、目標達成の進捗を測定するために用いられる。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '製品やサービスの価値を最大化するために、コストと機能のバランスを見直す手法を何というか？',
      ans: 'バリューエンジニアリング',
      choices: ["KPI", "KGI", "バリューエンジニアリング", "バランススコアカード"],
      comment:
          "バリューエンジニアリングは、製品やサービスのコストを削減しつつ、顧客にとっての価値を最大化するために、コストと機能のバランスを見直す手法。",
      importance: QuizImportanceType.high,
    )
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1101);
  });
}
