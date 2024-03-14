import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_40 {
  final quizItems = [
    QuizItem(
      question: '不適切なコンテンツの閲覧を防ぐために使用される技術は何か？',
      ans: 'コンテンツフィルタリング',
      choices: ["コンテンツフィルタリング", "MACアドレスフィルタリング", "コールバック", "アクセス制御"],
      comment: "コンテンツフィルタリングは、インターネット上の不適切なコンテンツや有害なサイトの閲覧を防ぐために使用される技術。",
    ),
    QuizItem(
      question: 'ネットワーク機器にアクセスできるデバイスを制限するために使用される技術は何か？',
      ans: 'MACアドレスフィルタリング',
      choices: ["MACアドレスフィルタリング", "コンテンツフィルタリング", "コールバック", "アクセス制御"],
      comment: "MACアドレスフィルタリングは、特定のMACアドレスを持つデバイスのみネットワークへのアクセスを許可する技術。",
    ),
    QuizItem(
      question: 'リモートアクセス時にセキュリティを強化するために、あらかじめ登録された電話番号にのみ折り返し接続を行う方法は何か？',
      ans: 'コールバック',
      choices: ["コールバック", "MACアドレスフィルタリング", "コンテンツフィルタリング", "アクセス制御"],
      comment:
          "コールバックは、リモートアクセスセッションのセキュリティを強化するために、あらかじめ登録された電話番号にのみ折り返し接続を行う方法。",
    ),
    QuizItem(
      question: 'ユーザーやデバイスがリソースにアクセスする際の権限を管理するプロセスは何か？',
      ans: 'アクセス制御',
      choices: ["アクセス制御", "コールバック", "MACアドレスフィルタリング", "コンテンツフィルタリング"],
      comment: "アクセス制御は、ユーザーやデバイスが情報リソースにアクセスする際の権限を管理・制限するセキュリティプロセス。",
    ),
    QuizItem(
      question: '不正なアクセスや攻撃からネットワークを保護するためのシステムは何か？',
      ans: 'ファイアウォール',
      choices: ["ファイアウォール", "WAF", "IDS", "IPS"],
      comment: "ファイアウォールは、不正なアクセスや攻撃からネットワークを保護するために、入出力される通信を制御するシステム。",
    ),
    QuizItem(
      question: 'ウェブアプリケーションを対象とした攻撃から保護するためのセキュリティシステムは何か？',
      ans: 'WAF',
      choices: ["WAF", "ファイアウォール", "IDS", "IPS"],
      comment:
          "WAF（Web Application Firewall）は、ウェブアプリケーションを対象とした攻撃（例えば、SQLインジェクションやクロスサイトスクリプティング）から保護するためのセキュリティシステム。",
    ),
    QuizItem(
      question: 'ネットワーク上の不審な活動や攻撃の兆候を検出するシステムは何か？',
      ans: 'IDS',
      choices: ["IDS", "WAF", "ファイアウォール", "IPS"],
      comment:
          "IDS（Intrusion Detection System）は、ネットワーク上の不審な活動や攻撃の兆候を検出し、警告を発するシステム。",
    ),
    QuizItem(
      question: '攻撃を検出し、それを阻止または軽減するためのシステムは何か？',
      ans: 'IPS',
      choices: ["IPS", "IDS", "WAF", "ファイアウォール"],
      comment:
          "IPS（Intrusion Prevention System）は、攻撃を検出し、自動的にそれを阻止または軽減するためのセキュリティシステム。",
    ),
    QuizItem(
      question: 'セキュリティ関連のデータを収集、分析し、セキュリティインシデントの監視・管理を行うシステムは何か？',
      ans: 'SIEM',
      choices: ["SIEM", "IPS", "IDS", "WAF"],
      comment:
          "SIEM（Security Information and Event Management）は、セキュリティ関連のデータをリアルタイムで収集・分析し、セキュリティインシデントの監視・管理を行うシステム。",
    ),
    QuizItem(
      question: '機密情報の漏洩を防ぐためにデータの流れを監視し、制御する技術は何か？',
      ans: 'DLP',
      choices: ["DLP", "SIEM", "IPS", "IDS"],
      comment:
          "DLP（Data Loss Prevention）は、機密情報が組織の外部に漏洩するのを防ぐために、データの流れを監視し、必要に応じて制御する技術。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 391 + 3000);
  });
}
