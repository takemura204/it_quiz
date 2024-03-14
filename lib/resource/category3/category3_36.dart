import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_36 {
  final quizItems = [
    QuizItem(
      question: '攻撃者が通信中のデータを傍受し、情報を盗み出す攻撃は何か？',
      ans: '中間者攻撃',
      choices: ["中間者攻撃", "MITB攻撃", "第三者中継", "IPスプーフィング"],
      comment: "中間者攻撃（Man-in-the-Middle Attack）は、攻撃者が通信中のデータを傍受し、情報を盗み出す攻撃。",
    ),
    QuizItem(
      question: 'オンラインバンキングなどで、ユーザーと銀行の間に攻撃者が入り込む攻撃は何か？',
      ans: 'MITB攻撃',
      choices: ["MITB攻撃", "中間者攻撃", "第三者中継", "IPスプーフィング"],
      comment:
          "MITB攻撃（Man-in-The-Browser Attack）は、オンラインバンキングなどで、ユーザーと銀行の間に攻撃者が入り込む攻撃。ブラウザの脆弱性を利用して行われる。",
    ),
    QuizItem(
      question: 'バッファを超過するデータを送り込み、システムに不正なコードを実行させる攻撃は何か？',
      ans: 'バッファオーバフロー攻撃',
      choices: ["バッファオーバフロー攻撃", "サラミ法", "ウォードライビング", "ポートスキャン"],
      comment:
          "バッファオーバフロー攻撃は、プログラムが予期しない大量のデータを受け取ることで、システムのメモリ領域を超えて不正なコードを実行させる攻撃。",
    ),
    QuizItem(
      question: 'サービスを停止させるためにサーバーに過剰な通信を送りつける攻撃は何か？',
      ans: 'DoS攻撃',
      choices: ["DoS攻撃", "DDoS攻撃", "クリプトジャッキング", "標的型攻撃"],
      comment:
          "DoS攻撃（Denial of Service Attack）は、サービスを停止させるためにサーバーに過剰な通信を送りつける攻撃。",
    ),
    QuizItem(
      question: '複数のボットネットを使用してサービスを停止させる攻撃は何か？',
      ans: 'DDoS攻撃',
      choices: ["DDoS攻撃", "DoS攻撃", "クリプトジャッキング", "標的型攻撃"],
      comment:
          "DDoS攻撃（Distributed Denial of Service Attack）は、複数のボットネットを使用して大量の通信を送りつけ、サービスを停止させる攻撃。",
    ),
    QuizItem(
      question: '他人のコンピュータを無断で使用し、仮想通貨のマイニングを行う攻撃は何か？',
      ans: 'クリプトジャッキング',
      choices: ["クリプトジャッキング", "DDoS攻撃", "DoS攻撃", "標的型攻撃"],
      comment: "クリプトジャッキングは、他人のコンピュータを無断で使用し、仮想通貨のマイニングを行う攻撃。",
    ),
    QuizItem(
      question: '特定の組織や個人を狙ったサイバー攻撃は何と呼ばれるか？',
      ans: '標的型攻撃',
      choices: ["標的型攻撃", "クリプトジャッキング", "DDoS攻撃", "DoS攻撃"],
      comment: "標的型攻撃は、特定の組織や個人を狙って精密に計画されたサイバー攻撃。",
    ),
    QuizItem(
      question: '攻撃者が公共の場所でのWi-Fiネットワークなどを利用して攻撃を行う手法は何か？',
      ans: '水飲み場型攻撃',
      choices: ["水飲み場型攻撃", "やり取り型攻撃", "フィッシング", "ワンクリック詐欺"],
      comment:
          "水飲み場型攻撃は、攻撃者が公共の場所でのWi-Fiネットワークなどを利用して、その場所を訪れる人々を標的とした攻撃を行う手法。",
    ),
    QuizItem(
      question: '攻撃者が対象とするユーザーとやり取りを行いながら攻撃を仕掛ける手法は何か？',
      ans: 'やり取り型攻撃',
      choices: ["やり取り型攻撃", "水飲み場型攻撃", "フィッシング", "ワンクリック詐欺"],
      comment: "やり取り型攻撃は、攻撃者が対象とするユーザーとメールやメッセージなどのやり取りを行いながら、信頼を得て攻撃を仕掛ける手法。",
    ),
    QuizItem(
      question: 'まだ公にされていないソフトウェアの脆弱性を悪用した攻撃は何か？',
      ans: 'ゼロデイ攻撃',
      choices: ["ゼロデイ攻撃", "ポートスキャン", "ウォードライビング", "サラミ法"],
      comment: "ゼロデイ攻撃は、ソフトウェアの脆弱性が公にされる前、つまり「ゼロデイ」に悪用される攻撃。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 351 + 3000);
  });
}
