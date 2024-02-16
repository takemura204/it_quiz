import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_5 {
  final quizItems = [
    QuizItem(
      question: '手続き型プログラミング言語で、オペレーティングシステムや組み込みシステムの開発に広く用いられる言語は何か？',
      ans: 'C',
      choices: ["C", "Java", "Python", "JavaScript"],
      comment: "C言語は、手続き型のプログラミング言語で、オペレーティングシステムや組み込みシステムの開発に広く用いられている。",
    ),
    QuizItem(
      question: '数値計算や科学技術計算に適しており、高性能コンピューティング分野で広く用いられるプログラミング言語は何か？',
      ans: 'Fortran',
      choices: ["Fortran", "C", "R", "Python"],
      comment: "Fortranは、数値計算や科学技術計算に強みを持つプログラミング言語で、高性能コンピューティング分野で広く使用されている。",
    ),
    QuizItem(
      question:
          'オブジェクト指向プログラミングをサポートし、ウェブアプリケーションからエンタープライズシステムまで幅広く使用される言語は何か？',
      ans: 'Java',
      choices: ["Java", "C++", "Python", "C#"],
      comment:
          "Javaは、オブジェクト指向プログラミングをサポートする言語で、ウェブアプリケーションからエンタープライズシステムまで幅広い用途に使用されている。",
    ),
    QuizItem(
      question: 'C言語をベースにオブジェクト指向機能を拡張したプログラミング言語は何か？',
      ans: 'C++',
      choices: ["C++", "Java", "C#", "Python"],
      comment:
          "C++は、C言語をベースにオブジェクト指向機能を拡張したプログラミング言語で、システム開発やゲーム開発など幅広い分野で使用されている。",
    ),
    QuizItem(
      question: '読みやすく、初心者にも扱いやすいことで人気の高い汎用プログラミング言語は何か？',
      ans: 'Python',
      choices: ["Python", "JavaScript", "Ruby", "PHP"],
      comment:
          "Pythonは、その読みやすさと初心者の学習に適した構文で知られる汎用プログラミング言語で、ウェブ開発からデータサイエンスまで幅広く用いられている。",
    ),
    QuizItem(
      question: 'ウェブページの動的処理を担うクライアントサイドスクリプト言語は何か？',
      ans: 'JavaScript',
      choices: ["JavaScript", "HTML", "CSS", "Python"],
      comment:
          "JavaScriptは、ウェブページに動的な要素を加えるためのクライアントサイドスクリプト言語で、現代のウェブ開発に欠かせない技術の一つ。",
    ),
    QuizItem(
      question: '統計分析やデータ分析に適しており、データサイエンス分野で広く使用されるプログラミング言語は何か？',
      ans: 'R',
      choices: ["R", "Python", "Julia", "Matlab"],
      comment: "R言語は、統計分析やデータ分析に特化したプログラミング言語で、データサイエンス分野で広く使用されている。",
    ),
    QuizItem(
      question: 'データベース管理のための標準的な言語で、データの操作やクエリの実行に用いられる言語は何か？',
      ans: 'SQL',
      choices: ["SQL", "NoSQL", "XML", "JSON"],
      comment:
          "SQL（Structured Query Language）は、リレーショナルデータベース管理のための標準的な言語で、データの操作やクエリの実行に広く用いられている。",
    ),
    QuizItem(
      question: 'ウェブサーバー上で動的なコンテンツを生成するために使用されるスクリプト言語は何か？',
      ans: 'PHP',
      choices: ["PHP", "JavaScript", "Python", "Ruby"],
      comment: "PHPは、ウェブサーバー上で動的なコンテンツを生成するために用いられるサーバーサイドのスクリプト言語。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 41 + 3000);
  });
}
