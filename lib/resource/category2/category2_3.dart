import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///プロジェクトマネジメント
List<QuizItem> get category2_3 {
  final quizItems = [
    QuizItem(
      question: 'プロジェクトに関わる利害関係者全般を指す用語は何か？',
      ans: 'ステークホルダ',
      choices: ["ステークホルダ", "プロジェクトマネージャ", "チームメンバー", "エンドユーザー"],
      comment: "ステークホルダは、プロジェクトの結果に影響を受ける、または影響を与える可能性がある個人や組織のことを指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '一時的な努力で独特の製品、サービス、または結果を生み出すための取り組みを何というか？',
      ans: 'プロジェクト',
      choices: ["プロジェクト", "オペレーション", "プロセス", "タスク"],
      comment: "プロジェクトは、特定の目的を達成するために一時的に行われる、独自の製品やサービス、結果を生み出す取り組み。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'プロジェクトの目的、範囲、参加者などを定義する文書を何というか？',
      ans: 'プロジェクト憲章',
      choices: ["プロジェクト憲章", "プロジェクト計画書", "プロジェクトマニュアル", "スコープステートメント"],
      comment: "プロジェクト憲章は、プロジェクトの目的、範囲、参加者、および期待される成果物などを定義する文書。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'プロジェクトの全作業を階層的に分割し、表示するツールは何か？',
      ans: 'WBS',
      choices: ["WBS", "ガントチャート", "アローダイアグラム", "クリティカルパス分析"],
      comment:
          "WBS（Work Breakdown Structure）は、プロジェクトの作業を階層的に分割し、体系的に表示するためのツール。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '活動やイベントを矢印で表し、プロジェクトのスケジュールを示す図法は何か？',
      ans: 'アローダイアグラム',
      choices: ["アローダイアグラム", "ガントチャート", "WBS", "クリティカルパス分析"],
      comment: "アローダイアグラムは、プロジェクトの活動やイベントを矢印で表し、それらの順序関係を示すスケジュール図法。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'プロジェクトのスケジュールを横棒で表し、作業の期間を視覚的に表示する図法は何か？',
      ans: 'ガントチャート',
      choices: ["ガントチャート", "アローダイアグラム", "WBS", "クリティカルパス分析"],
      comment: "ガントチャートは、プロジェクトの作業や活動を横棒で表し、スケジュール計画や進捗を視覚的に表示するツール。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'プロジェクト管理に関する知識体系を体系化し、ガイドラインとしてまとめたものは何か？',
      ans: 'PMBOK',
      choices: ["PMBOK", "ISO", "プロジェクト憲章", "WBS"],
      comment:
          "PMBOK（Project Management Body of Knowledge）は、プロジェクト管理に関する標準的なガイドラインで、知識体系を体系化したもの。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'プロジェクトのスケジュール内で、活動の開始や終了が他の活動に影響を与える最も重要な経路を分析する手法は何か？',
      ans: 'クリティカルパス分析',
      choices: ["クリティカルパス分析", "アローダイアグラム", "ガントチャート", "WBS"],
      comment:
          "クリティカルパス分析は、プロジェクトのスケジュール内で最も時間がかかる経路を特定し、プロジェクトの最短完了時間を決定する手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'プロジェクト管理において、成果物の完成を目標としてプロジェクトの進行を管理するアプローチは何か？',
      ans: 'マイルストーンプル型',
      choices: ["マイルストーンプル型", "プッシュ型", "アジャイル型", "ウォータフォール型"],
      comment:
          "マイルストーンプル型は、重要な成果物や区切り（マイルストーン）を定め、それを達成することを目標としてプロジェクトを進行させる管理アプローチ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'プロジェクトチームやステークホルダ間で情報を効果的に交換し、共有するための活動を何というか？',
      ans: 'コミュニケーション',
      choices: ["コミュニケーション", "情報共有", "ミーティング", "ドキュメンテーション"],
      comment: "コミュニケーションは、プロジェクトチームやステークホルダ間で情報を効果的に交換し、共有するための重要な活動。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category2Index + 301);
  });
}
