import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_19 {
  final quizItems = [
    QuizItem(
      question: '市場で広く受け入れられ、事実上の標準となっている技術や規格を何というか？',
      ans: 'デファクトスタンダード',
      choices: ["デファクトスタンダード", "フォーラム標準", "JIS", "ISO"],
      comment: "デファクトスタンダードは、公式な標準化団体によって制定されたわけではないが、市場で広く受け入れられている事実上の標準を指す。",
    ),
    QuizItem(
      question: '特定の業界団体やコンソーシアムが定める非公式な標準を何というか？',
      ans: 'フォーラム標準',
      choices: ["デファクトスタンダード", "フォーラム標準", "ISO", "IEC"],
      comment: "フォーラム標準は、特定の業界団体やコンソーシアムが定める非公式ながらも、その業界内で広く受け入れられている標準を指す。",
    ),
    QuizItem(
      question: '商品の識別情報を表すために使用される、バーコードの一種は何か？',
      ans: 'JANコード',
      choices: ["QRコード", "JANコード", "ISBN", "IEEE"],
      comment: "JANコードは、日本で広く使用されている商品の識別情報を表すバーコードの一種で、主に小売業で利用される。",
    ),
    QuizItem(
      question: '二次元コードの一種で、広範囲な情報を格納することができるコードは何か？',
      ans: 'QRコード',
      choices: ["JANコード", "QRコード", "ISBN", "JIS"],
      comment: "QRコードは、高速かつ大量のデータを格納できる二次元コードの一種で、様々な用途で使用されている。",
    ),
    QuizItem(
      question: '書籍に付与される国際的な識別コードは何か？',
      ans: 'ISBN',
      choices: ["JANコード", "QRコード", "ISBN", "ISO"],
      comment:
          "ISBN（International Standard Book Number）は、書籍に付与される国際的な識別コードで、各書籍を特定するために使用される。",
    ),
    QuizItem(
      question: '国際的な標準化を行う団体で、様々な分野の国際規格を定めている組織は何か？',
      ans: 'ISO',
      choices: ["IEEE", "ISO", "IETF", "W3C"],
      comment:
          "ISO（International Organization for Standardization）は、国際的な標準化を行う団体で、品質管理や環境管理など様々な分野の国際規格を定めている。",
    ),
    QuizItem(
      question: '国際的な電気技術に関する標準化を行う団体は何か？',
      ans: 'IEC',
      choices: ["ISO", "IEC", "IEEE", "JIS"],
      comment:
          "IEC（International Electrotechnical Commission）は、国際的な電気技術に関する標準化を行う団体で、電気製品の安全性や性能に関する規格を定めている。",
    ),
    QuizItem(
      question: '電気工学やコンピュータ工学に関する標準を定める国際的な専門家団体は何か？',
      ans: 'IEEE',
      choices: ["IEC", "ISO", "IEEE", "JIS"],
      comment:
          "IEEE（Institute of Electrical and Electronics Engineers）は、電気工学やコンピュータ工学に関する標準を定める国際的な専門家団体。",
    ),
    QuizItem(
      question: 'ウェブ技術に関する標準を策定する国際的な組織は何か？',
      ans: 'W3C',
      choices: ["IETF", "ISO", "W3C", "IEEE"],
      comment:
          "W3C（World Wide Web Consortium）は、ウェブ技術に関する標準を策定する国際的な組織で、HTMLやCSSなどの規格を定めている。",
    ),
    QuizItem(
      question: 'インターネットの技術的基盤に関する標準を策定する団体は何か？',
      ans: 'IETF',
      choices: ["IEEE", "ISO", "W3C", "IETF"],
      comment:
          "IETF（Internet Engineering Task Force）は、インターネットの技術的基盤に関する標準を策定する団体で、プロトコルなどの規格を定めている。",
    )
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 181);
  });
}
