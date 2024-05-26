import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category2_7 {
  final quizItems = [
    QuizItem(
      question: '組織の情報システムの管理と運用が適切かどうかを評価するための独立した検証活動を何というか？',
      ans: 'システム監査',
      choices: ["システム監査", "リスクアセスメント", "コンプライアンスチェック", "セキュリティ評価"],
      comment:
          "システム監査は、組織の情報システムの管理と運用が企業の方針、目標、法令等に適切に準拠しているかを独立した立場から評価する活動。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '組織が情報資産を保護し、リスクを管理するために取り組むべき方針や手順、実践の総体を指す用語は何か？',
      ans: '情報セキュリティ',
      choices: ["情報セキュリティ", "データプライバシー", "ITガバナンス", "サイバーセキュリティ"],
      comment:
          "情報セキュリティは、組織の情報資産を不正アクセス、漏洩、改ざん、破壊等から保護し、リスクを管理するための方針や手順、実践の総体。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'システム監査を行う際に、監査対象が適切に管理・運用されているかを評価するための基準を何というか？',
      ans: '監査システム監査基準',
      choices: ["監査システム監査基準", "情報セキュリティ基準", "コンプライアンス基準", "品質管理基準"],
      comment: "監査システム監査基準は、システム監査を実施する際に、監査対象の管理と運用が適切であるかを評価するための基準やガイドライン。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'システム監査において、監査対象の管理・運用の状況を示すために収集される情報や資料を何というか？',
      ans: '監査証拠',
      choices: ["監査証拠", "監査報告", "リスク評価資料", "コンプライアンス記録"],
      comment: "監査証拠は、システム監査において監査対象の管理・運用の適切さを評価するために収集される情報や資料。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'システム監査の過程で、監査対象の現状や問題点などを記録した文書を何というか？',
      ans: '監査調書',
      choices: ["監査調書", "監査報告書", "チェックリスト", "監査記録"],
      comment: "監査調書は、システム監査の過程で確認された監査対象の現状や問題点、改善点などを記録した文書。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'システム監査を終了した後に、監査結果や推奨事項などをまとめて関係者に提供される文書を何というか？',
      ans: 'システム監査報告書',
      choices: ["システム監査報告書", "監査調書", "実施報告書", "評価結果報告書"],
      comment: "システム監査報告書は、システム監査の結果や推奨事項、改善策などをまとめて関係者に提供される文書。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '監査や評価の後、実施された改善措置が適切かどうかを確認するための活動を何というか？',
      ans: 'フォローアップ',
      choices: ["フォローアップ", "リスク再評価", "アフターアクションレビュー", "パフォーマンスモニタリング"],
      comment:
          "フォローアップは、監査や評価の結果に基づいて実施された改善措置が適切に行われているかを確認し、必要に応じて追加の改善を促す活動。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category2Index + 701);
  });
}
