import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_21 {
  final quizItems = [
    QuizItem(
      question: 'インターネット上のデバイスを一意に識別するために使用される数値のラベルは何か？',
      ans: 'IPアドレス',
      choices: ["IPアドレス", "サブネットマスク", "IPv6", "DNS"],
      comment:
          "IPアドレス（Internet Protocol Address）は、インターネット上のデバイスを一意に識別するために使用される数値のラベル。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'IPアドレスのネットワーク部分とホスト部分を区別するために使用される数値は何か？',
      ans: 'サブネットマスク',
      choices: ["サブネットマスク", "IPアドレス", "IPv6", "DNS"],
      comment: "サブネットマスクは、IPアドレスのネットワーク部分とホスト部分を区別するために使用される数値。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'より多くのデバイスをインターネットに接続するために設計された新しいIPアドレス体系は何か？',
      ans: 'IPv6',
      choices: ["IPv6", "IPアドレス", "サブネットマスク", "DNS"],
      comment:
          "IPv6（Internet Protocol version 6）は、より多くのデバイスをインターネットに接続するために設計された新しいIPアドレス体系。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ドメイン名をIPアドレスに変換するためのシステムは何か？',
      ans: 'DNS',
      choices: ["DNS", "IPv6", "IPアドレス", "サブネットマスク"],
      comment: "DNS（Domain Name System）は、ドメイン名をIPアドレスに変換するためのシステム。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'インターネット上のリソースを特定するために使用されるアドレスは何か？',
      ans: 'URL',
      choices: ["URL", "DNS", "IPv6", "IPアドレス"],
      comment: "URL（Uniform Resource Locator）は、インターネット上のリソースを特定するために使用されるアドレス。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '同じメッセージを複数の受信者に送信する電子メールの形式は何か？',
      ans: '同報メール',
      choices: ["同報メール", "メーリングリスト", "cc", "bcc"],
      comment: "同報メールは、同じメッセージを複数の受信者に送信する電子メールの形式。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特定のトピックに関心がある人々のグループにメールを配布するために使用されるシステムは何か？',
      ans: 'メーリングリスト',
      choices: ["メーリングリスト", "同報メール", "cc", "bcc"],
      comment: "メーリングリストは、特定のトピックに関心がある人々のグループにメールを配布するために使用されるシステム。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '電子メールで、メッセージのコピーを受信者に送ることを示す略語は何か？',
      ans: 'cc',
      choices: ["cc", "bcc", "同報メール", "メーリングリスト"],
      comment: "cc（carbon copy）は、電子メールで、メッセージのコピーを受信者に送ることを示す略語。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '電子メールで、他の受信者には見えない形でメッセージのコピーを送ることを示す略語は何か？',
      ans: 'bcc',
      choices: ["bcc", "cc", "同報メール", "メーリングリスト"],
      comment:
          "bcc（blind carbon copy）は、電子メールで、他の受信者には見えない形でメッセージのコピーを送ることを示す略語。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ウェブサイトがユーザーのブラウザに保存する小さなデータファイルは何か？',
      ans: 'cookie',
      choices: ["cookie", "CGI", "CMS", "MIME"],
      comment:
          "cookieは、ウェブサイトがユーザーのブラウザに保存する小さなデータファイルで、ユーザーの設定やログイン情報などを記憶するために使用される。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ウェブサーバーが動的なコンテンツを生成するために使用するプログラムやスクリプトは何か？',
      ans: 'CGI',
      choices: ["CGI", "cookie", "CMS", "MIME"],
      comment:
          "CGI（Common Gateway Interface）は、ウェブサーバーが動的なコンテンツを生成するために使用するプログラムやスクリプト。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブサイトのコンテンツを効率的に管理・公開するためのソフトウェアシステムは何か？',
      ans: 'CMS',
      choices: ["CMS", "CGI", "cookie", "MIME"],
      comment:
          "CMS（Content Management System）は、ウェブサイトのコンテンツを効率的に管理・公開するためのソフトウェアシステム。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: '電子メールで、異なる種類のデータ（テキスト、画像、音声など）を扱うための規格は何か？',
      ans: 'MIME',
      choices: ["MIME", "CMS", "CGI", "cookie"],
      comment:
          "MIME（Multipurpose Internet Mail Extensions）は、電子メールで、異なる種類のデータ（テキスト、画像、音声など）を扱うための規格。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ウェブフィードを使用して、ウェブサイトの更新情報を自動的に配信するためのフォーマットは何か？',
      ans: 'RSS',
      choices: ["RSS", "MIME", "CMS", "CGI"],
      comment:
          "RSS（Really Simple Syndication）は、ウェブフィードを使用して、ウェブサイトの更新情報を自動的に配信するためのフォーマット。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'インターネット上でファイルを保存し、アクセスするためのサービスは何か？',
      ans: 'オンラインストレージ',
      choices: ["オンラインストレージ", "クローラ", "MVNO", "ISP"],
      comment: "オンラインストレージは、インターネット上でファイルを保存し、どこからでもアクセスするためのサービス。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ウェブページを自動的に巡回し、情報を収集するプログラムは何か？',
      ans: 'クローラ',
      choices: ["クローラ", "オンラインストレージ", "RSS", "MIME"],
      comment: "クローラ（またはスパイダー、ボット）は、ウェブページを自動的に巡回し、情報を収集するプログラム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '自社の通信設備を持たずに、大手キャリアのネットワークを借りてサービスを提供する通信事業者は何か？',
      ans: 'MVNO',
      choices: ["MVNO", "ISP", "クローラ", "オンラインストレージ"],
      comment:
          "MVNO（Mobile Virtual Network Operator）は、自社の通信設備を持たずに、大手キャリアのネットワークを借りてサービスを提供する通信事業者。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'インターネット接続サービスを提供する事業者は何か？',
      ans: 'ISP',
      choices: ["ISP", "MVNO", "クローラ", "オンラインストレージ"],
      comment: "ISP（Internet Service Provider）は、インターネット接続サービスを提供する事業者。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'インターネットプロトコルを利用して音声通信を行うサービスは何か？',
      ans: 'IP電話',
      choices: ["IP電話", "ISP", "MVNO", "クローラ"],
      comment: "IP電話（Internet Protocol Phone）は、インターネットプロトコルを利用して音声通信を行うサービス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '移動中のモバイルデバイスが異なるネットワーク間で通信を維持するプロセスは何か？',
      ans: 'ハンドオーバ',
      choices: ["ハンドオーバ", "ローミング", "MIMO", "キャリアアグリゲーション"],
      comment: "ハンドオーバ（またはハンドオフ）は、移動中のモバイルデバイスが異なるネットワーク間で通信を維持するためのプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ユーザーが移動しても異なるネットワークエリアで通信サービスを継続できる機能は何か？',
      ans: 'ローミング',
      choices: ["ローミング", "ハンドオーバ", "MIMO", "キャリアアグリゲーション"],
      comment: "ローミングは、ユーザーが移動しても異なるネットワークエリアで通信サービスを継続できる機能。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数の送受信アンテナを用いてデータ伝送の効率を向上させる技術は何か？',
      ans: 'MIMO',
      choices: ["MIMO", "ローミング", "ハンドオーバ", "キャリアアグリゲーション"],
      comment:
          "MIMO（Multiple Input Multiple Output）は、複数の送受信アンテナを用いてデータ伝送の効率を向上させる技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数のキャリア周波数を組み合わせて通信速度を向上させる技術は何か？',
      ans: 'キャリアアグリゲーション',
      choices: ["キャリアアグリゲーション", "MIMO", "ローミング", "ハンドオーバ"],
      comment: "キャリアアグリゲーションは、複数のキャリア周波数を組み合わせて通信速度を向上させる技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'モバイルデバイスを無線LANルーターのように機能させ、他のデバイスにインターネット接続を共有する機能は何か？',
      ans: 'テザリング',
      choices: ["テザリング", "SIMカード", "eSIM", "テレマティクス"],
      comment: "テザリングは、モバイルデバイスを無線LANルーターのように機能させ、他のデバイスにインターネット接続を共有する機能。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'モバイルデバイスがモバイルネットワークに接続するために使用される物理的なカードは何か？',
      ans: 'SIMカード',
      choices: ["SIMカード", "eSIM", "テザリング", "MIMO"],
      comment:
          "SIMカード（Subscriber Identity Module Card）は、モバイルデバイスがモバイルネットワークに接続するために使用される物理的なカード。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '物理的なカードではなく、デバイス内部に組み込まれたデジタルSIMのことを何というか？',
      ans: 'eSIM',
      choices: ["eSIM", "SIMカード", "テザリング", "MIMO"],
      comment: "eSIM（embedded SIM）は、物理的なカードではなく、デバイス内部に組み込まれたデジタルSIMのこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '自動車などの車両に搭載された通信機器を用いてサービスを提供する技術は何か？',
      ans: 'テレマティクス',
      choices: ["テレマティクス", "eSIM", "SIMカード", "テザリング"],
      comment:
          "テレマティクスは、自動車などの車両に搭載された通信機器を用いて、ナビゲーション、緊急通報、車両診断などのサービスを提供する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '電話線を使用して高速インターネット接続を提供する技術は何か？',
      ans: 'ADSL',
      choices: ["ADSL", "FTTH", "LTE", "5G"],
      comment:
          "ADSL（Asymmetric Digital Subscriber Line）は、電話線を使用して高速インターネット接続を提供する技術で、上りと下りの速度が非対称である。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '光ファイバーを利用して家庭やオフィスまで直接高速インターネット接続を提供する技術は何か？',
      ans: 'FTTH',
      choices: ["FTTH", "ADSL", "LTE", "5G"],
      comment:
          "FTTH（Fiber To The Home）は、光ファイバーを利用して家庭やオフィスまで直接高速インターネット接続を提供する技術。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 2101);
  });
}
