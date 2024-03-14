import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category0_3 {
  final quizItems = [
    QuizItem(
      question: '企業が自社の強み、弱み、機会、脅威を分析するために使用するフレームワークは何か？',
      ans: 'SWOT分析',
      choices: ["SWOT分析", "PPM", "VRIO分析", "3C分析"],
      comment:
          "SWOT分析は、Strengths（強み）、Weaknesses（弱み）、Opportunities（機会）、Threats（脅威）の頭文字を取ったもので、企業が外部環境と内部環境を分析するために使用するフレームワーク。",
    ),
    QuizItem(
      question: '他社に製品やサービスの生産を委託することを何というか？',
      ans: 'アウトソーシング',
      choices: ["アライアンス", "アウトソーシング", "フランチャイズ", "ファブレス"],
      comment: "アウトソーシングは、コスト削減や効率化を目的として、他社に製品やサービスの生産、業務プロセスなどを委託すること。",
    ),
    QuizItem(
      question: 'マーケティングの基本的なフレームワークで、製品、価格、流通、プロモーションの4つの要素を何というか？',
      ans: '4P',
      choices: ["UX", "4P", "4C", "RFM分析"],
      comment:
          "4Pは、マーケティング戦略を立てる際の基本的なフレームワークで、Product（製品）、Price（価格）、Place（流通）、Promotion（プロモーション）の4つの要素を指す。",
    ),
    QuizItem(
      question: '顧客の過去の購買行動を最近性、頻度、金額の3つの観点から分析する手法は何か？',
      ans: 'RFM分析',
      choices: ["4C", "RFM分析", "アンゾフの成長マトリクス", "オピニオンリーダー"],
      comment:
          "RFM分析は、顧客の購買行動をRecency（最近性）、Frequency（頻度）、Monetary（金額）の3つの観点から分析し、顧客の価値を評価する手法。",
    ),
    QuizItem(
      question: '組織の戦略を多次元的に評価し、管理するためのフレームワークを何というか？',
      ans: 'バランススコアカード',
      choices: ["バランススコアカード", "CSF", "KGI", "KPI"],
      comment:
          "バランススコアカードは、財務、顧客、内部ビジネスプロセス、学習と成長の4つの視点から組織の戦略を多次元的に評価し、管理するためのフレームワーク。",
    ),
    QuizItem(
      question: '製品やサービスの価値を最大化するために、コストと機能のバランスを見直す手法を何というか？',
      ans: 'バリューエンジニアリング',
      choices: ["KPI", "KGI", "バリューエンジニアリング", "バランススコアカード"],
      comment:
          "バリューエンジニアリングは、製品やサービスのコストを削減しつつ、顧客にとっての価値を最大化するために、コストと機能のバランスを見直す手法。",
    ),
    QuizItem(
      question: '企業が市場や顧客からのフィードバックを活用してイノベーションを起こす方法を何というか？',
      ans: 'MOT',
      choices: ["MOT", "POT", "LOT", "NOT"],
      comment:
          "MOT（Moment of Truth）は、企業が市場や顧客との接点（真実の瞬間）で得たフィードバックを活用し、製品やサービスのイノベーションを起こす方法。",
    ),
    QuizItem(
      question: '製品開発において、設計から製造までの各工程を並行して行うことで、開発期間の短縮を図る手法を何というか？',
      ans: 'コンカレントエンジニアリング',
      choices: ["プロンプトエンジニアリング", "コンカレントエンジニアリング", "シミュレーション", "グローバルエンジニアリング"],
      comment:
          "コンカレントエンジニアリングは、製品開発の各工程を並行して進めることで、開発期間の短縮や効率化を図る手法。チーム間のコミュニケーションを活性化し、問題解決を迅速化する。",
    ),
    QuizItem(
      question: 'プロセスやデータフローを図式化して表現するためのモデリング手法は何か？',
      ans: 'DFD',
      choices: ["SoE", "DFD", "BPMN", "BPR"],
      comment:
          "DFD（Data Flow Diagram）は、システム内のデータフローや処理の流れを視覚的に表現するためのモデリング手法。プロセス間でのデータのやり取りを図式化する。",
    ),
    QuizItem(
      question: '情報技術に関する基本的な知識やスキルを指す用語は何か？',
      ans: 'ITリテラシ',
      choices: ["SOA", "ITリテラシ", "ゲーミフィケーション", "ディジタルディバイド"],
      comment: "ITリテラシは、情報技術に関する基本的な知識や、コンピュータやインターネットを効果的に利用するためのスキルを指す。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 21, isPremium: false);
  });
}
