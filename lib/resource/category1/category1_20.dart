import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_20 {
  final quizItems = [
    QuizItem(
      question: '日本の産業標準を定める組織は何か？',
      ans: 'JIS',
      choices: ["JIS", "ISO", "IEEE", "W3C"],
      comment:
          "JIS（Japanese Industrial Standards）は、日本の産業標準を定める組織で、日本国内の製品やサービスの品質向上を目的としている。",
    ),
    QuizItem(
      question: '品質マネジメントシステムの要求事項を定めた国際標準は何か？',
      ans: 'ISO 9000',
      choices: ["ISO 9000", "ISO 14000", "ISO 26000", "ISO/IEC 27000"],
      comment:
          "ISO 9000シリーズは、組織が顧客満足を達成し、製品やサービスの品質を継続的に向上させるための品質マネジメントシステムの要求事項を定めた国際標準。",
    ),
    QuizItem(
      question: '環境マネジメントシステムの要求事項を定めた国際標準は何か？',
      ans: 'ISO 14000',
      choices: ["ISO 9000", "ISO 14000", "ISO 26000", "ISO/IEC 27000"],
      comment:
          "ISO 14000シリーズは、組織が環境パフォーマンスを管理し改善するための環境マネジメントシステムの要求事項を定めた国際標準。",
    ),
    QuizItem(
      question: '組織の社会的責任に関する指針を提供する国際標準は何か？',
      ans: 'ISO 26000',
      choices: ["ISO 9000", "ISO 14000", "ISO 26000", "ISO/IEC 27000"],
      comment: "ISO 26000は、組織が社会の持続可能な発展に貢献するために社会的責任を果たす方法に関する指針を提供する国際標準。",
    ),
    QuizItem(
      question: '情報セキュリティマネジメントシステム（ISMS）の要求事項を定めた国際標準は何か？',
      ans: 'ISO/IEC 27000',
      choices: ["ISO 9000", "ISO 14000", "ISO 26000", "ISO/IEC 27000"],
      comment:
          "ISO/IEC 27000シリーズは、組織が情報セキュリティリスクを適切に管理するための情報セキュリティマネジメントシステムの要求事項を定めた国際標準。",
    ),
    QuizItem(
      question: '組織のITガバナンスに関する指針を提供するJIS規格は何か？',
      ans: 'JIS Q 38500',
      choices: ["JIS Q 38500", "JIS X 8341", "JIS Z 8115", "JIS K 5600"],
      comment:
          "JIS Q 38500は、組織のIT資源の有効活用を支援し、経営戦略とIT戦略の整合性を高めるためのITガバナンスに関する指針を提供するJIS規格。",
    )
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 191);
  });
}
