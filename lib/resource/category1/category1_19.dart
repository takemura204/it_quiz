import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///業務プロセス
List<QuizItem> get category1_19 {
  final quizItems = [
    QuizItem(
      question: 'プロセスやデータフローを図式化して表現するためのモデリング手法は何か？',
      ans: 'DFD',
      choices: ["SoE", "DFD", "BPMN", "BPR"],
      comment:
          "DFD（Data Flow Diagram）は、システム内のデータフローや処理の流れを視覚的に表現するためのモデリング手法。プロセス間でのデータのやり取りを図式化する。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ビジネスプロセスをモデリングし、視覚化するための標準的な記法を何というか？',
      ans: 'BPMN',
      choices: ["DFD", "BPMN", "BPR", "EA"],
      comment:
          "BPMN（Business Process Model and Notation）は、ビジネスプロセスを視覚的に表現し、分析や改善のための標準的な記法。プロセスのフローを図式化して理解しやすくする。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ビジネスプロセスの効率化や改善を目的として、プロセスを根本から見直し、再設計する取り組みを何というか？',
      ans: 'BPR',
      choices: ["BPMN", "BPR", "ワークフローシステム", "RPA"],
      comment:
          "BPR（Business Process Reengineering）は、既存のビジネスプロセスを根本から見直し、より効率的かつ効果的な方法で業務を再設計することを目的とした取り組み。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '業務プロセスを管理し、業務の自動化や効率化を図るための取り組みや技術を何というか？',
      ans: 'BPM',
      choices: ["BPR", "BPM", "ワークフローシステム", "BYOD"],
      comment:
          "BPM（Business Process Management）は、業務プロセスを継続的に管理し、改善していくことを目的としたアプローチ。プロセスの自動化、効率化、柔軟性の向上を図る。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '業務プロセスの各ステップを自動化し、業務の流れを管理・最適化するシステムを何というか？',
      ans: 'ワークフローシステム',
      choices: ["BPM", "ワークフローシステム", "RPA", "BYOD"],
      comment:
          "ワークフローシステムは、業務プロセスの各ステップを自動化し、業務の流れを効率的に管理・最適化するためのシステム。業務の可視化、迅速化、正確性の向上に貢献する。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '定型的な業務プロセスをソフトウェアロボットで自動化する技術を何というか？',
      ans: 'RPA',
      choices: ["ワークフローシステム", "RPA", "BYOD", "M2M"],
      comment:
          "RPA（Robotic Process Automation）は、人が行っていた定型的な業務プロセスをソフトウェアロボットで自動化し、業務の効率化やコスト削減を目指す技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '従業員が自身の端末を業務に利用することを許可する制度を何というか？',
      ans: 'BYOD',
      choices: ["RPA", "BYOD", "M2M", "テレワーク"],
      comment:
          "BYOD（Bring Your Own Device）は、従業員が自身のスマートフォンやタブレットなどの個人端末を業務に利用することを許可する制度。柔軟な働き方や効率化を促進する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '機器同士が直接通信を行い、データの交換や制御を自動的に実行する技術を何というか？',
      ans: 'M2M',
      choices: ["BYOD", "M2M", "テレワーク", "グループウェア"],
      comment:
          "M2M（Machine to Machine）は、機器同士がインターネットや他のネットワークを通じて直接通信を行い、データの交換や制御を自動的に実行する技術。産業機械、家電製品、車両など様々な分野で応用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'インターネット技術を利用して、自宅などの職場以外の場所から仕事を行う働き方を何というか？',
      ans: 'テレワーク',
      choices: ["M2M", "テレワーク", "グループウェア", "SNS"],
      comment:
          "テレワークは、インターネットや情報通信技術を活用して、自宅や移動中など職場以外の場所で仕事を行う働き方。柔軟な労働環境の実現や、通勤時間の削減が可能。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '共同作業をサポートするための情報技術を活用したソフトウェアやシステムを何というか？',
      ans: 'グループウェア',
      choices: ["テレワーク", "グループウェア", "SNS", "チャット"],
      comment:
          "グループウェアは、電子メール、スケジュール管理、文書共有など、チーム内のコミュニケーションや共同作業をサポートするためのソフトウェアやシステム。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'インターネットを通じてリアルタイムでテキストメッセージを交換するコミュニケーションツールを何というか？',
      ans: 'チャット',
      choices: ["ブログ", "チャット", "SNS", "シェアリングエコノミー"],
      comment:
          "チャットは、インターネットを利用してリアルタイムでテキストメッセージを交換するコミュニケーションツール。個人間のやり取りや、グループでのディスカッションに利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '個人や団体がインターネット上で自己表現や情報共有、コミュニケーションを行うプラットフォームを何というか？',
      ans: 'SNS',
      choices: ["チャット", "SNS", "シェアリングエコノミー", "ライフログ"],
      comment:
          "SNS（Social Networking Service）は、ユーザーがプロフィールを作成し、他のユーザーと友達になったり、メッセージの交換、写真や動画の共有などを行うインターネット上のプラットフォーム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '所有することなく、必要に応じて商品やサービスを共有またはレンタルする経済活動を何というか？',
      ans: 'シェアリングエコノミー',
      choices: ["SNS", "シェアリングエコノミー", "ライフログ", "情報銀行"],
      comment:
          "シェアリングエコノミーは、個人や企業が所有する商品やサービスを、インターネットを通じて共有またはレンタルすることで、効率的な資源利用を目指す経済活動。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '個人の日々の活動や体験を記録し、データとして蓄積する行為を何というか？',
      ans: 'ライフログ',
      choices: ["シェアリングエコノミー", "ライフログ", "情報銀行", "PDS"],
      comment:
          "ライフログは、個人が日常生活の中での活動や体験、行動パターンなどをデジタルデータとして記録し蓄積する行為。健康管理や行動分析などに利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '個人の情報を安全に管理し、個人の同意のもとで第三者に提供することができるサービスを何というか？',
      ans: '情報銀行',
      choices: ["ライフログ", "情報銀行", "PDS", "エンタープライズサーチ"],
      comment:
          "情報銀行は、個人のプライバシーに関わる情報を安全に管理し、個人の同意のもとで必要な場合に限り、第三者に情報を提供することができるサービス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '個人が自分のデータを管理し、自身でそのデータの利用をコントロールするためのシステムを何というか？',
      ans: 'PDS',
      choices: ["情報銀行", "PDS", "エンタープライズサーチ", "EA"],
      comment:
          "PDS（Personal Data Store）は、個人が自分自身のデータを一元的に管理し、自身でそのデータの共有や利用をコントロールするためのシステム。プライバシー保護やデータの自己主権を実現する。",
      importance: QuizImportanceType.low,
    ),
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1901);
  });
}
