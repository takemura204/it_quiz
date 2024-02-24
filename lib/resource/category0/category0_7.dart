import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category0_7 {
  final quizItems = [
    QuizItem(
      question:
          'コンピュータのハードウェアとアプリケーションソフトウェアの間を仲介し、コンピュータの基本的な機能を提供するソフトウェアは何か？',
      ans: 'OS',
      choices: ["OS", "CPU", "SSD", "RAM"],
      comment:
          "OS（オペレーティングシステム）は、コンピュータのハードウェアとアプリケーションソフトウェアの間を仲介し、システムの基本的な機能を提供するソフトウェア。",
    ),
    QuizItem(
      question: 'そのソースコードが公開され、誰でも自由に利用、改変、再配布することが許可されているソフトウェアは何と呼ばれるか？',
      ans: 'OSS',
      choices: ["OSS", "フリーウェア", "シェアウェア", "クローズドソースソフトウェア"],
      comment:
          "OSS（Open Source Software）は、ソースコードが公開されており、誰でも自由に利用、改変、再配布することが許可されているソフトウェア。",
    ),
    QuizItem(
      question: 'データベースを管理し、データの定義、更新、取得を行うためのシステムは何か？',
      ans: 'データベース管理システム',
      choices: ["データベース管理システム", "関係データベース", "NoSQL", "RDBMS"],
      comment:
          "データベース管理システム（DBMS）は、データベースを効率的に管理し、データの定義、更新、取得を行うためのソフトウェアシステム。",
    ),
    QuizItem(
      question: 'データベース内のエンティティ間の関係を図式化したものは何か？',
      ans: 'E-R図',
      choices: ["E-R図", "主キー", "外部キー", "インデックス"],
      comment:
          "E-R図（Entity-Relationship Diagram）は、データベース内のエンティティ間の関係を図式化したもので、データベース設計の際に使用される。",
    ),
    QuizItem(
      question: 'テーブル内の各行を一意に識別するために使用される列は何か？',
      ans: '主キー',
      choices: ["主キー", "外部キー", "インデックス", "射影"],
      comment: "主キーは、テーブル内の各行を一意に識別するために使用される列で、各行が唯一無二の値を持つことが保証される。",
    ),
    QuizItem(
      question: '他のテーブルの主キーを参照し、テーブル間の関係を構築するための列は何か？',
      ans: '外部キー',
      choices: ["外部キー", "主キー", "インデックス", "射影"],
      comment: "外部キーは、他のテーブルの主キーを参照し、テーブル間の関係を構築するための列。",
    ),
    QuizItem(
      question: '異なるネットワーク間でデータパケットを転送するための装置は何か？',
      ans: 'ルータ',
      choices: ["ルータ", "ハブ", "スイッチ", "ネットワークインターフェイスカード"],
      comment: "ルータは、異なるネットワーク間でデータパケットを転送し、最適な経路を選択するための装置。",
    ),
    QuizItem(
      question: '無線LANネットワークの名前を示す識別子は何か？',
      ans: 'ESSID',
      choices: ["ESSID", "SSID", "MACアドレス", "IPアドレス"],
      comment:
          "ESSID（Extended Service Set Identifier）またはSSID（Service Set Identifier）は、無線LANネットワークの名前を示す識別子。",
    ),
    QuizItem(
      question: 'ウェブページのデータ転送に使用されるプロトコルは何か？',
      ans: 'HTTP',
      choices: ["HTTP", "HTTPS", "TCP/IP", "FTP"],
      comment:
          "HTTP（HyperText Transfer Protocol）は、ウェブページのデータ転送に使用されるプロトコルで、ウェブサーバーとクライアント間でHTMLなどのドキュメントをやり取りする。",
    ),
    QuizItem(
      question: 'HTTPにセキュリティ機能を追加した、暗号化されたウェブページのデータ転送プロトコルは何か？',
      ans: 'HTTPS',
      choices: ["HTTPS", "HTTP", "SMTP", "POP"],
      comment:
          "HTTPS（HyperText Transfer Protocol Secure）は、HTTPにセキュリティ機能を追加したプロトコルで、通信内容を暗号化してより安全なデータ転送を実現する。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 61);
  });
}
