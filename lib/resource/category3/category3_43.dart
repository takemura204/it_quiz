import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_43 {
  final quizItems = [
    QuizItem(
      question: 'Wi-Fiネットワークのセキュリティを強化したプロトコルの一つは何か？',
      ans: 'WPA2',
      choices: ["WPA2", "WPA3", "S/MIME", "ディジタル署名"],
      comment:
          "WPA2（Wi-Fi Protected Access 2）は、Wi-Fiネットワークのセキュリティを強化したプロトコルで、より強力な暗号化と認証を提供する。",
    ),
    QuizItem(
      question: 'WPA2の後継として開発された、さらに強化されたWi-Fiセキュリティプロトコルは何か？',
      ans: 'WPA3',
      choices: ["WPA3", "WPA2", "S/MIME", "ディジタル署名"],
      comment:
          "WPA3（Wi-Fi Protected Access 3）は、WPA2の後継として開発された、さらに強化されたWi-Fiセキュリティプロトコル。パーソナルおよびエンタープライズネットワークの両方でのセキュリティを向上させる。",
    ),
    QuizItem(
      question: '電子メールのセキュリティを強化するために使用される標準は何か？',
      ans: 'S/MIME',
      choices: ["S/MIME", "WPA3", "WPA2", "ディジタル署名"],
      comment:
          "S/MIME（Secure/Multipurpose Internet Mail Extensions）は、電子メールのセキュリティを強化するために使用される標準で、暗号化とデジタル署名を提供する。",
    ),
    QuizItem(
      question: '電子ドキュメントに真正性と改ざん防止の証明を提供するために使用されるものは何か？',
      ans: 'ディジタル署名',
      choices: ["ディジタル署名", "S/MIME", "タイムスタンプ", "ワンタイムパスワード"],
      comment: "ディジタル署名は、電子ドキュメントに対して真正性、改ざん防止、および署名者の否認防止の証明を提供するために使用される。",
    ),
    QuizItem(
      question: 'ドキュメントが署名された正確な時刻を証明するために使用されるものは何か？',
      ans: 'タイムスタンプ',
      choices: ["タイムスタンプ", "ディジタル署名", "S/MIME", "ワンタイムパスワード"],
      comment:
          "タイムスタンプは、ドキュメントやデータが特定の時点で存在していたことを証明するために使用される、信頼できる第三者によって提供されるサービス。",
    ),
    QuizItem(
      question: 'ログインやトランザクション確認のために一度だけ使用されるパスワードは何か？',
      ans: 'ワンタイムパスワード',
      choices: ["ワンタイムパスワード", "タイムスタンプ", "ディジタル署名", "S/MIME"],
      comment:
          "ワンタイムパスワード（OTP）は、ログインやトランザクションの確認のために一度だけ使用され、次回以降の使用ができない一時的なパスワード。",
    ),
    QuizItem(
      question: 'セキュリティを強化するために複数の認証要素を組み合わせて使用する認証方法は何か？',
      ans: '多要素認証',
      choices: ["多要素認証", "ワンタイムパスワSSLード", "シングルサインオン", "SMS認証"],
      comment:
          "多要素認証は、パスワード（知識要素）とスマートカード（所持要素）、指紋認証（生体要素）など、複数の異なる認証要素を組み合わせて使用することでセキュリティを強化する認証方法。",
    ),
    QuizItem(
      question: 'ユーザーが一度のログインで複数の関連システムやアプリケーションにアクセスできるようにする認証方法は何か？',
      ans: 'シングルサインオン',
      choices: ["シングルサインオン", "多要素認証", "ワンタイムパスワード", "SMS認証"],
      comment:
          "シングルサインオン（SSO）は、ユーザーが一度の認証で複数の関連システムやアプリケーションにアクセスできるようにする認証方法。ユーザビリティの向上と管理の効率化が期待できる。",
    ),
    QuizItem(
      question: '認証の際にSMSを通じてコードを送信する方法は何か？',
      ans: 'SMS認証',
      choices: ["SMS認証", "シングルサインオン", "多要素認証", "ワンタイムパスワード"],
      comment:
          "SMS認証は、ログインやトランザクションの確認のために、ユーザーの携帯電話にSMSメッセージを通じて一時的な認証コードを送信する認証方法。",
    ),
    QuizItem(
      question: '自動化されたプログラムによる不正アクセスを防ぐためにユーザーに認証課題を提示する技術は何か？',
      ans: 'CAPTCHA',
      choices: ["CAPTCHA", "SMS認証", "シングルサインオン", "多要素認証"],
      comment:
          "CAPTCHA（Completely Automated Public Turing test to tell Computers and Humans Apart）は、自動化されたプログラム（ボット）による不正アクセスを防ぐために、ユーザーに認証課題（例えば、 distorted textの読み取り）を提示する技術。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 421 + 3000);
  });
}
