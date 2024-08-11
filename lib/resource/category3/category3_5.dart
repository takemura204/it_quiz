import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_5 {
  final quizItems = [
    QuizItem(
      word: 'C',
      question: '手続き型プログラミング言語で、オペレーティングシステムや組み込みシステムの開発に広く用いられる言語は何か？',
      ans: 'C',
      choices: ["C", "Java", "Python", "JavaScript"],
      comment: "C言語は、手続き型のプログラミング言語で、オペレーティングシステムや組み込みシステムの開発に広く用いられている。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'Fortran',
      question: '数値計算や科学技術計算に適しており、高性能コンピューティング分野で広く用いられるプログラミング言語は何か？',
      ans: 'Fortran',
      choices: ["Fortran", "C", "R", "Python"],
      comment: "Fortranは、数値計算や科学技術計算に強みを持つプログラミング言語で、高性能コンピューティング分野で広く使用されている。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'Java',
      question: 'Java言語に関する記述として，適切なものはどれか。',
      ans: 'コンピュータの機種やOSに依存しないソフトウェアが開発できる，オブジェクト指向型の言語である。',
      choices: [
        "Webページを記述するためのマークアップ言語である。",
        "科学技術計算向けに開発された言語である。",
        "コンピュータの機種やOSに依存しないソフトウェアが開発できる，オブジェクト指向型の言語である。",
        "事務処理計算向けに開発された言語である。"
      ],
      comment:
          "Javaは、オブジェクト指向プログラミングをサポートする言語で、コンピュータの機種やOSに依存しないソフトウェアが開発でき、ウェブアプリケーションからエンタープライズシステムまで幅広い用途に使用されている。",
      source: '平成22年秋期 問54',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'C++',
      question: 'C言語をベースにオブジェクト指向機能を拡張したプログラミング言語は何か？',
      ans: 'C++',
      choices: ["C++", "Java", "C#", "Python"],
      comment: "C++は、C言語をベースにオブジェクト指向機能を拡張したプログラミング言語で、システム開発やゲーム開発など幅広い分野で使用されている。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'Python',
      question: '読みやすく、初心者にも扱いやすいことで人気の高い汎用プログラミング言語は何か？',
      ans: 'Python',
      choices: ["Python", "JavaScript", "Ruby", "PHP"],
      comment: "Pythonは、その読みやすさと初心者の学習に適した構文で知られる汎用プログラミング言語で、ウェブ開発からデータサイエンスまで幅広く用いられている。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'JavaScript',
      question: 'ウェブページの動的処理を担うクライアントサイドスクリプト言語は何か？',
      ans: 'JavaScript',
      choices: ["JavaScript", "HTML", "CSS", "Python"],
      comment: "JavaScriptは、ウェブページに動的な要素を加えるためのクライアントサイドスクリプト言語で、現代のウェブ開発に欠かせない技術の一つ。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'R',
      question: '統計分析やデータ分析に適しており、データサイエンス分野で広く使用されるプログラミング言語は何か？',
      ans: 'R',
      choices: ["R", "Python", "Julia", "Matlab"],
      comment: "R言語は、統計分析やデータ分析に特化したプログラミング言語で、データサイエンス分野で広く使用されている。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'SQL',
      question: 'データベース管理のための標準的な言語で、データの操作やクエリの実行に用いられる言語は何か？',
      ans: 'SQL',
      choices: ["SQL", "NoSQL", "XML", "JSON"],
      comment:
          "SQL（Structured Query Language）は、リレーショナルデータベース管理のための標準的な言語で、データの操作やクエリの実行に広く用いられている。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'PHP',
      question: 'ウェブサーバー上で動的なコンテンツを生成するために使用されるスクリプト言語は何か？',
      ans: 'PHP',
      choices: ["PHP", "JavaScript", "Python", "Ruby"],
      comment: "PHPは、ウェブサーバー上で動的なコンテンツを生成するために用いられるサーバーサイドのスクリプト言語。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'ローコード',
      question: '開発者が複雑なコードを書かずにアプリケーションを迅速に開発できるプラットフォームは何か？',
      ans: 'ローコード',
      choices: ["ローコード", "ノーコード", "フルコード", "ハイコード"],
      comment: "ローコードプラットフォームは、複雑なコーディングを最小限に抑え、視覚的なインターフェースとモデル駆動型の開発を通じて迅速なアプリケーション開発を可能にする。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ノーコード',
      question: 'プログラミングの知識がなくても、視覚的なインターフェースを使用してアプリケーションを開発できるプラットフォームは何か？',
      ans: 'ノーコード',
      choices: ["ノーコード", "ローコード", "フルコード", "ハイコード"],
      comment: "ノーコードプラットフォームは、プログラミングの知識がないユーザーでも、ドラッグアンドドロップなどの視覚的なインターフェースを使用してアプリケーションを開発できる。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'API',
      question: '異なるソフトウェアやサービス間でデータをやり取りするための仕様やプロトコルは何か？',
      ans: 'API',
      choices: ["API", "SDK", "IDE", "HTTP"],
      comment:
          "API（Application Programming Interface）は、異なるソフトウェアやサービス間で機能を共有し、データのやり取りを行うための仕様やプロトコル。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'HTML(HyperText Markup Language)',
      question: 'HTMLを使用して作成できるものはどれか。',
      ans: 'Webページ',
      choices: ["Webブラウザ", "Webページ", "音声ファイル", "動画ファイル"],
      comment: "HTML(HyperText Markup Language)は、Webページを記述するために、タグを使って文書構造を表現するマークアップ言語。",
      source: '平成24年秋期 問59',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'XML(eXtensible Markup Language)',
      question: '文書の構造などに関する指定を記述する，"<" と ">"に囲まれるタグを，利用者が目的に応じて定義して使うことができる言語はどれか。',
      ans: 'XML',
      choices: ["COBOL", "HTML", "Java", "XML"],
      comment:
          "XML(eXtensible Markup Language)は、ユーザーが定義したタグを用いて文書構造を記述するマークアップ言語で、新しくタグを定義・使用することが可能。",
      source: '平成22年秋期 問56',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'SGML（Standard Generalized Markup Language）',
      question: 'ドキュメントの構造とスタイルを定義するための標準的な規格のセットは何か？',
      ans: 'SGML',
      choices: ["SGML", "HTML", "XML", "JSON"],
      comment: "SGML（Standard Generalized Markup Language）は、ドキュメントの構造とスタイルを定義するための標準的な規格のセット。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'JSON（JavaScript Object Notation）',
      question: 'ウェブでデータをやり取りする際に使用される軽量なデータ交換フォーマットは何か？',
      ans: 'JSON',
      choices: ["JSON", "XML", "HTML", "CSV"],
      comment: "JSON（JavaScript Object Notation）は、ウェブでデータをやり取りする際に使用される軽量なデータ交換フォーマット。",
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 501);
  });
}
