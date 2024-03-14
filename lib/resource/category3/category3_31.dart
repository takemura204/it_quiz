import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_31 {
  final quizItems = [
    QuizItem(
      question: 'ウェブサイトがユーザーのブラウザに保存する小さなデータファイルは何か？',
      ans: 'cookie',
      choices: ["cookie", "CGI", "CMS", "MIME"],
      comment:
          "cookieは、ウェブサイトがユーザーのブラウザに保存する小さなデータファイルで、ユーザーの設定やログイン情報などを記憶するために使用される。",
    ),
    QuizItem(
      question: 'ウェブサーバーが動的なコンテンツを生成するために使用するプログラムやスクリプトは何か？',
      ans: 'CGI',
      choices: ["CGI", "cookie", "CMS", "MIME"],
      comment:
          "CGI（Common Gateway Interface）は、ウェブサーバーが動的なコンテンツを生成するために使用するプログラムやスクリプト。",
    ),
    QuizItem(
      question: 'ウェブサイトのコンテンツを効率的に管理・公開するためのソフトウェアシステムは何か？',
      ans: 'CMS',
      choices: ["CMS", "CGI", "cookie", "MIME"],
      comment:
          "CMS（Content Management System）は、ウェブサイトのコンテンツを効率的に管理・公開するためのソフトウェアシステム。",
    ),
    QuizItem(
      question: '電子メールで、異なる種類のデータ（テキスト、画像、音声など）を扱うための規格は何か？',
      ans: 'MIME',
      choices: ["MIME", "CMS", "CGI", "cookie"],
      comment:
          "MIME（Multipurpose Internet Mail Extensions）は、電子メールで、異なる種類のデータ（テキスト、画像、音声など）を扱うための規格。",
    ),
    QuizItem(
      question: 'ウェブフィードを使用して、ウェブサイトの更新情報を自動的に配信するためのフォーマットは何か？',
      ans: 'RSS',
      choices: ["RSS", "MIME", "CMS", "CGI"],
      comment:
          "RSS（Really Simple Syndication）は、ウェブフィードを使用して、ウェブサイトの更新情報を自動的に配信するためのフォーマット。",
    ),
    QuizItem(
      question: 'インターネット上でファイルを保存し、アクセスするためのサービスは何か？',
      ans: 'オンラインストレージ',
      choices: ["オンラインストレージ", "クローラ", "MVNO", "ISP"],
      comment: "オンラインストレージは、インターネット上でファイルを保存し、どこからでもアクセスするためのサービス。",
    ),
    QuizItem(
      question: 'ウェブページを自動的に巡回し、情報を収集するプログラムは何か？',
      ans: 'クローラ',
      choices: ["クローラ", "オンラインストレージ", "RSS", "MIME"],
      comment: "クローラ（またはスパイダー、ボット）は、ウェブページを自動的に巡回し、情報を収集するプログラム。",
    ),
    QuizItem(
      question: '自社の通信設備を持たずに、大手キャリアのネットワークを借りてサービスを提供する通信事業者は何か？',
      ans: 'MVNO',
      choices: ["MVNO", "ISP", "クローラ", "オンラインストレージ"],
      comment:
          "MVNO（Mobile Virtual Network Operator）は、自社の通信設備を持たずに、大手キャリアのネットワークを借りてサービスを提供する通信事業者。",
    ),
    QuizItem(
      question: 'インターネット接続サービスを提供する事業者は何か？',
      ans: 'ISP',
      choices: ["ISP", "MVNO", "クローラ", "オンラインストレージ"],
      comment: "ISP（Internet Service Provider）は、インターネット接続サービスを提供する事業者。",
    ),
    QuizItem(
      question: 'インターネットプロトコルを利用して音声通信を行うサービスは何か？',
      ans: 'IP電話',
      choices: ["IP電話", "ISP", "MVNO", "クローラ"],
      comment: "IP電話（Internet Protocol Phone）は、インターネットプロトコルを利用して音声通信を行うサービス。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 301 + 3000);
  });
}
