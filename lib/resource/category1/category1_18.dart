import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///情報システム戦略
List<QuizItem> get category1_18 {
  final quizItems = [
    QuizItem(
      question: '企業内の様々な情報源から情報を検索し、アクセス可能にするシステムを何というか？',
      ans: 'エンタープライズサーチ',
      choices: ["エンタープライズサーチ", "グループウェア", "RPA", "SNS"],
      comment:
          "エンタープライズサーチは、企業内の文書やデータベースなど、様々な情報源から必要な情報を迅速に検索し、アクセス可能にするシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '企業全体のITアーキテクチャを計画し、組織全体のビジネスとITの整合性を高める取り組みを何というか？',
      ans: 'EA',
      choices: ["EA", "DFD", "BPMN", "BPR"],
      comment:
          "EA（Enterprise Architecture）は、企業全体のITアーキテクチャを戦略的に計画し、組織全体でのビジネスとITの整合性を高め、効率化を図る取り組み。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '主に安定した運用が求められる既存の業務システムを指す言葉は何か？',
      ans: 'SoR',
      choices: ["SoR", "SoE", "RPA", "BPM"],
      comment:
          "SoR（System of Records）は、会計や人事管理など、安定した運用が求められ、企業の基幹業務を支える既存の業務システムを指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '革新的なビジネスモデルや顧客体験を提供するための新しいITシステムを指す言葉は何か？',
      ans: 'SoE',
      choices: ["SoR", "SoE", "RPA", "エンタープライズサーチ"],
      comment:
          "SoE（System of Engagement）は、顧客との関わりを深めたり、革新的なビジネスモデルを支えたりするために開発される、ユーザー中心の新しいITシステムを指す。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1801);
  });
}
