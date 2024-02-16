import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_3 {
  final quizItems = [
    QuizItem(
      question: '複数の要素を順序付けて格納する基本的なデータ構造は何か？',
      ans: 'リスト',
      choices: ["リスト", "カラム", "スタック", "スライダー"],
      comment: "リストは、複数の要素を順序付けて格納する基本的なデータ構造で、要素の挿入や削除が容易。",
    ),
    QuizItem(
      question: '先入れ先出し（FIFO）の原則で動作し、データを一時的に保持するデータ構造は何か？',
      ans: 'キュー',
      choices: ["キュー", "リスト", "キャッシュ", "木構造"],
      comment:
          "キューは、先入れ先出し（FIFO：First In First Out）の原則に基づいて動作するデータ構造で、データの追加は末尾から、削除は先頭から行われる。",
    ),
    QuizItem(
      question: '後入れ先出し（LIFO）の原則で動作し、データを一時的に保持するデータ構造は何か？',
      ans: 'スタック',
      choices: ["スタック", "キュー", "リスト", "木構造"],
      comment:
          "スタックは、後入れ先出し（LIFO：Last In First Out）の原則に基づいて動作するデータ構造で、データの追加と削除が同じ側（トップ）から行われる。",
    ),
    QuizItem(
      question: 'ノードと呼ばれる要素と、それらを結ぶ枝で構成される階層的なデータ構造は何か？',
      ans: '木構造',
      choices: ["木構造", "リスト", "キュー", "スタック"],
      comment: "木構造は、ノード（要素）と枝（ノード間のリンク）で構成され、階層的な関係を表現するデータ構造。",
    ),
    QuizItem(
      question: '各ノードが最大で2つの子ノードを持つことができる木構造は何か？',
      ans: '2分木',
      choices: ["2分木", "AVL木", "ヒープ", "赤黒木"],
      comment: "2分木は、各ノードが最大で2つの子ノード（左子と右子）を持つことができる木構造。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 21 + 3000);
  });
}
