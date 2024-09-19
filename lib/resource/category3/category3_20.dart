import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_20 {
  final quizItems = [
    QuizItem(
      word: 'OSI基本参照モデル',
      question: 'ネットワークの通信プロトコルとインターフェースを7つの階層で定義する国際標準モデルは何か？',
      ans: 'OSI基本参照モデル',
      choices: ["OSI基本参照モデル", "TCP/IP", "HTTP", "DHCP"],
      comment:
          "OSI基本参照モデルは、ネットワーク内の通信を7つの階層（レイヤー）で定義する国際標準モデルで、各レイヤーが独立した機能を持つことで、通信プロセスを理解しやすくする。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'TCP/IP（Transmission Control Protocol/Internet Protocol）',
      question:
          'ネットワークを介したアプリケーション間の通信を実現するために，数多くのプロトコルが階層的に使用されている。次の記述中のa，bに入れるプロトコル名の適切な組合せはどれか。\nインターネットでWebページを閲覧する場合，ブラウザとWebサーバは，[a] というプロトコルを使用する。この [a] による通信は，その下層の [b] と，さらにその下層のIPというプロトコルを使用する。',
      ans: 'a.HTTP,b.TCP',
      choices: ["a.FTP,b.Ethernet", "a.HTTP,b.TCP", "a.SMTP,b.POP3", "a.www,b.HTML"],
      comment:
          "TCP/IP（Transmission Control Protocol/Internet Protocol）は、インターネットやLANなどで標準的に使われている、あらゆるコンピュータや異なるOSで相互に通信ことを可能にする通信プロトコル群。",
      source: '平成22年秋期 問65',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'HTTP（HyperText Transfer Protocol）',
      question: 'ウェブページのデータ転送に使用されるプロトコルは何か？',
      ans: 'HTTP',
      choices: ["HTTP", "HTTPS", "TCP/IP", "FTP"],
      comment:
          "HTTP（HyperText Transfer Protocol）は、ウェブページのデータ転送に使用されるプロトコルで、ウェブサーバーとクライアント間でHTMLなどのドキュメントをやり取りする。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'HTTPS(HTTP over SSL/TLS)',
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
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'SMTP（Simple Mail Transfer Protocol）',
      question: '電子メールの送信に使用されるプロトコルは何か？',
      ans: 'SMTP',
      choices: ["SMTP", "POP", "HTTP", "FTP"],
      comment:
          "SMTP（Simple Mail Transfer Protocol）は、電子メールの送信に使用されるプロトコルで、メールサーバー間やメールクライアントからメールサーバーへのメール送信を担う。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'POP',
      question: 'メールサーバに届いた電子メールをメールソフトで受け取るために使用されるプロトコルはどれか。',
      ans: 'POP3',
      choices: ["DNS", "HTTP", "POP3", "SMTP"],
      comment:
          "POP（Post Office Protocol）は、ユーザ側に実装されているメールソフトがメールサーバから自身のメールを取り出す処理において使用するメール受信用プロトコルで、現在最も普及している「POP3」は、POPのバージョン3にあたる。",
      source: '平成24年秋期 問77',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'IMAP(Internet Message Access Protocol)',
      question:
          'PCで電子メールを読むときに，PCにメールをサーバからダウンロードするのではなくサーバ上で保管し管理する。未読管理やメールの削除やフォルダの振分け状態などが会社や自宅にあるどのPCからも同一に見えるようにできるメールプロトコルはどれか。',
      ans: 'IMAP4',
      choices: ["APOP", "IMAP4", "POP3", "SMTP"],
      comment:
          "IMAP(Internet Message Access Protocol)は、電子メールの受信に使われるプロトコルで、メールをクライアントのメーラーではなくメールサーバ上で管理します。これによりメール状態の一元管理や複数の端末で同じメールを読むことができるなど、複数の端末を使用する場合に適したメールプロトコルとなっています。POPと違いメールサーバ内のメールを選択して受信することが可能。",
      source: '平成25年春期 問84',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'FTP（File Transfer Protocol）',
      question: 'インターネットのファイル転送で使用される anonymous FTP に関する記述として，適切なものはどれか。',
      ans: '利用者固有のパスワードを使用せず，誰でも利用できるFTPである。',
      choices: [
        "FTPに暗号化の機能を追加したプロトコルである。",
        "Web通信のプロトコルを用いた方法である。",
        "利用者固有のパスワードを使用せず，誰でも利用できるFTPである。",
        "利用者認証機能と通信時の誤り訂正機能がない，軽量で簡易的なプロトコルである。"
      ],
      comment:
          "FTP（File Transfer Protocol）は、ネットワーク上でファイルの転送を行うための通信プロトコルで、ユーザ名やパスワードを平文で送信する仕様でセキュリティ上の脆弱性があるため、現在では、代わりにセキュアな接続上で認証情報をやり取りするSFTPやFTPSが用いられることが多い。",
      source: '平成24年春期 問60',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'NTP(Network Time Protocol)',
      question: 'TCP/IPネットワークで使用されるNTP(Network Time Protocol)の役割として，適切なものはどれか。',
      ans: 'ネットワークに接続されている機器間で時刻を同期させる。',
      choices: [
        "動画や音声をリアルタイムに配信する。",
        "ネットワークに接続されている機器間で時刻を同期させる。",
        "ファイルがある時刻以前に存在していたことを保証する証明書を発行する。",
        "無線LANにおいて，一定時間経過後に暗号鍵を自動的に変更する。"
      ],
      comment:
          "NTP(Network Time Protocol)は、ネットワークに接続されたサーバとクライアントのシステム時計を正しい時刻(協定世界時:UTC)に合わせるためのプロトコル。",
      source: '平成23年特別 問85',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'DHCP(Dynamic Host Configuration Protocol)',
      question: 'PCがネットワークに接続されたときにIPアドレスを自動的に取得するために使用されるプロトコルはどれか。',
      ans: 'DHCP',
      choices: ["DHCP", "HTTP", "NTP", "SMTP"],
      comment:
          "DHCP(Dynamic Host Configuration Protocol)は、TCP/IPネットワークで、ネットワークに接続するノードへのIPアドレスの割り当てをアドレスプールから自動的に行うプロトコル。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'ポート番号',
      question: 'TCP/IPのポート番号によって識別されるものはどれか。',
      ans: '通信相手のアプリケーションソフトウェア',
      choices: ["コンピュータに装着されたLANカード", "通信相手のアプリケーションソフトウェア", "通信相手のコンピュータ", "無線LANのアクセスポイント"],
      comment:
          "ポート番号は、IPアドレスが送受信の対象コンピュータを識別する情報であるのに対して、データの宛先となるアプリケーションを表す情報で、ポート番号はOSI基本参照モデルのトランスポート層で、ローカルノード内のアプリケーションを0～65535の数値で識別する。",
      source: '平成22年春期 問80',
      importance: ImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 2001);
  });
}
