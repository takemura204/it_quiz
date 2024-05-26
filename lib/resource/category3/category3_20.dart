import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_20 {
  final quizItems = [
    QuizItem(
      question: 'ネットワークの通信プロトコルとインターフェースを7つの階層で定義する国際標準モデルは何か？',
      ans: 'OSI基本参照モデル',
      choices: ["OSI基本参照モデル", "TCP/IP", "HTTP", "DHCP"],
      comment:
          "OSI基本参照モデルは、ネットワーク内の通信を7つの階層（レイヤー）で定義する国際標準モデルで、各レイヤーが独立した機能を持つことで、通信プロセスを理解しやすくする。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'インターネットでのデータ伝送に広く用いられるプロトコルスイートは何か？',
      ans: 'TCP/IP',
      choices: ["TCP/IP", "OSI基本参照モデル", "HTTP", "SMTP"],
      comment:
          "TCP/IP（Transmission Control Protocol/Internet Protocol）は、インターネットでのデータ伝送に広く用いられるプロトコルスイートで、データの分割、転送、再構築などを管理する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブページのデータ転送に使用されるプロトコルは何か？',
      ans: 'HTTP',
      choices: ["HTTP", "HTTPS", "TCP/IP", "FTP"],
      comment:
          "HTTP（HyperText Transfer Protocol）は、ウェブページのデータ転送に使用されるプロトコルで、ウェブサーバーとクライアント間でHTMLなどのドキュメントをやり取りする。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'HTTPにセキュリティ機能を追加した、暗号化されたウェブページのデータ転送プロトコルは何か？',
      ans: 'HTTPS',
      choices: ["HTTPS", "HTTP", "SMTP", "POP"],
      comment:
          "HTTPS（HyperText Transfer Protocol Secure）は、HTTPにセキュリティ機能を追加したプロトコルで、通信内容を暗号化してより安全なデータ転送を実現する。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '電子メールの送信に使用されるプロトコルは何か？',
      ans: 'SMTP',
      choices: ["SMTP", "POP", "HTTP", "FTP"],
      comment:
          "SMTP（Simple Mail Transfer Protocol）は、電子メールの送信に使用されるプロトコルで、メールサーバー間やメールクライアントからメールサーバーへのメール送信を担う。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '電子メールをメールサーバーからクライアントに受信するためのプロトコルは何か？',
      ans: 'POP',
      choices: ["POP", "SMTP", "HTTP", "IMAP"],
      comment:
          "POP（Post Office Protocol）は、電子メールをメールサーバーからクライアントに受信するためのプロトコルで、主にメールのダウンロードと削除を行う。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ファイルの転送に特化したプロトコルは何か？',
      ans: 'FTP',
      choices: ["FTP", "HTTP", "SMTP", "POP"],
      comment:
          "FTP（File Transfer Protocol）は、ファイルの転送に特化したプロトコルで、ネットワークを通じてファイルをやり取りする際に使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'コンピュータの時刻を同期させるために使用されるプロトコルは何か？',
      ans: 'NTP',
      choices: ["NTP", "HTTP", "SMTP", "FTP"],
      comment:
          "NTP（Network Time Protocol）は、コンピュータの時刻を同期させるために使用されるプロトコルで、正確な時刻情報をネットワークを通じて提供する。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ネットワーク上のデバイスに動的にIPアドレスを割り当てるプロトコルは何か？',
      ans: 'DHCP',
      choices: ["DHCP", "NTP", "TCP/IP", "HTTP"],
      comment:
          "DHCP（Dynamic Host Configuration Protocol）は、ネットワーク上のデバイスに動的にIPアドレスを割り当てるプロトコルで、IPアドレスの管理を効率化する。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ネットワーク上の特定のサービスやアプリケーションにデータを送信する際に使用される識別子は何か？',
      ans: 'ポート番号',
      choices: ["ポート番号", "IPアドレス", "MACアドレス", "SSID"],
      comment:
          "ポート番号は、ネットワーク上の特定のサービスやアプリケーションにデータを送信する際に使用される識別子で、IPアドレスと組み合わせて通信先を特定する。",
      importance: QuizImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 2001);
  });
}
