import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category2_4 {
  final quizItems = [
    QuizItem(
      word: 'ITサービスマネジメント',
      question: '情報技術サービスの提供と運用を効果的に管理し、顧客に価値を提供するための組織的なアプローチを何というか？',
      ans: 'ITサービスマネジメント',
      choices: ["ITサービスマネジメント", "ITガバナンス", "IT戦略計画", "IT運用管理"],
      comment: "ITサービスマネジメントは、ITサービスの提供と運用を効果的に管理し、顧客に価値を提供するための組織的なアプローチ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ITIL(アイティル)',
      question:
          'ITIL(Information Technology Infrastructure Library)を説明したものはどれか。',
      ans: 'ITサービスマネジメントのフレームワーク',
      choices: [
        "ITサービスマネジメントのフレームワーク",
        "ITに関する個人情報保護のフレームワーク",
        "ITに関する品質管理マネジメントのフレームワーク",
        "グリーンITのフレームワーク"
      ],
      comment:
          "ITIL(アイティル)は、ITサービスマネジメントのベストプラクティスを集めたフレームワークで、現在の最新バージョンである「2011 edition」では、5つの分野「サービスストラテジ」「サービスデザイン」「サービストランジション」「サービスオペレーション」「継続的サービス改善(CSI)」ごとに1冊ずつの書籍にまとめられている。",
      source: '平成29年春期 問35',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'SLA(Service Level Agreement)',
      question:
          'SLAには，サービス提供者とサービス利用者との間で合意されたサービス内容などの取決めを記載する。SLAを取り交わすことによって得られるサービス提供者とサービス利用者双方の利点として，適切なものはどれか。',
      ans: 'サービスの内容，提供範囲，要求水準に関する共通認識をもつことができる。',
      choices: [
        "サービスの実施内容に基づき請求料金の妥当性を証明することができる。",
        "サービスの内容，提供範囲，要求水準に関する共通認識をもつことができる。",
        "サービスの内容が不十分な場合に料金の見直しを要求することができる。",
        "サービスの内容に関する過剰な要求を受けることなく業務を遂行できる。"
      ],
      comment:
          "SLA(Service Level Agreement)は、通信サービス事業者などのサービス提供者と利用者の間で交わされる、サービスの品質保証に関する合意もしくは契約文書。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'SLM(Service Level Management)',
      question:
          'SLAの合意内容を達成するために，サービス状況のモニタリングやレビューなどを通じてサービスレベルの維持や向上を図る活動を何というか。',
      ans: 'SLM',
      choices: ["CSR", "ERP", "SLM", "SWOT"],
      comment:
          "SLM(Service Level Management)は、サービスレベル合意(SLA)に基づき、合意されたITサービスの提供を実現し、そのサービス品質の継続的な維持・改善を行うITサービスマネジメントの管理プロセス",
      source: '平成28年春期 問41',
      importance: QuizImportanceType.high,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category2Index + 401);
  });
}
