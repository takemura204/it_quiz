import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_28 {
  final quizItems = [
    QuizItem(
      question: '顧客との関係を管理し、顧客満足度の向上やロイヤリティの確保を目指す経営戦略を何というか？',
      ans: 'CRM',
      choices: ["CRM", "バリューチェーンマネジメント", "SCM", "TQC"],
      comment:
          "CRM（Customer Relationship Management）は、顧客情報の収集と分析を通じて顧客との関係を深め、顧客満足度の向上やロイヤリティの確保を目指す経営戦略。",
    ),
    QuizItem(
      question: '企業内の各活動を価値創造のプロセスとして捉え、それらを最適化することで競争優位を確立する経営戦略を何というか？',
      ans: 'バリューチェーンマネジメント',
      choices: ["CRM", "バリューチェーンマネジメント", "SCM", "TQC"],
      comment:
          "バリューチェーンマネジメントは、企業内の各活動（製品開発、生産、販売など）を価値創造の連鎖と捉え、それらを最適化することで企業の競争優位を確立する経営戦略。",
    ),
    QuizItem(
      question: '原材料の調達から製品の最終消費者への配送に至るまでの一連の流れを効率的に管理することを何というか？',
      ans: 'SCM',
      choices: ["バリューチェーンマネジメント", "SCM", "TQC", "TQM"],
      comment:
          "SCM（Supply Chain Management）は、供給連鎖（サプライチェーン）を通じた原材料の調達、製造、配送などの一連の流れを効率的に管理し、コスト削減や納期短縮を目指す経営戦略。",
    ),
    QuizItem(
      question: '組織全体で品質管理を行うことを目指した、日本で発展した品質管理の手法を何というか？',
      ans: 'TQC',
      choices: ["SCM", "TQC", "TQM", "ERP"],
      comment:
          "TQC（Total Quality Control）は、組織全体で品質管理を行い、製品やサービスの品質向上を図るための総合的な品質管理の手法。",
    ),
    QuizItem(
      question: '組織全体で品質の向上を図ることを目指し、継続的な改善活動を行う品質管理のアプローチを何というか？',
      ans: 'TQM',
      choices: ["TQC", "TQM", "ERP", "シックスシグマ"],
      comment:
          "TQM（Total Quality Management）は、組織全体で品質の向上を図り、顧客満足の最大化を目指す品質管理のアプローチで、継続的な改善活動が特徴。",
    ),
    QuizItem(
      question: '企業の資源を統合的に管理し、業務の効率化や経営の最適化を図るための統合情報システムを何というか？',
      ans: 'ERP',
      choices: ["TQM", "ERP", "シックスシグマ", "ナレッジマネジメント"],
      comment:
          "ERP（Enterprise Resource Planning）は、企業の財務、製造、販売、人事などの各業務システムを統合管理することで、業務の効率化や経営資源の最適化を図る統合情報システム。",
    ),
    QuizItem(
      question: '事業プロセスの改善を通じてエラーを極限まで減少させることを目指す品質管理の手法を何というか？',
      ans: 'シックスシグマ',
      choices: ["ERP", "シックスシグマ", "ナレッジマネジメント", "TOC"],
      comment:
          "シックスシグマは、統計的な手法を用いて事業プロセスを改善し、製品やサービスのバリエーションを極限まで減少させることを目指す品質管理の手法で、デフェクト（欠陥）を6シグマ（標準偏差）レベルまで低減させることを目標とする。",
    ),
    QuizItem(
      question: '組織内の知識を効果的に活用し、組織の競争力を高めるための管理手法を何というか？',
      ans: 'ナレッジマネジメント',
      choices: ["シックスシグマ", "ナレッジマネジメント", "TOC", "バリューチェーンマネジメント"],
      comment:
          "ナレッジマネジメントは、組織内の暗黙知や形式知などの知識を収集、共有、活用し、組織全体の知的資産を増やして組織の競争力を高めるための管理手法。",
    ),
    QuizItem(
      question: '制約条件の中で最も成果を出すために、その制約を特定し改善していく管理手法を何というか？',
      ans: 'TOC',
      choices: ["ナレッジマネジメント", "TOC", "バリューチェーンマネジメント", "SCM"],
      comment:
          "TOC（Theory of Constraints）は、制約条件理論とも呼ばれ、組織やプロジェクトが直面する制約（ボトルネック）を特定し、それを改善することによって全体の成果を最大化するための管理手法。",
    )
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 271);
  });
}
