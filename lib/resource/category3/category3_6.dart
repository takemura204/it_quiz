import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_6 {
  final quizItems = [
    QuizItem(
      question: '開発者が複雑なコードを書かずにアプリケーションを迅速に開発できるプラットフォームは何か？',
      ans: 'ローコード',
      choices: ["ローコード", "ノーコード", "フルコード", "ハイコード"],
      comment:
          "ローコードプラットフォームは、複雑なコーディングを最小限に抑え、視覚的なインターフェースとモデル駆動型の開発を通じて迅速なアプリケーション開発を可能にする。",
    ),
    QuizItem(
      question: 'プログラミングの知識がなくても、視覚的なインターフェースを使用してアプリケーションを開発できるプラットフォームは何か？',
      ans: 'ノーコード',
      choices: ["ノーコード", "ローコード", "フルコード", "ハイコード"],
      comment:
          "ノーコードプラットフォームは、プログラミングの知識がないユーザーでも、ドラッグアンドドロップなどの視覚的なインターフェースを使用してアプリケーションを開発できる。",
    ),
    QuizItem(
      question: '異なるソフトウェアやサービス間でデータをやり取りするための仕様やプロトコルは何か？',
      ans: 'API',
      choices: ["API", "SDK", "IDE", "HTTP"],
      comment:
          "API（Application Programming Interface）は、異なるソフトウェアやサービス間で機能を共有し、データのやり取りを行うための仕様やプロトコル。",
    ),
    QuizItem(
      question: 'ウェブページの構造を記述するために使用されるマークアップ言語は何か？',
      ans: 'HTML',
      choices: ["HTML", "CSS", "JavaScript", "XML"],
      comment:
          "HTML（HyperText Markup Language）は、ウェブページの構造を記述するために使用される標準的なマークアップ言語。",
    ),
    QuizItem(
      question: 'データの構造を記述するために使用され、設定ファイルやデータの交換に用いられるマークアップ言語は何か？',
      ans: 'XML',
      choices: ["XML", "HTML", "JSON", "YAML"],
      comment:
          "XML（eXtensible Markup Language）は、データの構造を記述するために用いられ、設定ファイルやデータ交換のフォーマットとして広く使用される。",
    ),
    QuizItem(
      question: 'ドキュメントの構造とスタイルを定義するための標準的な規格のセットは何か？',
      ans: 'SGML',
      choices: ["SGML", "HTML", "XML", "JSON"],
      comment:
          "SGML（Standard Generalized Markup Language）は、ドキュメントの構造とスタイルを定義するための標準的な規格のセット。",
    ),
    QuizItem(
      question: 'ウェブでデータをやり取りする際に使用される軽量なデータ交換フォーマットは何か？',
      ans: 'JSON',
      choices: ["JSON", "XML", "HTML", "CSV"],
      comment:
          "JSON（JavaScript Object Notation）は、ウェブでデータをやり取りする際に使用される軽量なデータ交換フォーマット。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 51 + 3000);
  });
}
