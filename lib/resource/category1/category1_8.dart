import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///標準化関連
List<QuizItem> get category1_8 {
  final quizItems = [
    QuizItem(
      word: 'デファクトスタンダード',
      question: 'デファクトスタンダードの意味として，最も適切なものはどれか。',
      ans: '特定の企業やグループなどが採用した仕様が広く使用されるようになり，事実上の業界標準になったもの',
      choices: [
        "工業製品に関して，日本産業規格として定めたもの",
        "工業や科学技術に関して，国際標準化機構が定めた規格",
        "特定の企業やグループなどが採用した仕様が広く使用されるようになり，事実上の業界標準になったもの",
        "特定の国や地域，企業などに限られた基準ではなく，世界中どこでも適用される規格"
      ],
      comment:
          "デファクトスタンダードとは、公には明確に決まっているわけでないのに、市場のシェアやユーザーからの支持により事実上その分野で標準的なものと認識されている状態。",
      source: '平成21年秋期 問1',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'フォーラム標準',
      question: '特定の業界団体やコンソーシアムが定める非公式な標準を何というか？',
      ans: 'フォーラム標準',
      choices: ["デファクトスタンダード", "フォーラム標準", "ISO", "IEC"],
      comment: "フォーラム標準は、特定の業界団体やコンソーシアムが定める非公式ながらも、その業界内で広く受け入れられている標準を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'JANコード',
      question: 'JANコード中にデータとして組み込まれている情報はどれか。',
      ans: '商品の製造会社',
      choices: ["商品の製造会社", "商品の製造日", "商品の流通経路", "商品のロット番号"],
      comment:
          "JANコードは、バーコード規格のひとつで、製造した事業者と商品を識別するための共通商品コード体系で、13桁のタイプと8桁のタイプがあり、バーコードリーダーで読み取り可能。",
      source: '平成22年春期 問24',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'QRコード',
      question: 'QRコードの特徴として，適切なものはどれか。',
      ans: '上下左右どの方向からでも，コードを読み取ることができる。',
      choices: [
        "漢字を除くあらゆる文字と記号を収めることができる。",
        "収納できる情報量はバーコードと同等である。",
        "上下左右どの方向からでも，コードを読み取ることができる。",
        "バーコードを3層積み重ねた2次元構造になっている。"
      ],
      comment:
          "QRコードは、高速かつ大量のデータを格納できる二次元コードの一種で、縦横に情報を持っているため、格納できる情報量が多く、数字だけでなく英字や漢字など多言語のデータも格納することが可能で。また,3隅の四角い位置検出パターンによって360度読み取り可能、汚れなどがあっても正確に読み取れるように、誤り訂正語を含む。",
      source: '平成26年春期 問12',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ISBN（International Standard Book Number）',
      question: '図書を特定するために世界標準として使用されているコードはどれか。',
      ans: 'ISBN',
      choices: ["ISBN", "ITF", "JAN", "QR"],
      comment:
          "ISBN（International Standard Book Number）は、書籍に付与される国際的な識別コードで、各書籍を特定するために使用される。",
      source: '平成27年秋期 問20',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ISO（International Organization for Standardization）',
      question: '国際的な標準化を行う団体で、様々な分野の国際規格を定めている組織は何か？',
      ans: 'ISO',
      choices: ["IEEE", "ISO", "IETF", "W3C"],
      comment:
          "ISO（International Organization for Standardization）は、国際的な標準化を行う団体で、品質管理や環境管理など様々な分野の国際規格を定めている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'IEC（International Electrotechnical Commission）',
      question: '国際的な電気技術に関する標準化を行う団体は何か？',
      ans: 'IEC',
      choices: ["ISO", "IEC", "IEEE", "JIS"],
      comment:
          "IEC（International Electrotechnical Commission）は、国際的な電気技術に関する標準化を行う団体で、電気製品の安全性や性能に関する規格を定めている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'IEEE(Institute of Electrical and Electronics Engineers)',
      question: 'イーサネットのLANや無線LANなどに関する標準化活動を推進している，米国の学会はどれか。',
      ans: 'IEEE',
      choices: ["ICANN", "IEEE", "ISO", "ISO"],
      comment:
          "IEEE(Institute of Electrical and Electronics Engineers)は、アメリカ合衆国に本部を持ち、電気工学・電子工学技術分野における標準化活動を行っている専門家組織",
      source: '平成28年秋期 問19',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'W3C（World Wide Web Consortium）',
      question: 'ウェブ技術に関する標準を策定する国際的な組織は何か？',
      ans: 'W3C',
      choices: ["IETF", "ISO", "W3C", "IEEE"],
      comment:
          "W3C（World Wide Web Consortium）は、ウェブ技術に関する標準を策定する国際的な組織で、HTMLやCSSなどの規格を定めている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'IETF（Internet Engineering Task Force）',
      question: 'インターネットの技術的基盤に関する標準を策定する団体は何か？',
      ans: 'IETF',
      choices: ["IEEE", "ISO", "W3C", "IETF"],
      comment:
          "IETF（Internet Engineering Task Force）は、インターネットの技術的基盤に関する標準を策定する団体で、プロトコルなどの規格を定めている。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'JIS',
      question: '日本産業規格(JIS)に関する説明のうち，適切なものはどれか。',
      ans: 'ISOなど，国際的な規格との整合性に配慮した規格である。',
      choices: [
        "ISOなど，国際的な規格との整合性に配慮した規格である。",
        "規格に適合しない製品の製造・販売は禁止されている。",
        "鉱工業の分野ごとに，民間団体が定めた標準を集めた規格である。",
        "食品や医薬品の安全性に関する基準を規定している。"
      ],
      comment:
          "日本産業規格(JIS)は、鉱工業製品、プログラムその他の電磁的記録、建築物、役務について、その種類、形式、形状、構造および品質、性能などの事項を、全国的に統一することを目的として定められる規格",
      source: '平成27年春期 問14',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ISO 9000',
      question: '品質に関するマネジメントシステムの規格はどれか。',
      ans: 'JIS Q 9001',
      choices: ["JIS Q 9001", "JIS Q 14001", "JIS Q 15001", "JIS Q 27001"],
      comment:
          "ISO 9000シリーズは、ISOにより策定された規格で、組織の品質マネジメントシステムの要求事項を定めた国際標準規格で、JIS版として、JIS Q 9000、JIS Q 9001およびJIS Q 9004～JIS Q 9006がある。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'ISO 14000',
      question: '環境マネジメントシステムの要求事項を定めた国際標準は何か？',
      ans: 'ISO 14000',
      choices: ["ISO 9000", "ISO 14000", "ISO 26000", "ISO/IEC 27000"],
      comment:
          "ISO 14000シリーズは、組織が環境パフォーマンスを管理し改善するための環境マネジメントシステムの要求事項を定めた国際標準。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ISO 26000',
      question: '組織の社会的責任に関する指針を提供する国際標準は何か？',
      ans: 'ISO 26000',
      choices: ["ISO 9000", "ISO 14000", "ISO 26000", "ISO/IEC 27000"],
      comment: "ISO 26000は、組織が社会の持続可能な発展に貢献するために社会的責任を果たす方法に関する指針を提供する国際標準。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ISO/IEC 27000',
      question: '情報セキュリティマネジメントシステム（ISMS）の要求事項を定めた国際標準は何か？',
      ans: 'ISO/IEC 27000',
      choices: ["ISO 9000", "ISO 14000", "ISO 26000", "ISO/IEC 27000"],
      comment:
          "ISO/IEC 27000シリーズは、組織が情報セキュリティリスクを適切に管理するための情報セキュリティマネジメントシステムの要求事項を定めた国際標準。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'JIS Q 38500',
      question: '組織のITガバナンスに関する指針を提供するJIS規格は何か？',
      ans: 'JIS Q 38500',
      choices: ["JIS Q 38500", "JIS X 8341", "JIS Z 8115", "JIS K 5600"],
      comment:
          "JIS Q 38500は、組織のIT資源の有効活用を支援し、経営戦略とIT戦略の整合性を高めるためのITガバナンスに関する指針を提供するJIS規格。",
      importance: QuizImportanceType.low,
    )
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 801);
  });
}
