import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_17 {
  final quizItems = [
    QuizItem(
      question: 'テーブル（関係）の集合としてデータを管理するデータベースの種類は何か？',
      ans: '関係データベース',
      choices: ["関係データベース", "データベース管理システム", "NoSQL", "RDBMS"],
      comment: "関係データベースは、データをテーブル（関係）の集合として管理し、行と列で構成される。",
    ),
    QuizItem(
      question: 'データベースを管理し、データの定義、更新、取得を行うためのシステムは何か？',
      ans: 'データベース管理システム',
      choices: ["データベース管理システム", "関係データベース", "NoSQL", "RDBMS"],
      comment:
          "データベース管理システム（DBMS）は、データベースを効率的に管理し、データの定義、更新、取得を行うためのソフトウェアシステム。",
    ),
    QuizItem(
      question: '関係データベースを管理するためのDBMSの一種で、SQLを使用してデータを操作するシステムは何か？',
      ans: 'RDBMS',
      choices: ["RDBMS", "データベース管理システム", "関係データベース", "NoSQL"],
      comment:
          "RDBMS（Relational Database Management System）は、関係データベースを管理するためのDBMSの一種で、SQLを使用してデータを操作する。",
    ),
    QuizItem(
      question: 'SQLを使用しない、スケーラビリティや柔軟なスキーマを特徴とするデータベースの総称は何か？',
      ans: 'NoSQL',
      choices: ["NoSQL", "RDBMS", "関係データベース", "データベース管理システム"],
      comment: "NoSQLデータベースは、非関係型のデータモデルを採用し、スケーラビリティや柔軟なスキーマを特徴とするデータベースの総称。",
    ),
    QuizItem(
      question: 'データベース内の不正確、不完全、重複したデータを特定し、修正または削除するプロセスは何か？',
      ans: 'データクレンジング',
      choices: ["データクレンジング", "射影", "選択", "排他制御"],
      comment: "データクレンジングは、データベース内の不正確、不完全、重複したデータを特定し、修正または削除するプロセス。",
    ),
    QuizItem(
      question: 'データベース内のエンティティ間の関係を図式化したものは何か？',
      ans: 'E-R図',
      choices: ["E-R図", "主キー", "外部キー", "インデックス"],
      comment:
          "E-R図（Entity-Relationship Diagram）は、データベース内のエンティティ間の関係を図式化したもので、データベース設計の際に使用される。",
    ),
    QuizItem(
      question: 'テーブル内の各行を一意に識別するために使用される列は何か？',
      ans: '主キー',
      choices: ["主キー", "外部キー", "インデックス", "射影"],
      comment: "主キーは、テーブル内の各行を一意に識別するために使用される列で、各行が唯一無二の値を持つことが保証される。",
    ),
    QuizItem(
      question: '他のテーブルの主キーを参照し、テーブル間の関係を構築するための列は何か？',
      ans: '外部キー',
      choices: ["外部キー", "主キー", "インデックス", "射影"],
      comment: "外部キーは、他のテーブルの主キーを参照し、テーブル間の関係を構築するための列。",
    ),
    QuizItem(
      question: 'データベース内でデータの検索速度を向上させるために使用されるデータ構造は何か？',
      ans: 'インデックス',
      choices: ["インデックス", "主キー", "外部キー", "射影"],
      comment: "インデックスは、データベース内でデータの検索速度を向上させるために使用されるデータ構造。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 1701);
  });
}
