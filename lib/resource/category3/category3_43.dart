import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_43 {
  final quizItems = [
    QuizItem(
      question: '指紋や顔認証などの生理的特徴を用いてユーザーを識別する認証方法は何か？',
      ans: '生体認証',
      choices: ["生体認証", "CAPTCHA", "SMS認証", "シングルサインオン"],
      comment:
          "生体認証は、指紋、虹彩、顔認証など、個人の生理的または行動的特徴を用いてユーザーを識別する認証方法。高いセキュリティと利便性を提供する。",
    ),
    QuizItem(
      question: '生体認証システムで、正規ユーザーが誤って拒否される割合は何か？',
      ans: '本人拒否率',
      choices: ["本人拒否率", "他人受入率", "PKI", "CA"],
      comment:
          "本人拒否率（False Rejection Rate, FRR）は、生体認証システムにおいて、正規のユーザーが誤って拒否される割合。低い本人拒否率は、ユーザビリティの高さを示す。",
    ),
    QuizItem(
      question: '生体認証システムで、不正なユーザーが誤って受け入れられる割合は何か？',
      ans: '他人受入率',
      choices: ["他人受入率", "本人拒否率", "PKI", "CA"],
      comment:
          "他人受入率（False Acceptance Rate, FAR）は、生体認証システムにおいて、不正なユーザーが誤って受け入れられる割合。低い他人受入率は、セキュリティの強さを示す。",
    ),
    QuizItem(
      question: '公開鍵と秘密鍵を使用してデジタルアイデンティティとセキュリティを管理するインフラストラクチャは何か？',
      ans: 'PKI',
      choices: ["PKI", "他人受入率", "本人拒否率", "CA"],
      comment:
          "PKI（Public Key Infrastructure）は、公開鍵暗号方式とデジタル証明書を使用して、ユーザーやデバイスのデジタルアイデンティティを確立し、セキュリティを強化するためのフレームワーク。",
    ),
    QuizItem(
      question: 'デジタル証明書を発行し、デジタルアイデンティティの真正性を保証する機関は何か？',
      ans: 'CA',
      choices: ["CA", "PKI", "本人拒否率", "他人受入率"],
      comment:
          "CA（Certificate Authority）は、デジタル証明書を発行し、個人や組織のデジタルアイデンティティの真正性を保証する機関。",
    ),
    QuizItem(
      question: '無効になったデジタル証明書のリストは何か？',
      ans: 'CRL',
      choices: ["CRL", "CA", "PKI", "他人受入率"],
      comment:
          "CRL（Certificate Revocation List）は、無効になったデジタル証明書のリスト。CAによって発行・管理され、証明書の有効性を検証する際に参照される。",
    ),
    QuizItem(
      question: '製品やシステムの設計初期段階からセキュリティを考慮するアプローチは何か？',
      ans: 'セキュリティバイデザイン',
      choices: ["セキュリティバイデザイン", "プライバシーバイデザイン", "CRL", "CA"],
      comment:
          "セキュリティバイデザインは、製品やシステムの設計初期段階からセキュリティを組み込むことを重視するアプローチ。予防的なセキュリティ対策を促進する。",
    ),
    QuizItem(
      question: '製品やシステムの設計において、ユーザーのプライバシーを保護することを重視するアプローチは何か？',
      ans: 'プライバシーバイデザイン',
      choices: ["プライバシーバイデザイン", "セキュリティバイデザイン", "CRL", "CA"],
      comment:
          "プライバシーバイデザインは、製品やシステムの設計において、初期段階からプライバシー保護の原則を組み込むことを重視するアプローチ。ユーザーのプライバシーとデータ保護を強化する。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 421 + 3000);
  });
}
