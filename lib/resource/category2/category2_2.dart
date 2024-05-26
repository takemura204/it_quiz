import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///開発プロセス・手法
List<QuizItem> get category2_2 {
  final quizItems = [
    QuizItem(
      question:
          'ソフトウェア開発のパラダイムで、データとそのデータに関連する操作をひとまとめにした「オブジェクト」を基本的な構成要素とする手法は何か？',
      ans: 'オブジェクト指向',
      choices: ["オブジェクト指向", "プロセス中心アプローチ", "データ中心アプローチ", "UML"],
      comment:
          "オブジェクト指向は、データ（属性）とそのデータに対する操作（メソッド）をひとまとめにしたオブジェクトを基本的な構成要素とするソフトウェア開発の手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ソフトウェア開発において、データの構造や関係性を中心に考える設計手法を何というか？',
      ans: 'データ中心アプローチ',
      choices: ["データ中心アプローチ", "プロセス中心アプローチ", "オブジェクト指向", "UML"],
      comment: "データ中心アプローチは、データの構造や関係性を中心に考え、それに基づいてシステムを設計・開発するアプローチ。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: 'ソフトウェア開発において、プロセスや手順の流れを中心に考える設計手法を何というか？',
      ans: 'プロセス中心アプローチ',
      choices: ["プロセス中心アプローチ", "データ中心アプローチ", "オブジェクト指向", "UML"],
      comment: "プロセス中心アプローチは、プロセスや手順の流れを中心に考え、それに基づいてシステムを設計・開発するアプローチ。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: 'ソフトウェア開発で使用される、システムの構造や振る舞いを視覚的に表現するためのモデリング言語は何か？',
      ans: 'UML',
      choices: ["UML", "オブジェクト指向", "データ中心アプローチ", "プロセス中心アプローチ"],
      comment:
          "UML（Unified Modeling Language）は、ソフトウェアの構造や振る舞い、およびビジネスプロセスを視覚的に表現するための標準的なモデリング言語。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question:
          '開発（Development）と運用（Operations）の連携を重視し、ソフトウェアのリリースや運用を迅速かつ効率的に行う文化や実践を何というか？',
      ans: 'DevOps',
      choices: ["DevOps", "アジャイル", "スクラム", "XP"],
      comment:
          "DevOpsは、ソフトウェア開発（Development）とIT運用（Operations）の協力を促進し、継続的なインテグレーション、デリバリー、デプロイメントを実現する文化や実践のこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question:
          'ソフトウェア開発プロジェクトを、要件定義から設計、実装、テスト、リリースまでの一連のフェーズに沿って進めるモデルを何というか？',
      ans: 'ウォータフォールモデル',
      choices: ["ウォータフォールモデル", "スパイラルモデル", "プロトタイピングモデル", "RAD"],
      comment: "ウォータフォールモデルは、ソフトウェア開発プロセスを線形かつ逐次的なフェーズに分けて進めるモデル。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'リスク管理を重視し、反復的な開発サイクルを用いるソフトウェア開発モデルを何というか？',
      ans: 'スパイラルモデル',
      choices: ["スパイラルモデル", "ウォータフォールモデル", "プロトタイピングモデル", "RAD"],
      comment:
          "スパイラルモデルは、プロジェクトの各段階でリスク分析を行いながら、計画、リスク分析、エンジニアリング、評価のフェーズを反復して進める開発モデル。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '初期段階で実用的なモデルを迅速に開発し、ユーザーフィードバックを基に改良を加えていく開発モデルを何というか？',
      ans: 'プロトタイピングモデル',
      choices: ["プロトタイピングモデル", "ウォータフォールモデル", "スパイラルモデル", "RAD"],
      comment:
          "プロトタイピングモデルは、初期のプロトタイプ（試作品）を作成し、ユーザーのフィードバックを得ながら繰り返し改良を加えていくソフトウェア開発モデル。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '迅速なアプリケーション開発を目指し、短期間で高品質なシステムを開発するための方法論は何か？',
      ans: 'RAD',
      choices: ["RAD", "ウォータフォールモデル", "スパイラルモデル", "プロトタイピングモデル"],
      comment:
          "RAD（Rapid Application Development）は、ユーザー参加型の開発やプロトタイピングを活用し、短期間でアプリケーションを開発する方法論。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '既存の製品やシステムから、その仕様や設計情報を抽出するプロセスを何というか？',
      ans: 'リバースエンジニアリング',
      choices: ["リバースエンジニアリング", "リファクタリング", "テスト駆動開発", "ペアプログラミング"],
      comment: "リバースエンジニアリングは、完成した製品やソフトウェアから、その構造や機能、設計情報を解析し、抽出するプロセス。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '小さなチームで短期間のイテレーションを繰り返し、柔軟かつ迅速にソフトウェア開発を行う手法を総称して何というか？',
      ans: 'アジャイル',
      choices: ["アジャイル", "DevOps", "スクラム", "XP"],
      comment:
          "アジャイル開発は、柔軟性と効率性を重視し、短期間の反復開発サイクル（イテレーション）を通じて、顧客の変化する要求に迅速に対応するソフトウェア開発手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '継続的なフィードバックと改良を重視し、短いサイクルで開発を進めるアジャイル開発の一手法を何というか？',
      ans: 'XP',
      choices: ["XP", "スクラム", "リーン", "カンバン"],
      comment:
          "XP（エクストリーム・プログラミング）は、継続的な顧客のフィードバックと小さなリリースを重視し、コーディング規約の遵守、ペアプログラミング、テスト駆動開発などを取り入れるアジャイル開発の手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '開発初期にテストケースを作成し、そのテストが通過するようにコードを書く開発手法を何というか？',
      ans: 'テスト駆動開発',
      choices: ["テスト駆動開発", "リファクタリング", "ペアプログラミング", "スクラム"],
      comment:
          "テスト駆動開発（TDD: Test-Driven Development）は、テストを先に書き、そのテストをパスする最小限のコードを実装し、次にそのコードをリファクタリングするという短い開発サイクルを繰り返す手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '二人一組で一つのコンピュータを用いてプログラミングを行う開発手法を何というか？',
      ans: 'ペアプログラミング',
      choices: ["ペアプログラミング", "テスト駆動開発", "リファクタリング", "スクラム"],
      comment:
          "ペアプログラミングは、二人一組で一つのコンピュータに向かい、一人がコーディング（ドライバー）を行い、もう一人がレビュー（ナビゲーター）を行う開発手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'コードの構造を改善し、将来の変更や拡張を容易にするために行う、ソフトウェアの内部構造の整理を何というか？',
      ans: 'リファクタリング',
      choices: ["リファクタリング", "リバースエンジニアリング", "テスト駆動開発", "ペアプログラミング"],
      comment: "リファクタリングは、外部から見た振る舞いを変えずに、ソフトウェアの内部構造を整理し、改善する活動。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '小さなチームでスプリントと呼ばれる短期間のイテレーションを繰り返し、製品を開発するアジャイル開発のフレームワークは何か？',
      ans: 'スクラム',
      choices: ["スクラム", "XP", "カンバン", "リーン"],
      comment:
          "スクラムは、自己組織化された小さなチームが、定期的なスプリントを通じて、進行中の作業を継続的にレビューしながら製品を開発するアジャイル開発のフレームワーク。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '情報システム開発におけるプロジェクトの進め方やシステムのライフサイクルなどを体系的にまとめたガイドラインを何というか？',
      ans: '共通フレーム',
      choices: ["共通フレーム", "CMMI", "スクラム", "アジャイル"],
      comment: "共通フレームは、情報システム開発に関する工程や成果物、用語などを標準化し、体系的にまとめたガイドラインのこと。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '組織の開発プロセスの成熟度を評価し、改善するためのモデルを何というか？',
      ans: 'CMMI',
      choices: ["CMMI", "共通フレーム", "スクラム", "アジャイル"],
      comment:
          "CMMI（Capability Maturity Model Integration）は、組織のプロセスの成熟度を段階的に評価し、ソフトウェア開発やプロジェクト管理のプロセス改善を支援するためのモデル。",
      importance: QuizImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category2Index + 201);
  });
}
