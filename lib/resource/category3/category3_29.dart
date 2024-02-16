import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_29 {
  final quizItems = [
    QuizItem(
      question: 'インターネット上のデバイスを一意に識別するために使用される数値のラベルは何か？',
      ans: 'IPアドレス',
      choices: ["IPアドレス", "サブネットマスク", "IPv6", "DNS"],
      comment:
          "IPアドレス（Internet Protocol Address）は、インターネット上のデバイスを一意に識別するために使用される数値のラベル。",
    ),
    QuizItem(
      question: 'IPアドレスのネットワーク部分とホスト部分を区別するために使用される数値は何か？',
      ans: 'サブネットマスク',
      choices: ["サブネットマスク", "IPアドレス", "IPv6", "DNS"],
      comment: "サブネットマスクは、IPアドレスのネットワーク部分とホスト部分を区別するために使用される数値。",
    ),
    QuizItem(
      question: 'より多くのデバイスをインターネットに接続するために設計された新しいIPアドレス体系は何か？',
      ans: 'IPv6',
      choices: ["IPv6", "IPアドレス", "サブネットマスク", "DNS"],
      comment:
          "IPv6（Internet Protocol version 6）は、より多くのデバイスをインターネットに接続するために設計された新しいIPアドレス体系。",
    ),
    QuizItem(
      question: 'ドメイン名をIPアドレスに変換するためのシステムは何か？',
      ans: 'DNS',
      choices: ["DNS", "IPv6", "IPアドレス", "サブネットマスク"],
      comment: "DNS（Domain Name System）は、ドメイン名をIPアドレスに変換するためのシステム。",
    ),
    QuizItem(
      question: 'インターネット上のリソースを特定するために使用されるアドレスは何か？',
      ans: 'URL',
      choices: ["URL", "DNS", "IPv6", "IPアドレス"],
      comment: "URL（Uniform Resource Locator）は、インターネット上のリソースを特定するために使用されるアドレス。",
    ),
    QuizItem(
      question: '同じメッセージを複数の受信者に送信する電子メールの形式は何か？',
      ans: '同報メール',
      choices: ["同報メール", "メーリングリスト", "cc", "bcc"],
      comment: "同報メールは、同じメッセージを複数の受信者に送信する電子メールの形式。",
    ),
    QuizItem(
      question: '特定のトピックに関心がある人々のグループにメールを配布するために使用されるシステムは何か？',
      ans: 'メーリングリスト',
      choices: ["メーリングリスト", "同報メール", "cc", "bcc"],
      comment: "メーリングリストは、特定のトピックに関心がある人々のグループにメールを配布するために使用されるシステム。",
    ),
    QuizItem(
      question: '電子メールで、メッセージのコピーを受信者に送ることを示す略語は何か？',
      ans: 'cc',
      choices: ["cc", "bcc", "同報メール", "メーリングリスト"],
      comment: "cc（carbon copy）は、電子メールで、メッセージのコピーを受信者に送ることを示す略語。",
    ),
    QuizItem(
      question: '電子メールで、他の受信者には見えない形でメッセージのコピーを送ることを示す略語は何か？',
      ans: 'bcc',
      choices: ["bcc", "cc", "同報メール", "メーリングリスト"],
      comment:
          "bcc（blind carbon copy）は、電子メールで、他の受信者には見えない形でメッセージのコピーを送ることを示す略語。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 281 + 3000);
  });
}
