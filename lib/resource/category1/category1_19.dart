import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///業務プロセス
List<QuizItem> get category1_19 {
  final quizItems = [
    QuizItem(
      word: 'DFD(Data Flow Diagram)',
      question: 'DFDの表記に関する記述として，最も適切なものはどれか。',
      ans: 'データの流れに着目し，業務のデータの流れと処理の関係を表記する。',
      choices: [
        "時間の経過や状況の変化に伴う，システムの状態の遷移を表記する。",
        "システムで扱う実体同士を関連付けて，データの構造を表記する。",
        "システムを構成する要素の属性や操作，要素同士の関係を表記する。",
        "データの流れに着目し，業務のデータの流れと処理の関係を表記する。"
      ],
      comment:
          "DFD(Data Flow Diagram)は、データの流れに着目して、その対象となる業務のデータの流れと処理の関係をわかりやすく図式化する構造化分析の手法。",
      source: '平成29年春期 問14',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'BPMN（Business Process Model and Notation）',
      question: 'ビジネスプロセスをモデリングし、視覚化するための標準的な記法を何というか？',
      ans: 'BPMN',
      choices: ["DFD", "BPMN", "BPR", "EA"],
      comment:
          "BPMN（Business Process Model and Notation）は、ビジネスプロセスを視覚的に表現し、分析や改善のための標準的な記法。プロセスのフローを図式化して理解しやすくする。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'BPR(Business Process Reengineering)',
      question: 'BPRに関する記述として，適切なものはどれか。',
      ans: '業務の手順を改めて見直し，抜本的に再設計する考え方',
      choices: [
        "業務の手順を改めて見直し，抜本的に再設計する考え方",
        "サービスの事業者が利用者に対して，サービスの品質を具体的な数値として保証する契約",
        "参加している人が自由に書込みができるコンピュータシステム上の掲示板",
        "情報システムを導入する際に，ユーザーがベンダーに提供する導入システムの概要や調達条件を記述した文書"
      ],
      comment:
          "BPR(Business Process Reengineering)は、既存の組織やビジネスルールを抜本的に見直し、職務、業務フロー、管理機構、情報システムを再設計する手法、または組織構造や情報システムを首尾一貫したビジネスプロセスへ再統合し、効率や生産性の劇的な改善を目指す取り組み。",
      source: '平成28年秋期 問2',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'BPM(Business Process Management)',
      question: 'BPM(Business Process Management)の説明として，適切なものはどれか。',
      ans: 'BPM',
      choices: ["BPR", "BPM", "ワークフローシステム", "BYOD"],
      comment:
          "BPM(Business Process Management)は、業務プロセスを継続的に管理し、改善していくことを目的としたアプローチ。プロセスの自動化、効率化、柔軟性の向上を図る。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ワークフローシステム',
      question: 'ワークフローシステムの活用事例として，最も適切なものはどれか。',
      ans: '機器を購入するにあたり，申請書類の起案からりん議決裁に至るまでの一連の流れをネットワーク上で行う。',
      choices: [
        "機器を購入するにあたり，申請書類の起案からりん議決裁に至るまでの一連の流れをネットワーク上で行う。",
        "資材調達，生産，販売，物流などの情報を一貫して連携することで，無駄な在庫を削減する。",
        "自社と得意先の間で，見積書や注文書などの商取引の情報をネットワーク経由で相互にやり取りする。",
        "自動車工場の生産ラインにおいて，自工程の生産状況に合わせて，必要な部品を必要なだけ前工程から調達する。"
      ],
      comment:
          "ワークフローシステムは、業務プロセスの各ステップを自動化し、業務の流れを効率的に管理・最適化するためのシステムで、業務の可視化、迅速化、正確性の向上に貢献する。",
      source: '平成22年秋期 問6',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'RPA（Robotic Process Automation）',
      question: '定型的な業務プロセスをソフトウェアロボットで自動化する技術を何というか？',
      ans: 'RPA',
      choices: ["ワークフローシステム", "RPA", "BYOD", "M2M"],
      comment:
          "RPA（Robotic Process Automation）は、人が行っていた定型的な業務プロセスをソフトウェアロボットで自動化し、業務の効率化やコスト削減を目指す技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'BYOD（Bring Your Own Device）',
      question: '従業員が自身の端末を業務に利用することを許可する制度を何というか？',
      ans: 'BYOD',
      choices: ["RPA", "BYOD", "M2M", "テレワーク"],
      comment:
          "BYOD（Bring Your Own Device）は、従業員が自身のスマートフォンやタブレットなどの個人端末を業務に利用することを許可する制度。柔軟な働き方や効率化を促進する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'M2M（Machine to Machine）',
      question: '機器同士が直接通信を行い、データの交換や制御を自動的に実行する技術を何というか？',
      ans: 'M2M',
      choices: ["BYOD", "M2M", "テレワーク", "グループウェア"],
      comment:
          "M2M（Machine to Machine）は、機器同士がインターネットや他のネットワークを通じて直接通信を行い、データの交換や制御を自動的に実行する技術。産業機械、家電製品、車両など様々な分野で応用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'テレワーク',
      question: 'インターネット技術を利用して、自宅などの職場以外の場所から仕事を行う働き方を何というか？',
      ans: 'テレワーク',
      choices: ["M2M", "テレワーク", "グループウェア", "SNS"],
      comment:
          "テレワークは、インターネットや情報通信技術を活用して、自宅や移動中など職場以外の場所で仕事を行う働き方。柔軟な労働環境の実現や、通勤時間の削減が可能。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'グループウェア',
      question: 'グループウェアで提供されている情報共有機能を活用したサービスとして，最も適切なものはどれか。',
      ans: 'スケジュール管理',
      choices: ["スケジュール管理", "セキュリティ管理", "ネットワーク管理", "ユーザー管理"],
      comment:
          "グループウェアは、電子メール、スケジュール管理、文書共有など、社内のコンピュータネットワーク上を利用した社員同士が情報を効率的に共有することを目的としたソフトウェア。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'チャット',
      question: 'インターネットを通じてリアルタイムでテキストメッセージを交換するコミュニケーションツールを何というか？',
      ans: 'チャット',
      choices: ["ブログ", "チャット", "SNS", "シェアリングエコノミー"],
      comment:
          "チャットは、インターネットを利用してリアルタイムでテキストメッセージを交換するコミュニケーションツール。個人間のやり取りや、グループでのディスカッションに利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'SNS（Social Networking Service）',
      question:
          'A商店街では，インターネット上にサイトを作り，商店街のプロモーションを行うことにした。サイトに組み込むことによって，顧客とのコミュニケーションの向上が期待できるものはどれか。',
      ans: 'SNS',
      choices: ["SCM", "SNS", "SQL", "SSL"],
      comment:
          "SNS（Social Networking Service）は、ユーザーがプロフィールを作成し、他のユーザーと友達になったり、メッセージの交換、写真や動画の共有などを行うインターネット上のプラットフォーム。",
      source: '平成24年秋期 問4',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'シェアリングエコノミー',
      question: '所有することなく、必要に応じて商品やサービスを共有またはレンタルする経済活動を何というか？',
      ans: 'シェアリングエコノミー',
      choices: ["SNS", "シェアリングエコノミー", "ライフログ", "情報銀行"],
      comment:
          "シェアリングエコノミーは、個人や企業が所有する商品やサービスを、インターネットを通じて共有またはレンタルすることで、効率的な資源利用を目指す経済活動。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ライフログ',
      question: '個人の日々の活動や体験を記録し、データとして蓄積する行為を何というか？',
      ans: 'ライフログ',
      choices: ["シェアリングエコノミー", "ライフログ", "情報銀行", "PDS"],
      comment:
          "ライフログは、個人が日常生活の中での活動や体験、行動パターンなどをデジタルデータとして記録し蓄積する行為。健康管理や行動分析などに利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '情報銀行',
      question: '個人の情報を安全に管理し、個人の同意のもとで第三者に提供することができるサービスを何というか？',
      ans: '情報銀行',
      choices: ["ライフログ", "情報銀行", "PDS", "エンタープライズサーチ"],
      comment:
          "情報銀行は、個人のプライバシーに関わる情報を安全に管理し、個人の同意のもとで必要な場合に限り、第三者に情報を提供することができるサービス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'PDS（Personal Data Store）',
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
