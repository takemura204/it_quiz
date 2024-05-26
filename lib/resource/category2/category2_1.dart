import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///システム開発技術
List<QuizItem> get category2_1 {
  final quizItems = [
    QuizItem(
      question: '外部設計の成果を基に、ソフトウェアの内部構造やデータモデルを設計する工程を何というか？',
      ans: '内部設計',
      choices: ["内部設計", "外部設計", "コーディング", "デバッグ"],
      comment: "内部設計は、外部設計で定められた仕様に基づいて、ソフトウェアの内部構造や動作の詳細を設計する工程。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ソフトウェア開発において、ユーザーの要求を基に機能や性能を定義する工程を何というか？',
      ans: '外部設計',
      choices: ["外部設計", "内部設計", "コーディング", "システムテスト"],
      comment: "外部設計は、ユーザーの要求をもとにソフトウェアの機能や性能、インターフェイスなどの仕様を定める工程。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ソフトウェアの不具合を特定し、修正する作業を何というか？',
      ans: 'デバッグ',
      choices: ["デバッグ", "コーディング", "コードレビュー", "ホワイトボックステスト"],
      comment: "デバッグは、ソフトウェア開発過程で発見された不具合やエラーを特定し、それらを修正する作業。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '他の開発者が書いたコードを検証し、改善点を指摘する活動を何というか？',
      ans: 'コードレビュー',
      choices: ["コードレビュー", "デバッグ", "ホワイトボックステスト", "ブラックボックステスト"],
      comment: "コードレビューは、品質向上やバグの早期発見を目的として、他の開発者が書いたコードを検証し、改善点を指摘する活動。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'プログラムの内部構造に基づいてテストを行う手法を何というか？',
      ans: 'ホワイトボックステスト',
      choices: ["ホワイトボックステスト", "ブラックボックステスト", "結合テスト", "システムテスト"],
      comment: "ホワイトボックステストは、プログラムの内部構造やロジックを理解し、その知識に基づいてテストを行う手法。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ソフトウェアテストの手法の一つで、内部構造を見ずに、入力と出力のみをテストする方法を何というか？',
      ans: 'ブラックボックステスト',
      choices: ["ブラックボックステスト", "ホワイトボックステスト", "単体テスト", "結合テスト"],
      comment: "ブラックボックステストは、ソフトウェアの内部構造や動作原理には着目せず、入力と出力のみを基にテストを行う方法。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ソフトウェア開発において、個々のプログラムモジュールが正しく動作するかを検証するテストを何というか？',
      ans: '単体テスト',
      choices: ["単体テスト", "結合テスト", "システムテスト", "運用テスト"],
      comment: "単体テストは、ソフトウェア開発において、個々のプログラムモジュールが仕様通りに正しく動作するかを検証するテスト。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数のソフトウェアモジュールを組み合わせ、それらが連携して正しく動作するかを検証するテストを何というか？',
      ans: '結合テスト',
      choices: ["結合テスト", "単体テスト", "システムテスト", "運用テスト"],
      comment: "結合テストは、複数のソフトウェアモジュールを組み合わせ、それらが連携して正しく動作するかを検証するテスト。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ソフトウェアが全体として要件を満たしているかを検証するテストを何というか？',
      ans: 'システムテスト',
      choices: ["システムテスト", "単体テスト", "結合テスト", "運用テスト"],
      comment: "システムテストは、ソフトウェアや情報システムが全体として要件を満たしているかを検証するテスト。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '実際の運用環境でソフトウェアが正しく機能するかを検証するテストを何というか？',
      ans: '運用テスト',
      choices: ["運用テスト", "システムテスト", "結合テスト", "単体テスト"],
      comment: "運用テストは、実際の運用環境や条件下でソフトウェアが正しく機能するかを検証するテスト。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ソフトウェアに変更を加えた後、変更が他の部分に悪影響を及ぼしていないかを確認するためのテストを何というか？',
      ans: '回帰テスト',
      choices: ["回帰テスト", "単体テスト", "ブラックボックステスト", "ホワイトボックステスト"],
      comment:
          "回帰テストは、ソフトウェアに変更や修正を加えた後、その変更が他の部分に悪影響を及ぼしていないかを確認するために行われるテスト。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '最終的なソフトウェア製品をユーザーが受け入れるための条件を満たしているかを確認するテストを何というか？',
      ans: '受入れテスト',
      choices: ["受入れテスト", "システムテスト", "運用テスト", "回帰テスト"],
      comment: "受入れテストは、最終的なソフトウェア製品がユーザーが受け入れるための条件や要件を満たしているかを確認するテスト。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ソフトウェアの品質を保証するために、製品のどのような特性が重要視されるか？',
      ans: '品質特性',
      choices: ["品質特性", "コード効率", "開発速度", "コスト"],
      comment: "品質特性とは、ソフトウェア製品の性能、信頼性、使用性、効率性、保守性、移植性など、品質を構成する要素のこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'プログラムのソースコードを実際に書く工程を何というか？',
      ans: 'コーディング',
      choices: ["コーディング", "デバッグ", "コンパイラ", "コードレビュー"],
      comment: "コーディングは、内部設計の指示に従ってプログラムのソースコードを作成する工程。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ソースコードを機械語に変換するプログラムを何というか？',
      ans: 'コンパイラ',
      choices: ["コンパイラ", "インタプリタ", "アセンブラ", "リンカ"],
      comment: "コンパイラは、プログラムのソースコードをコンピュータが直接実行可能な機械語に変換するプログラム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '組織や企業にソフトウェアを導入し、実際に運用を開始することを何というか？',
      ans: 'ソフトウェア導入',
      choices: ["ソフトウェア導入", "システムテスト", "ソフトウェア開発", "運用テスト"],
      comment: "ソフトウェア導入は、組織や企業にソフトウェア製品を導入し、実際に業務で使用を開始すること。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ソフトウェアが運用されている間、問題の修正や機能の追加などを行う活動を何というか？',
      ans: 'ソフトウェア保守',
      choices: ["ソフトウェア保守", "ソフトウェア開発", "ソフトウェア導入", "システムテスト"],
      comment: "ソフトウェア保守は、ソフトウェアが運用されている間に発生する問題の修正や機能の更新、性能の向上などを行う活動。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ソフトウェアの機能に基づいて、その規模を評価するために使用される手法を何というか？',
      ans: 'ファンクションポイント法',
      choices: ["ファンクションポイント法", "類推見積法", "プログラムステップ法", "標準タスク法"],
      comment: "ファンクションポイント法は、ソフトウェアの機能や複雑さに基づいて、その規模を評価する手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '過去のプロジェクトのデータや経験を基にして、新しいプロジェクトの工数やコストを見積もる手法を何というか？',
      ans: '類推見積法',
      choices: ["類推見積法", "ファンクションポイント法", "プログラムステップ法", "標準タスク法"],
      comment: "類推見積法は、過去の類似プロジェクトのデータや経験を参考にして、新しいプロジェクトの工数やコストを見積もる手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ソフトウェアのソースコードの行数に基づいて開発工数やコストを見積もる手法を何というか？',
      ans: 'プログラムステップ法',
      choices: ["プログラムステップ法", "ファンクションポイント法", "類推見積法", "標準タスク法"],
      comment: "プログラムステップ法は、ソフトウェアのソースコードの行数を基にして開発工数やコストを見積もる手法。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: 'ソフトウェア開発プロジェクトにおいて、標準的な作業項目に基づいて工数やコストを見積もる手法を何というか？',
      ans: '標準タスク法',
      choices: ["標準タスク法", "ファンクションポイント法", "プログラムステップ法", "類推見積法"],
      comment: "標準タスク法は、ソフトウェア開発プロジェクトにおいて、定められた標準的な作業項目に基づいて必要な工数やコストを見積もる手法。",
      importance: QuizImportanceType.none,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category2Index + 101);
  });
}
