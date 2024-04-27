import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category2_4 {
  final quizItems = [
    QuizItem(
      question: '情報技術サービスの提供と運用を効果的に管理し、顧客に価値を提供するための組織的なアプローチを何というか？',
      ans: 'ITサービスマネジメント',
      choices: ["ITサービスマネジメント", "ITガバナンス", "IT戦略計画", "IT運用管理"],
      comment: "ITサービスマネジメントは、ITサービスの提供と運用を効果的に管理し、顧客に価値を提供するための組織的なアプローチ。",
    ),
    QuizItem(
      question: 'ITサービスマネジメントのベストプラクティスを体系化したフレームワークは何か？',
      ans: 'ITIL',
      choices: ["ITIL", "PMBOK", "ISO/IEC 20000", "COBIT"],
      comment:
          "ITIL（Information Technology Infrastructure Library）は、ITサービスマネジメントのベストプラクティスを体系化したフレームワーク。",
    ),
    QuizItem(
      question: 'サービス提供者と顧客の間で合意されたサービスレベルの品質を定義する文書は何か？',
      ans: 'SLA',
      choices: ["SLA", "SLO", "OLA", "SLM"],
      comment:
          "SLA（Service Level Agreement）は、サービス提供者と顧客間で合意されたサービスレベルの品質、範囲、責任などを定義する文書。",
    ),
    QuizItem(
      question: '合意されたサービスレベルを維持し、継続的に改善するプロセスを何というか？',
      ans: 'SLM',
      choices: ["SLM", "SLA", "ITIL", "QoS"],
      comment:
          "SLM（Service Level Management）は、合意されたサービスレベルを維持し、サービス品質を継続的に改善するためのプロセス。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category2Index + 401);
  });
}
