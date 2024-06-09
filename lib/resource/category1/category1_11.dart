import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///ビジネス戦略と目標・評価
List<QuizItem> get category1_11 {
  final quizItems = [
    QuizItem(
      word: 'バランススコアカード(BSC)',
      question: 'BSC(Balanced Scorecard)の説明として適切なものはどれか。',
      ans: '電子商取引のうち企業と消費者で行う取引',
      choices: [
        "一定の時点における資金調達と資金運用の状態を表示する会計報告書",
        "最低の総コストで必要な機能を確実に達成するための分析手法",
        "財務，顧客，業務プロセス，学習と成長という視点から行う企業業績の評価手法",
        "電子商取引のうち企業と消費者で行う取引"
      ],
      comment:
          "バランススコアカード(BSC)は、企業のビジョンと戦略を実現するために、「財務」「顧客」「業務プロセス」「学習と成長」という4つの視点から業績を評価・分析するためのフレームワーク。",
      source: '平成27年春期 問18',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'CSF',
      question: '経営戦略の目標や目的を達成する上で，重要な要因を表すものはどれか。',
      ans: 'CSF',
      choices: ["CSF", "ERP", "MRP", "SCM"],
      comment:
          "CSF(Critical Success Factor)は、重要成功要因とも呼ばれ、経営戦略やITガバナンスなどを計画的に実施する際、その目標・目的を達成する上で決定的な影響を与える要因のこと。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'KGI',
      question: '組織が最終的に達成すべき成果を何というか？',
      ans: 'KGI',
      choices: ["CSF", "KPI", "KGI", "バランススコアカード"],
      comment: "KGI（Key Goal Indicator）は、組織が設定した戦略や目標を達成するための最終的な成果指標のこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'KPI',
      question: 'KPIの説明として，適切なものはどれか。',
      ans: '企業目標の達成に向けて行われる活動の実行状況を計るために設定する重要な指標',
      choices: [
        "企業目標の達成に向けて行われる活動の実行状況を計るために設定する重要な指標",
        "経営計画で設定した目標を達成するための最も重要な要因",
        "経営計画や業務改革が目標に沿って遂行され，想定した成果を挙げていることを確認する行為",
        "商品やサービスの価値を機能とコストの関係で分析し，価値を向上させる手法"
      ],
      source: '平成27年春期 問5',
      comment:
          "KPI（Key Performance Indicator）は、企業目標やビジネス戦略の実現に向けて行われるビジネスプロセスについて、その実施状況をモニタリングするために設定する指標のことで、目標達成の進捗を測定するために用いられる。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'バリューエンジニアリング(VE)',
      question: 'バリューエンジニアリングにおいて，価値を定義する二つの要素はどれか。',
      ans: 'バリューエンジニアリング',
      choices: ["粗利と売上原価", "機能とコスト", "計画と実績", "固定費と変動費"],
      comment:
          "バリューエンジニアリング(VE)とは、製品やサービスの「価値」を、それが果たすべき「機能」とそのためにかける「コスト」との関係で把握し、システム化された手順によって「価値」の向上をはかる手法。",
      importance: QuizImportanceType.high,
    )
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1101);
  });
}
