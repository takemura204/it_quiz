import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_36 {
  final quizItems = [
    QuizItem(
      question: '企業内の様々な情報源から情報を検索し、アクセス可能にするシステムを何というか？',
      ans: 'エンタープライズサーチ',
      choices: ["エンタープライズサーチ", "グループウェア", "RPA", "SNS"],
      comment:
          "エンタープライズサーチは、企業内の文書やデータベースなど、様々な情報源から必要な情報を迅速に検索し、アクセス可能にするシステム。",
    ),
    QuizItem(
      question: '企業全体のITアーキテクチャを計画し、組織全体のビジネスとITの整合性を高める取り組みを何というか？',
      ans: 'EA',
      choices: ["EA", "DFD", "BPMN", "BPR"],
      comment:
          "EA（Enterprise Architecture）は、企業全体のITアーキテクチャを戦略的に計画し、組織全体でのビジネスとITの整合性を高め、効率化を図る取り組み。",
    ),
    QuizItem(
      question: '主に安定した運用が求められる既存の業務システムを指す言葉は何か？',
      ans: 'SoR',
      choices: ["SoR", "SoE", "RPA", "BPM"],
      comment:
          "SoR（System of Records）は、会計や人事管理など、安定した運用が求められ、企業の基幹業務を支える既存の業務システムを指す。",
    ),
    QuizItem(
      question: '革新的なビジネスモデルや顧客体験を提供するための新しいITシステムを指す言葉は何か？',
      ans: 'SoE',
      choices: ["SoR", "SoE", "RPA", "エンタープライズサーチ"],
      comment:
          "SoE（System of Engagement）は、顧客との関わりを深めたり、革新的なビジネスモデルを支えたりするために開発される、ユーザー中心の新しいITシステムを指す。",
    ),
    QuizItem(
      question: 'プロセスやデータフローを図式化して表現するためのモデリング手法は何か？',
      ans: 'DFD',
      choices: ["SoE", "DFD", "BPMN", "BPR"],
      comment:
          "DFD（Data Flow Diagram）は、システム内のデータフローや処理の流れを視覚的に表現するためのモデリング手法。プロセス間でのデータのやり取りを図式化する。",
    ),
    QuizItem(
      question: 'ビジネスプロセスをモデリングし、視覚化するための標準的な記法を何というか？',
      ans: 'BPMN',
      choices: ["DFD", "BPMN", "BPR", "EA"],
      comment:
          "BPMN（Business Process Model and Notation）は、ビジネスプロセスを視覚的に表現し、分析や改善のための標準的な記法。プロセスのフローを図式化して理解しやすくする。",
    ),
    QuizItem(
      question: 'ビジネスプロセスの効率化や改善を目的として、プロセスを根本から見直し、再設計する取り組みを何というか？',
      ans: 'BPR',
      choices: ["BPMN", "BPR", "ワークフローシステム", "RPA"],
      comment:
          "BPR（Business Process Reengineering）は、既存のビジネスプロセスを根本から見直し、より効率的かつ効果的な方法で業務を再設計することを目的とした取り組み。",
    ),
    QuizItem(
      question: '業務プロセスを管理し、業務の自動化や効率化を図るための取り組みや技術を何というか？',
      ans: 'BPM',
      choices: ["BPR", "BPM", "ワークフローシステム", "BYOD"],
      comment:
          "BPM（Business Process Management）は、業務プロセスを継続的に管理し、改善していくことを目的としたアプローチ。プロセスの自動化、効率化、柔軟性の向上を図る。",
    ),
    QuizItem(
      question: '業務プロセスの各ステップを自動化し、業務の流れを管理・最適化するシステムを何というか？',
      ans: 'ワークフローシステム',
      choices: ["BPM", "ワークフローシステム", "RPA", "BYOD"],
      comment:
          "ワークフローシステムは、業務プロセスの各ステップを自動化し、業務の流れを効率的に管理・最適化するためのシステム。業務の可視化、迅速化、正確性の向上に貢献する。",
    ),
    QuizItem(
      question: '定型的な業務プロセスをソフトウェアロボットで自動化する技術を何というか？',
      ans: 'RPA',
      choices: ["ワークフローシステム", "RPA", "BYOD", "M2M"],
      comment:
          "RPA（Robotic Process Automation）は、人が行っていた定型的な業務プロセスをソフトウェアロボットで自動化し、業務の効率化やコスト削減を目指す技術。",
    ),
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 351 + 1000);
  });
}
