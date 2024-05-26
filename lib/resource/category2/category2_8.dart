import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category2_8 {
  final quizItems = [
    QuizItem(
      question: '組織内のリスクを管理し、業務プロセスを効果的かつ効率的に運用するための体系的な手法を何というか？',
      ans: '内部統制',
      choices: ["内部統制", "リスクマネジメント", "コンプライアンス", "品質保証"],
      comment: "内部統制は、組織の目標達成を支援し、不正や誤りを防ぎ、業務の効率性や有効性を高めるために設計された体系的な手法。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '不正防止や効率的な業務遂行を目的として、業務の執行に関連する権限と責任を適切に分配することを何というか？',
      ans: '職務分掌',
      choices: ["職務分掌", "権限委譲", "チェックアンドバランス", "職務分離"],
      comment: "職務分掌は、業務の効率化と不正防止を目的として、権限と責任を個人や部門間で適切に分配すること。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '組織内のリスクとそれに対するコントロール活動を体系的に整理し、評価するために使用されるツールは何か？',
      ans: 'リスクコントロールマトリクス',
      choices: ["リスクコントロールマトリクス", "リスクアセスメント", "リスクマップ", "コントロールチャート"],
      comment:
          "リスクコントロールマトリクスは、組織が直面するリスクとそれに対する内部コントロール活動を体系的に整理・評価するために使用されるツール。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '組織の評判損失につながるリスクを指す用語は何か？',
      ans: 'レピュテーションリスク',
      choices: ["レピュテーションリスク", "オペレーショナルリスク", "クレジットリスク", "市場リスク"],
      comment: "レピュテーションリスクは、不適切な行動や業務の失敗などが原因で、組織の評判が損なわれ、経済的損失や信頼失墜につながるリスク。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '組織のIT資源がビジネス目標に沿って効果的かつ効率的に使用されるように管理・監督する枠組みを何というか？',
      ans: 'ITガバナンス',
      choices: ["ITガバナンス", "ITマネジメント", "ITコンプライアンス", "IT戦略"],
      comment: "ITガバナンスは、組織のIT資源がビジネス目標の達成を支援するように、その管理と監督を行うための枠組みやプロセス。",
      importance: QuizImportanceType.high,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category2Index + 801);
  });
}
