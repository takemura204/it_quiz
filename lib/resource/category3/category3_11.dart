import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_11 {
  final quizItems = [
    QuizItem(
      word: 'ルートディレクトリ',
      question: 'PCでファイルやディレクトリを階層的に管理するとき，最上位の階層に当たるディレクトリは何か？',
      ans: 'ルートディレクトリ',
      choices: ["ルートディレクトリ", "ホームディレクトリ", "カレントディレクトリ", "システムディレクトリ"],
      comment: "ルートディレクトリは、PCでファイルやディレクトリを階層的に管理するとき，最上位の階層に当たるディレクトリ。",
      source: '平成23年特別 問83',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'カレントディレクトリ',
      question: 'カレントディレクトリの説明について正しいものはどれか。',
      ans: '現在作業を行っているディレクトリを意味する。',
      choices: [
        "階層の最上位にあるディレクトリを意味する。",
        "階層の最上位のディレクトリを基点として，目的のファイルやディレクトリまで，全ての経路をディレクトリ構造に従って示す。",
        "現在作業を行っているディレクトリを意味する。",
        "現在作業を行っているディレクトリを基点として，目的のファイルやディレクトリまで，全ての経路をディレクトリ構造に従って示す。"
      ],
      comment: "カレントディレクトリは、ユーザーが現在作業しているディレクトリのことで、コマンドの実行やファイル操作の基準となるディレクトリ。",
      source: '平成23年秋期 問74',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'ファイル拡張子',
      question: 'ファイル名の後に付けられ、ファイルの種類や用途を示すために使用される短い文字列は何か？',
      ans: 'ファイル拡張子',
      choices: ["ファイル拡張子", "メタデータ", "ファイル属性", "ファイル識別子"],
      comment: "ファイル拡張子は、ファイル名の後にピリオドで区切って付けられ、ファイルの種類や用途を示すために使用される短い文字列。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'フラグメンテーション',
      question: 'ハードディスクなどの記憶媒体上で、ファイルが連続した領域に保存されずに断片化してしまう現象は何か？',
      ans: 'フラグメンテーション',
      choices: ["フラグメンテーション", "セグメンテーション", "デフラグメンテーション", "アロケーション"],
      comment: "フラグメンテーションは、ハードディスクなどの記憶媒体上で、ファイルが連続した領域に保存されずに断片化してしまう現象。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'アーカイブ',
      question: '複数のファイルやフォルダを一つのファイルにまとめ、圧縮することなく格納する行為やそのファイルは何と呼ばれるか？',
      ans: 'アーカイブ',
      choices: ["アーカイブ", "コンパイル", "パッケージ", "バックアップ"],
      comment: "アーカイブは、複数のファイルやフォルダを一つのファイルにまとめて格納する行為や、そのようにして作成されたファイルのこと。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'クリップアート',
      question: 'ワープロソフト，プレゼンテーションソフトで作成した文書やWebページに貼り付けて，表現力を向上させる画像データのことを何と呼ぶか。',
      ans: 'クリップアート',
      choices: ["CSS", "キャプチャ", "クリップアート", "テンプレート"],
      comment: "クリップアートは、視覚的な表現効果を高めるために、ワープロ文書や表計算ワークシートなどに貼り付けられる挿絵・イラストのこと。",
      source: '平成26年春期 問70',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ピボットデータ表',
      question: '大量のデータを集約し、様々な角度から分析や要約を行うことができるデータ表は何と呼ばれるか？',
      ans: 'ピボットデータ表',
      choices: ["ピボットデータ表", "スプレッドシート", "データウェアハウス", "データマート"],
      comment: "ピボットデータ表は、大量のデータを集約し、様々な角度からデータを分析や要約を行うことができるインタラクティブなデータ表。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'OSS(Open Source Software)',
      question: 'OSS (Open Source Software) の利用に関する記述のうち，適切なものはどれか。',
      ans: '公開されているOSSを改良した派生ソフトウェアをOSSとして公開できる。',
      choices: [
        "OSSの利用者は，開発者にソフトウェアの対価を支払う義務を負う。",
        "OSSの利用者は，そのOSSを販売したり，無料配布したりすることはできない。",
        "OSSを遺伝子研究分野で利用することはできない。",
        "公開されているOSSを改良した派生ソフトウェアをOSSとして公開できる。"
      ],
      comment:
          "OSS(Open Source Software)とは、Linuxに代表されるソースコードを無償公開して、誰もが改良や再頒布を行えるようにした形態，またはそれにより開発されたソフトウェアのこと。",
      source: '平成23年秋期 問66',
      importance: ImportanceType.high,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 1101);
  });
}
