import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_17 {
  final quizItems = [
    QuizItem(
      word: '関係データベース',
      question: 'テーブル（関係）の集合としてデータを管理するデータベースの種類は何か？',
      ans: '関係データベース',
      choices: ["関係データベース", "データベース管理システム", "NoSQL", "RDBMS"],
      comment: "関係データベースは、データをテーブル（関係）の集合として管理し、行と列で構成される。",
      source: '平成26年秋期 問74',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'データベース管理システム',
      question: 'データベース管理システムを利用する目的はどれか。',
      ans: '複数の利用者がデータの一貫性を確保しながら情報を共有する。',
      choices: [
        "OSがなくてもデータを利用可能にする。",
        "ディスク障害に備えたバックアップを不要にする。",
        "ネットワークで送受信するデータを暗号化する。",
        "複数の利用者がデータの一貫性を確保しながら情報を共有する。"
      ],
      comment:
          "データベース管理システム（DBMS）は、データベースを効率的に管理し、データの定義、更新、取得を行うためのソフトウェアシステム。",
      source: '平成23年秋期 問53',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'RDBMS',
      question: '関係データベースを管理するためのDBMSの一種で、SQLを使用してデータを操作するシステムは何か？',
      ans: 'RDBMS',
      choices: ["RDBMS", "データベース管理システム", "関係データベース", "NoSQL"],
      comment:
          "RDBMS（Relational Database Management System）は、関係データベースを管理するためのDBMSの一種で、SQLを使用してデータを操作する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'NoSQL',
      question: 'SQLを使用しない、スケーラビリティや柔軟なスキーマを特徴とするデータベースの総称は何か？',
      ans: 'NoSQL',
      choices: ["NoSQL", "RDBMS", "関係データベース", "データベース管理システム"],
      comment: "NoSQLデータベースは、非関係型のデータモデルを採用し、スケーラビリティや柔軟なスキーマを特徴とするデータベースの総称。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'データクレンジング',
      question: 'データベース内の不正確、不完全、重複したデータを特定し、修正または削除するプロセスは何か？',
      ans: 'データクレンジング',
      choices: ["データクレンジング", "射影", "選択", "排他制御"],
      comment: "データクレンジングは、データベース内の不正確、不完全、重複したデータを特定し、修正または削除するプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'E-R図',
      question: 'データベース内のエンティティ間の関係を図式化したものは何か？',
      ans: '実体同士の関連を表した図であり，例えば，関係データベースの表同士の関連を表すのに用いられる。',
      choices: [
        "作業順序や作業時間を表した図であり，例えば，システム開発の日程管理をするのに用いられる。",
        "実体同士の関連を表した図であり，例えば，関係データベースの表同士の関連を表すのに用いられる。",
        "順次，選択，繰返し構造を組み合わせて表した図であり，例えば，プログラムの流れを記述するのに用いられる。",
        "状態の遷移や条件を記載した図であり，例えば，通信プロトコルの仕様を記述するのに用いられる。"
      ],
      comment:
          "E-R図(Entity-Relationship Diagram)は、関係データベースの設計に利用されるデータモデル化手法で、データベース化の対象となる実体と実体の持つ属性、を図式化して表現することができます。",
      source: '平成24年春期 問76',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '主キー',
      question: '関係データベースにおいて主キーを指定する目的はどれか。',
      ans: '主キーに指定した属性(列)で，レコード(行)を一意に識別できるようにする。',
      choices: [
        "主キーに指定した属性(列)で，複数のレコード(行)を同時に特定できるようにする。",
        "主キーに指定した属性(列)で，レコード(行)を一意に識別できるようにする。",
        "主キーに指定した属性(列)に対し，検索条件を指定できるようにする。",
        "主キーに指定した属性(列)を算術演算の対象として扱えるようにする。"
      ],
      comment:
          "主キーは、関係データベースのテーブル(表)ごとに設定され、テーブルの中である一つの行を一意に特定できる値を保持する属性(列)、または属性の組合せのこと。",
      source: '平成22年春期 問83',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '外部キー',
      question: '他のテーブルの主キーを参照し、テーブル間の関係を構築するための列は何か？',
      ans: '外部キー，インデックス',
      choices: ["インデックス", "外部キー，インデックス", "主キー", "主キー，外部キー，インデックス"],
      comment:
          "外部キーは、他のテーブルの主キーを参照し、テーブル間の関係を構築するための列で、2つ以上の別行を参照することもあるため複数の設定が可能。",
      source: '平成25年秋期 問51',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'インデックス',
      question: 'データベース内でデータの検索速度を向上させるために使用されるデータ構造は何か？',
      ans: 'インデックス',
      choices: ["インデックス", "主キー", "外部キー", "射影"],
      comment: "インデックスは、データベース内でデータの検索速度を向上させるために使用されるデータ構造。",
      importance: QuizImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 1701);
  });
}
