import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_5 {
  final quizItems = [
    QuizItem(
      question: '手続き型プログラミング言語で、オペレーティングシステムや組み込みシステムの開発に広く用いられる言語は何か？',
      ans: 'C',
      choices: ["C", "Java", "Python", "JavaScript"],
      comment: "C言語は、手続き型のプログラミング言語で、オペレーティングシステムや組み込みシステムの開発に広く用いられている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '数値計算や科学技術計算に適しており、高性能コンピューティング分野で広く用いられるプログラミング言語は何か？',
      ans: 'Fortran',
      choices: ["Fortran", "C", "R", "Python"],
      comment: "Fortranは、数値計算や科学技術計算に強みを持つプログラミング言語で、高性能コンピューティング分野で広く使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question:
          'オブジェクト指向プログラミングをサポートし、ウェブアプリケーションからエンタープライズシステムまで幅広く使用される言語は何か？',
      ans: 'Java',
      choices: ["Java", "C++", "Python", "C#"],
      comment:
          "Javaは、オブジェクト指向プログラミングをサポートする言語で、ウェブアプリケーションからエンタープライズシステムまで幅広い用途に使用されている。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'C言語をベースにオブジェクト指向機能を拡張したプログラミング言語は何か？',
      ans: 'C++',
      choices: ["C++", "Java", "C#", "Python"],
      comment:
          "C++は、C言語をベースにオブジェクト指向機能を拡張したプログラミング言語で、システム開発やゲーム開発など幅広い分野で使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '読みやすく、初心者にも扱いやすいことで人気の高い汎用プログラミング言語は何か？',
      ans: 'Python',
      choices: ["Python", "JavaScript", "Ruby", "PHP"],
      comment:
          "Pythonは、その読みやすさと初心者の学習に適した構文で知られる汎用プログラミング言語で、ウェブ開発からデータサイエンスまで幅広く用いられている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブページの動的処理を担うクライアントサイドスクリプト言語は何か？',
      ans: 'JavaScript',
      choices: ["JavaScript", "HTML", "CSS", "Python"],
      comment:
          "JavaScriptは、ウェブページに動的な要素を加えるためのクライアントサイドスクリプト言語で、現代のウェブ開発に欠かせない技術の一つ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '統計分析やデータ分析に適しており、データサイエンス分野で広く使用されるプログラミング言語は何か？',
      ans: 'R',
      choices: ["R", "Python", "Julia", "Matlab"],
      comment: "R言語は、統計分析やデータ分析に特化したプログラミング言語で、データサイエンス分野で広く使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データベース管理のための標準的な言語で、データの操作やクエリの実行に用いられる言語は何か？',
      ans: 'SQL',
      choices: ["SQL", "NoSQL", "XML", "JSON"],
      comment:
          "SQL（Structured Query Language）は、リレーショナルデータベース管理のための標準的な言語で、データの操作やクエリの実行に広く用いられている。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: 'ウェブサーバー上で動的なコンテンツを生成するために使用されるスクリプト言語は何か？',
      ans: 'PHP',
      choices: ["PHP", "JavaScript", "Python", "Ruby"],
      comment: "PHPは、ウェブサーバー上で動的なコンテンツを生成するために用いられるサーバーサイドのスクリプト言語。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: '開発者が複雑なコードを書かずにアプリケーションを迅速に開発できるプラットフォームは何か？',
      ans: 'ローコード',
      choices: ["ローコード", "ノーコード", "フルコード", "ハイコード"],
      comment:
          "ローコードプラットフォームは、複雑なコーディングを最小限に抑え、視覚的なインターフェースとモデル駆動型の開発を通じて迅速なアプリケーション開発を可能にする。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'プログラミングの知識がなくても、視覚的なインターフェースを使用してアプリケーションを開発できるプラットフォームは何か？',
      ans: 'ノーコード',
      choices: ["ノーコード", "ローコード", "フルコード", "ハイコード"],
      comment:
          "ノーコードプラットフォームは、プログラミングの知識がないユーザーでも、ドラッグアンドドロップなどの視覚的なインターフェースを使用してアプリケーションを開発できる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '異なるソフトウェアやサービス間でデータをやり取りするための仕様やプロトコルは何か？',
      ans: 'API',
      choices: ["API", "SDK", "IDE", "HTTP"],
      comment:
          "API（Application Programming Interface）は、異なるソフトウェアやサービス間で機能を共有し、データのやり取りを行うための仕様やプロトコル。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブページの構造を記述するために使用されるマークアップ言語は何か？',
      ans: 'HTML',
      choices: ["HTML", "CSS", "JavaScript", "XML"],
      comment:
          "HTML（HyperText Markup Language）は、ウェブページの構造を記述するために使用される標準的なマークアップ言語。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'データの構造を記述するために使用され、設定ファイルやデータの交換に用いられるマークアップ言語は何か？',
      ans: 'XML',
      choices: ["XML", "HTML", "JSON", "YAML"],
      comment:
          "XML（eXtensible Markup Language）は、データの構造を記述するために用いられ、設定ファイルやデータ交換のフォーマットとして広く使用される。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ドキュメントの構造とスタイルを定義するための標準的な規格のセットは何か？',
      ans: 'SGML',
      choices: ["SGML", "HTML", "XML", "JSON"],
      comment:
          "SGML（Standard Generalized Markup Language）は、ドキュメントの構造とスタイルを定義するための標準的な規格のセット。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブでデータをやり取りする際に使用される軽量なデータ交換フォーマットは何か？',
      ans: 'JSON',
      choices: ["JSON", "XML", "HTML", "CSV"],
      comment:
          "JSON（JavaScript Object Notation）は、ウェブでデータをやり取りする際に使用される軽量なデータ交換フォーマット。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 501);
  });
}
