import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category0_3_3 {
  final quizItems = [
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
      word: 'ルータ',
      question: 'ルータの説明として，適切なものはどれか。',
      ans: 'LANやWANを相互接続する機器で，受信データのIPアドレスを解析して適切なネットワークに転送する。',
      choices: [
        "LANと電話回線を相互接続する機器で，データの変調と復調を行う。",
        "LANの端末を相互接続する機器で，受信データのMACアドレスを解析して宛先の端末に転送する。",
        "LANの端末を相互接続する機器で，受信データを全ての端末に転送する。",
        "LANやWANを相互接続する機器で，受信データのIPアドレスを解析して適切なネットワークに転送する。"
      ],
      comment: "ルータは、異なるネットワーク間でデータパケットを転送し、最適な経路を選択するための装置。",
      source: '平成24年春期 問65',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'ESSID（Extended Service Set Identifier）',
      question: '無線LANの環境において，アクセスポイン卜と端末に設定するESSIDに関する記述として，適切なものはどれか。',
      ans: 'ESSID',
      choices: [
        "暗号通信の鍵になる文字列",
        "暗号方式の種類",
        "無線LANで使用する電波のチャネル番号",
        "無線LANのネットワークを識別する文字列"
      ],
      comment:
          "ESSID(Extended Service Set Identifier)は、無線LANの規格であるIEEE802.11シリーズにおいて「混信」を避けるためにアクセスポイントと端末に設定する識別子であるSSIDを、複数のアクセスポイントが設置されている状況に対応するため、ネットワーク識別子として拡張したもの。",
      source: '平成24年秋期 問64',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'HTTPS（HyperText Transfer Protocol Secure）',
      question: 'ホームページへのアクセスにHTTPSを利用する目的として，適切なものはどれか。',
      ans: 'サーバの認証とデータの暗号化によって通信のセキュリティを確保する。',
      choices: [
        "1回の接続で，イメージなどを含む1画面内の全データを効率的に受信する。",
        "サーバの認証とデータの暗号化によって通信のセキュリティを確保する。",
        "データを圧縮して通信時間を短縮する。",
        "動的なホームページを生成して通信する。"
      ],
      comment:
          "HTTPS(HTTP over SSL/TLS)は、SSLの技術を用いて個人情報の送信や電子決済などのWebのデータ通信を安全に行うためのもので、SSLでカプセル化することでサーバおよびクライアントの認証，通信経路の暗号化，セッション管理などの機能が加わり、盗聴やなりすましなどの脅威から通信データを保護をすることができる。",
      source: '平成24年春期 問80',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'IPv6（Internet Protocol version 6）',
      question: 'IPv6に関する記述として，適切なものはどれか。',
      ans: 'アドレス空間が128ビットの大きさをもつので，IPv4に比べて多くのアドレスを割り当てることができる。',
      choices: [
        "アドレス空間が128ビットの大きさをもつので，IPv4に比べて多くのアドレスを割り当てることができる。",
        "一つのLANでIPv6とIPv4を共存させることはできない。",
        "有線LAN専用のプロトコルなので，無線LANで利用することはできない。",
        "利用には通常のツイストペアケーブルではなく，光ファイバケーブルが必要である。"
      ],
      comment:
          "IPv6（Internet Protocol version 6）は、現在インターネットで主流であるIPv4の次期バージョンで、IPv4からの変更点で重要なのはアドレス空間の拡大で、128ビット化によって割り当て可能なアドレス数は事実上無限ともいえる340澗個に増加した。",
      source: '平成26年秋期 問52',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'cc',
      question: '電子メールの送信例のうち，受信者への配慮の観点から，最も適切なものはどれか。',
      ans: '特別企画のホームページのURLを特定の限られた顧客に知らせるために，アドレスをBccに入れて送信した。',
      choices: [
        "会員から抽出した100名のアドレスを一度にあて先(To)に入れて，会員満足度調査のアンケートを電子メールで送った。",
        "自社製品を紹介する大容量の資料を，圧縮せずに電子メールに添付して得意先に送った。",
        "製品の質問メールへの回答で，その内容を知ってもらいたい複数の顧客のアドレスをCcに入れて返信した。",
        "特別企画のホームページのURLを特定の限られた顧客に知らせるために，アドレスをBccに入れて送信した。"
      ],
      comment:
          "cc（carbon copy）は、電子メールにおける送信先指定方法の1つで、toで指定した送信先以外に、メールのコピーを送信しておきたい相手を指定する機能。この指定では、toの相手及びccで指定した相手に、あて先のすべてが公開される。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'bcc（blind carbon copy）',
      question: '電子メールの宛先入力欄におけるBccに関する記述として，適切なものはどれか。',
      ans: 'bcc',
      choices: [
        "Bccに指定した宛先には，自動的に暗号化された電子メールが送信される。",
        "Bccに指定した宛先には，本文を削除した件名だけの電子メールが送信される。",
        "Bccに指定した宛先のメールアドレスは，他の宛先には通知されない。",
        "Bccに指定した宛先は，配信エラーが発生したときの通知先になる。"
      ],
      comment:
          "bcc(Blind Carbon Copy)は、電子メールにおける送信先指定方法の1つで、toで指定した送信先以外に、メールのコピーを送信しておきたい相手を指定する機能のことで、指定した宛先のメールアドレスは，他の宛先には通知されない。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'cookie',
      question: 'Webで使用されるCookieに関する記述として，適切なものはどれか。',
      ans: 'アクセスしてきたブラウザに，Webサーバからの情報を一時的に保存する仕組みである。',
      choices: [
        "HTMLによる文章のレイアウトを，細かく指定できるフォーマット規格である。",
        "HTTPに暗号化の機能を追加したプロトコルである。",
        "Webサーバと外部のプログラムが連携し，動的にWebページを生成する仕組みである。",
        "アクセスしてきたブラウザに，Webサーバからの情報を一時的に保存する仕組みである。"
      ],
      comment:
          "cookieは、インターネットにアクセスしてきたクライアントに対してWebサーバ上からそのクライアントのパソコン上にデータを保存する仕組みで、データには期限が決められていて一定期間を過ぎると無効となる。",
      source: '平成22年春期 問59',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'RSS（Really Simple Syndication）',
      question: 'RSSの説明として，適切なものはどれか。',
      ans: 'RSS',
      choices: [
        "Webサイトの色調やデザインに統一性をもたせるための仕組みである。",
        "Webサイトの見出しや要約などを記述するフォーマットであり，Webサイトの更新情報の公開に使われる。",
        "Webページに小さな画像を埋め込み，利用者のアクセス動向の情報を収集するために用いられる仕組みである。",
        "年齢や文化，障害の有無にかかわらず，多くの人が快適に利用できるWeb環境を提供する設計思想である。"
      ],
      comment:
          "RSS（Really Simple Syndication）は、ブログなどのWebサイトで、効率の良い情報収集や情報発信を行うために用いられている文書フォーマットの総称で、ページの見出しや要約、更新時刻などの記事に関するメタデータを、XMLベースの構造化データとして記述する。",
      source: '平成25年秋期 問69',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'ADSL（Asymmetric Digital Subscriber Line）',
      question: 'ADSLにおいて，加入者宅と電話局間で利用する通信媒体はどれか。',
      ans: 'アナログ電話回線(メタル)',
      choices: ["アナログ電話回線(メタル)", "同軸ケーブル", "光ファイバ", "無線(電波)"],
      comment:
          "ADSL（Asymmetric Digital Subscriber Line）は、一般家庭に普及しているアナログ電話回線(メタル※)をそのまま利用し、それまでに使用されていなかった周波数帯域を利用することでデジタル通信を行う伝送方式。",
      source: '平成24年秋期 問69',
      importance: QuizImportanceType.high,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(
        quizId: index + I18n().category0_3Index + 301, isPremium: false);
  });
}