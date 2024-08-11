import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_21 {
  final quizItems = [
    QuizItem(
      word: 'IPアドレス',
      question: 'IPアドレスに関する記述のうち，適切なものはどれか。',
      ans: 'プライベートIPアドレスは，同一社内などのローカルなネットワーク内であれば自由に使ってよい。',
      choices: [
        "192.168.1.1のように4バイト表記のIPアドレスの数は，地球上の人口(約70億)よりも多い。",
        "IPアドレスは，各国の政府が管理している。",
        "IPアドレスは，国ごとに重複のないアドレスであればよい。",
        "プライベートIPアドレスは，同一社内などのローカルなネットワーク内であれば自由に使ってよい。"
      ],
      comment:
          "IPアドレスは、インターネットやLANなどのIPネットワークに接続されたコンピューターなどを識別するために割り振られる番号で、端末に設定されるIPアドレスは、プライベートIPアドレスとグローバルIPアドレスに分類される。",
      source: '平成21年秋期 問65',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'サブネットマスク',
      question: 'サブネットマスクの役割として，適切なものはどれか。',
      ans: 'IPアドレスに含まれるネットワークアドレスと，そのネットワークに属する個々のコンピユータのホストアドレスを区分する。',
      choices: [
        "IPアドレスからEthernet上のMACアドレスを割り出す。",
        "IPアドレスに含まれるネットワークアドレスと，そのネットワークに属する個々のコンピユータのホストアドレスを区分する。",
        "インターネットと内部ネットワークを中継するときのグローバルIPアドレスとプライベートIPアドレスを対応付ける。",
        "通信相手先のドメイン名とIPアドレスを対応付ける。"
      ],
      comment:
          "サブネットマスクは、IPアドレスをネットワークアドレスとホストアドレスに分割するために使用されるビット列で、ネットワークアドレス部分には'1'を、ホストアドレス部分には'0'を指定することによってIPアドレスを区分される。",
      source: '平成28年春期 問70',
      importance: ImportanceType.low,
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
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'DNS(Domain Name System)',
      question: 'DNSサーバの機能に関する記述として，適切なものはどれか。',
      ans: '問合せのあったホスト名のIPアドレスを回答する。',
      choices: [
        "同じLAN以外にあるコンピュータ宛てのパケットを中継する。",
        "外部ネットワークへのWebアクセスを中継する。",
        "問合せのあったIPアドレスに対応したMACアドレスを回答する。",
        "問合せのあったホスト名のIPアドレスを回答する。"
      ],
      comment:
          "DNS(Domain Name System)は、ドメイン名・ホスト名とIPアドレスを結びつけて変換する(名前解決する)仕組みで、IPアドレスと対応するドメイン名の関係を保持し、要求に応じて相互変換する機能をもつ。",
      source: '平成26年春期 問71平成26年春期 問71',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'URL(Uniform Resource Locator)',
      question: 'インターネット上にある情報の所在を表す記述方式で，"http://www.ipa.go.jp/"のような形式をもつものはどれか。',
      ans: 'URL',
      choices: ["HTML", "IPアドレス", "MACアドレス", "URL"],
      comment:
          "URL(Uniform Resource Locator)は、一般にWebサイトのアドレス(住所)のことです。通常では、通信に使用するスキーム名と、リソースの位置情報(サーバのホスト名(ドメイン)、ディレクトリ名、ファイル名)だけを指定しますが、用途に応じてポート番号やURLパラメータなどの項目も記述・指定できるようになっている。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '同報メール',
      question: '同じメッセージを複数の受信者に送信する電子メールの形式は何か？',
      ans: '同報メール',
      choices: ["同報メール", "メーリングリスト", "cc", "bcc"],
      comment: "同報メールは、同じメッセージを複数の受信者に送信する電子メールの形式。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'メーリングリスト',
      question: '特定のメールアドレスに電子メールを送ると，そのアドレスに対応して登録済みの複数のメールアドレスに同じ内容のメールを配信する仕組みはどれか。',
      ans: 'メーリングリスト',
      choices: ["Webメール", "チェーンメール", "メーリングリスト", "リプライメール"],
      comment:
          "メーリングリスト(Mailing List)は、電子メールを特定のアドレスに送信すると、リストに登録されているメンバー全員に同じ内容のメールが同時に転送される仕組みで、共通の趣味や目的を持つメンバー内において、情報を共有する目的で利用される。",
      source: '平成27年春期 問72',
      importance: ImportanceType.normal,
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
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'bcc(Blind Carbon Copy)',
      question: '電子メールの宛先入力欄におけるBccに関する記述として，適切なものはどれか。',
      ans: 'Bccに指定した宛先は，配信エラーが発生したときの通知先になる。',
      choices: [
        "Bccに指定した宛先には，自動的に暗号化された電子メールが送信される。",
        "Bccに指定した宛先には，本文を削除した件名だけの電子メールが送信される。",
        "Bccに指定した宛先のメールアドレスは，他の宛先には通知されない。",
        "Bccに指定した宛先は，配信エラーが発生したときの通知先になる。"
      ],
      comment:
          "bcc(Blind Carbon Copy)は、電子メールにおける送信先指定方法の1つで、toで指定した送信先以外に、メールのコピーを送信しておきたい相手を指定する機能のことで、指定した宛先のメールアドレスは，他の宛先には通知されない。",
      source: '平成22年秋期 問1',
      importance: ImportanceType.high,
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
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'CGI(Common Gateway Interface)',
      question: 'Webページの来訪者数カウンタなどのように，訪問者が訪れるごとに新たなページを生成する機能を実現できる仕組みはどれか。',
      ans: 'CGI',
      choices: ["CGI", "cookie", "HTML", "SQL"],
      comment:
          "CGI(Common Gateway Interface)は、ユーザーの入力した情報によって表示するWebページを変化させるなど、動的なWebページを作成するための仕組み。",
      source: '平成25年春期 問77',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'CMS（Content Management System）',
      question: 'ウェブサイトのコンテンツを効率的に管理・公開するためのソフトウェアシステムは何か？',
      ans: 'CMS',
      choices: ["CMS", "CGI", "cookie", "MIME"],
      comment: "CMS（Content Management System）は、ウェブサイトのコンテンツを効率的に管理・公開するためのソフトウェアシステム。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'MIME(Multipurpose Internet Mail Extensions)',
      question: '電子メールで使用されるMIME(Multipurpose Internet Mail Extensions)に関する記述として，適切なものはどれか。',
      ans: '画像ファイルなどの添付ファイルを電子メールで送る方法',
      choices: [
        "画像ファイルなどの添付ファイルを電子メールで送る方法",
        "公開鍵暗号方式を用いて，電子メールを暗号化する方法",
        "電子メールの本文をHTMLで記述することで，Webページのようなレイアウトやデザインを実現する方法",
        "メールサーバから利用者の端末に電子メールを転送する方法"
      ],
      comment:
          "MIME(Multipurpose Internet Mail Extensions)は、ASCII文字しか使用できないSMTPを利用したメールで、日本語などの2バイトコードや画像・動画・音声データを送信するための仕組み。",
      source: '平成22年春期 問58',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'RSS（Really Simple Syndication）',
      question: 'RSSの説明として，適切なものはどれか。',
      ans: 'Webサイトの見出しや要約などを記述するフォーマットであり，Webサイトの更新情報の公開に使われる。',
      choices: [
        "Webサイトの色調やデザインに統一性をもたせるための仕組みである。",
        "Webサイトの見出しや要約などを記述するフォーマットであり，Webサイトの更新情報の公開に使われる。",
        "Webページに小さな画像を埋め込み，利用者のアクセス動向の情報を収集するために用いられる仕組みである。",
        "年齢や文化，障害の有無にかかわらず，多くの人が快適に利用できるWeb環境を提供する設計思想である。"
      ],
      comment:
          "RSS（Really Simple Syndication）は、ブログなどのWebサイトで、効率の良い情報収集や情報発信を行うために用いられている文書フォーマットの総称で、ページの見出しや要約、更新時刻などの記事に関するメタデータを、XMLベースの構造化データとして記述する。",
      source: '平成25年秋期 問69',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'オンラインストレージ',
      question:
          'インターネットに接続されているサーバ上のディスクスペースを，ファイル保管用に貸し出すサービスであり，自宅や外出先などから利用者がデータを読み書きできるものはどれか。',
      ans: 'オンラインストレージ',
      choices: ["アーカイブ", "オーサリング", "オンラインストレージ", "フラッシュメモリ"],
      comment:
          "オンラインストレージは、ユーザーが自由に読み書き可能なサーバのディスクスペースをインターネット経由で貸し出すサービスで、フラッシュメモリ等のリムーバブルメディアの代替、バックアップ目的、グループ内での共有スペースなどが利用目的である。",
      source: '平成23年秋期 問55',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'クローラ',
      question: '全文検索型検索エンジンの検索データベースを作成する際に用いられ，Webページを自動的に巡回・収集するソフトウェアはどれか。',
      ans: 'クローラ',
      choices: ["CGI", "クローラ", "クロスサイトスクリプティング", "バックドア"],
      comment: "クローラは、Web上を自動巡回して文書や画像などの情報を取得・データベース化するプログラムで、主に検索エンジンにおける情報収集に用いられる。",
      source: '平成28年秋期 問86',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'MVNO（Mobile Virtual Network Operator）',
      question: '自社の通信設備を持たずに、大手キャリアのネットワークを借りてサービスを提供する通信事業者は何か？',
      ans: 'MVNO',
      choices: ["MVNO", "ISP", "クローラ", "オンラインストレージ"],
      comment:
          "MVNO（Mobile Virtual Network Operator）は、自社の通信設備を持たずに、大手キャリアのネットワークを借りてサービスを提供する通信事業者。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ISP（Internet Service Provider）',
      question: 'インターネット接続サービスを提供する事業者は何か？',
      ans: 'ISP',
      choices: ["ISP", "MVNO", "クローラ", "オンラインストレージ"],
      comment: "ISP（Internet Service Provider）は、インターネット接続サービスを提供する事業者。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'IP電話',
      question: 'インターネットプロトコルを利用して音声通信を行うサービスは何か？',
      ans: 'IP電話',
      choices: ["IP電話", "ISP", "MVNO", "クローラ"],
      comment: "IP電話（Internet Protocol Phone）は、インターネットプロトコルを利用して音声通信を行うサービス。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ハンドオーバ',
      question: '移動中のモバイルデバイスが異なるネットワーク間で通信を維持するプロセスは何か？',
      ans: 'ハンドオーバ',
      choices: ["ハンドオーバ", "ローミング", "MIMO", "キャリアアグリゲーション"],
      comment: "ハンドオーバ（またはハンドオフ）は、移動中のモバイルデバイスが異なるネットワーク間で通信を維持するためのプロセス。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ローミング',
      question: 'ユーザーが移動しても異なるネットワークエリアで通信サービスを継続できる機能は何か？',
      ans: 'ローミング',
      choices: ["ローミング", "ハンドオーバ", "MIMO", "キャリアアグリゲーション"],
      comment: "ローミングは、ユーザーが移動しても異なるネットワークエリアで通信サービスを継続できる機能。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'MIMO（Multiple Input Multiple Output）',
      question: '複数の送受信アンテナを用いてデータ伝送の効率を向上させる技術は何か？',
      ans: 'MIMO',
      choices: ["MIMO", "ローミング", "ハンドオーバ", "キャリアアグリゲーション"],
      comment: "MIMO（Multiple Input Multiple Output）は、複数の送受信アンテナを用いてデータ伝送の効率を向上させる技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'キャリアアグリゲーション',
      question: '複数のキャリア周波数を組み合わせて通信速度を向上させる技術は何か？',
      ans: 'キャリアアグリゲーション',
      choices: ["キャリアアグリゲーション", "MIMO", "ローミング", "ハンドオーバ"],
      comment: "キャリアアグリゲーションは、複数のキャリア周波数を組み合わせて通信速度を向上させる技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'テザリング',
      question: 'テザリングの説明として，適切なものはどれか。',
      ans: 'スマートフォンなどの通信端末をモバイルルータのように利用して，PCなどをインターネットに接続する機能',
      choices: [
        "自己複製し，ネットワークなどを経由して感染を拡大するウイルスの一種",
        "スマートフォンなどの通信端末をモバイルルータのように利用して，PCなどをインターネットに接続する機能",
        "電子データに対し，ハッシュ関数と公開鍵暗号を用いることで，改ざんを検知する方式",
        "ホームページの入力フィールドにSQLコマンドを意図的に入力することで，データベース内部の情報を不正に操作する攻撃"
      ],
      comment: "テザリングは、スマートフォンなどのモバイル端末がもつ携帯回線などのインターネット接続機能を用いて、他のコンピュータや情報端末をインターネットに接続する機能。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'SIMカード',
      question: 'モバイルデバイスがモバイルネットワークに接続するために使用される物理的なカードは何か？',
      ans: 'SIMカード',
      choices: ["SIMカード", "eSIM", "テザリング", "MIMO"],
      comment: "SIMカード（Subscriber Identity Module Card）は、モバイルデバイスがモバイルネットワークに接続するために使用される物理的なカード。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'eSIM',
      question: '物理的なカードではなく、デバイス内部に組み込まれたデジタルSIMのことを何というか？',
      ans: 'eSIM',
      choices: ["eSIM", "SIMカード", "テザリング", "MIMO"],
      comment: "eSIM（embedded SIM）は、物理的なカードではなく、デバイス内部に組み込まれたデジタルSIMのこと。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'テレマティクス',
      question: '自動車などの車両に搭載された通信機器を用いてサービスを提供する技術は何か？',
      ans: 'テレマティクス',
      choices: ["テレマティクス", "eSIM", "SIMカード", "テザリング"],
      comment: "テレマティクスは、自動車などの車両に搭載された通信機器を用いて、ナビゲーション、緊急通報、車両診断などのサービスを提供する技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ADSL（Asymmetric Digital Subscriber Line）',
      question: 'ADSLにおいて，加入者宅と電話局間で利用する通信媒体はどれか。',
      ans: 'アナログ電話回線(メタル)',
      choices: ["アナログ電話回線(メタル)", "同軸ケーブル", "光ファイバ", "無線(電波)"],
      comment:
          "ADSL（Asymmetric Digital Subscriber Line）は、一般家庭に普及しているアナログ電話回線(メタル※)をそのまま利用し、それまでに使用されていなかった周波数帯域を利用することでデジタル通信を行う伝送方式。",
      source: '平成24年秋期 問69',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'FTTH(Fiber To The Home)',
      question: '光ファイバーを利用して家庭やオフィスまで直接高速インターネット接続を提供する技術は何か？',
      ans: 'FTTH',
      choices: ["FTTH", "ISDN", "TCP/IP", "Wi-Fi"],
      comment: "FTTH(Fiber To The Home)は、光ファイバーを伝送路としてそれを一般家庭まで引き込む、光通信のネットワーク構成方式。",
      source: '平成24年春期 問82',
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 2101);
  });
}
