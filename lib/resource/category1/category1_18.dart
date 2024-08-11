import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///情報システム戦略
List<QuizItem> get category1_18 {
  final quizItems = [
    QuizItem(
      word: 'エンタープライズサーチ',
      question: '企業内の様々な情報源から情報を検索し、アクセス可能にするシステムを何というか？',
      ans: 'エンタープライズサーチ',
      choices: ["エンタープライズサーチ", "グループウェア", "RPA", "SNS"],
      comment: "エンタープライズサーチは、企業内の文書やデータベースなど、様々な情報源から必要な情報を迅速に検索し、アクセス可能にするシステム。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'EA（Enterprise Architecture）',
      question: 'エンタープライズアーキテクチャ(EA)の説明として，最も適切なものはどれか。',
      ans: '現状の業務と情報システムの全体像を可視化し，将来のあるべき姿を設定して，全体最適化を行うためのフレームワーク',
      choices: [
        "企業の情報システムにおいて，起こり得るトラブルを想定して，その社会的影響などを最小限に食い止めるための対策",
        "現状の業務と情報システムの全体像を可視化し，将来のあるべき姿を設定して，全体最適化を行うためのフレームワーク",
        "コスト，品質，サービス，スピードを革新的に改善するために，ビジネス・プロセスを考え直し，抜本的にデザインし直す取組み",
        "ソフトウェアをサービスと呼ばれる業務機能上の単位で部品化し，それらを組み合わせてシステムを柔軟に構築する仕組み"
      ],
      comment:
          "EA（Enterprise Architecture）は、社会環境や情報技術の変化に素早く対応できるよう「全体最適」の観点から業務やシステムを改善するフレームワーク。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'SoR',
      question: '主に安定した運用が求められる既存の業務システムを指す言葉は何か？',
      ans: 'SoR',
      choices: ["SoR", "SoE", "RPA", "BPM"],
      comment: "SoR（System of Records）は、会計や人事管理など、安定した運用が求められ、企業の基幹業務を支える既存の業務システムを指す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'SoE',
      question: '革新的なビジネスモデルや顧客体験を提供するための新しいITシステムを指す言葉は何か？',
      ans: 'SoE',
      choices: ["SoR", "SoE", "RPA", "エンタープライズサーチ"],
      comment:
          "SoE（System of Engagement）は、顧客との関わりを深めたり、革新的なビジネスモデルを支えたりするために開発される、ユーザー中心の新しいITシステムを指す。",
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category1Index + 1801);
  });
}
