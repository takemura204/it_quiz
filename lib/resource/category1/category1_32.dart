import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_32 {
  final quizItems = [
    QuizItem(
      question: '一部のヒット商品だけでなく、ニッチな商品も多数取り揃えることで、長い尾のような販売曲線を描くビジネスモデルを何というか？',
      ans: 'ロングテール',
      choices: ["ロングテール", "フリーミアム", "無店舗販売", "EC"],
      comment:
          "ロングテールは、従来のヒット商品中心の販売から脱却し、少量多品種の商品を幅広く取り揃えることで、多様なニーズに応えるビジネスモデル。",
    ),
    QuizItem(
      question: '基本機能を無料で提供しつつ、高度な機能やサービスを有料で提供するビジネスモデルを何というか？',
      ans: 'フリーミアム',
      choices: ["ロングテール", "フリーミアム", "無店舗販売", "EC"],
      comment: "フリーミアムは、基本的な機能やサービスを無料で提供し、追加機能や高度なサービスを有料オプションとして提供するビジネスモデル。",
    ),
    QuizItem(
      question: '実店舗を持たずに商品やサービスを販売するビジネススタイルを何というか？',
      ans: '無店舗販売',
      choices: ["フリーミアム", "無店舗販売", "EC", "O2O"],
      comment: "無店舗販売は、実際の店舗を持たずに、インターネットや通信販売などを通じて商品やサービスを提供するビジネススタイル。",
    ),
    QuizItem(
      question: 'インターネットを利用して商品やサービスを販売することを何というか？',
      ans: 'EC',
      choices: ["無店舗販売", "EC", "O2O", "BtoC"],
      comment:
          "EC（Electronic Commerce）は、インターネットを利用した商取引のことで、オンラインショップや電子マーケットプレイスなどで商品やサービスが販売される。",
    ),
    QuizItem(
      question: 'オンラインの情報をオフラインの行動につなげるビジネスモデルを何というか？',
      ans: 'O2O',
      choices: ["EC", "O2O", "BtoC", "CtoC"],
      comment:
          "O2O（Online to Offline）は、オンラインでの情報やサービスを提供し、それをきっかけに消費者が実店舗を訪れるなどオフラインでの消費や行動につなげるビジネスモデル。",
    ),
    QuizItem(
      question: '企業が消費者に直接商品やサービスを提供するビジネスモデルを何というか？',
      ans: 'BtoC',
      choices: ["O2O", "BtoC", "CtoC", "BtoE"],
      comment:
          "BtoC（Business to Consumer）は、企業が最終消費者である個人に直接商品やサービスを販売するビジネスモデル。",
    ),
    QuizItem(
      question: '消費者が消費者に直接商品やサービスを提供する取引を何というか？',
      ans: 'CtoC',
      choices: ["BtoC", "CtoC", "BtoE", "EDI"],
      comment:
          "CtoC（Consumer to Consumer）は、個人間で商品やサービスが売買される取引のことで、オンラインオークションやフリーマーケットアプリなどがこのモデルに該当する。",
    ),
    QuizItem(
      question: '企業が従業員に対して直接商品やサービスを提供するビジネスモデルを何というか？',
      ans: 'BtoE',
      choices: ["CtoC", "BtoE", "EDI", "EFT"],
      comment:
          "BtoE（Business to Employee）は、企業が自社の従業員に対して直接商品やサービスを提供するビジネスモデル。従業員向けの福利厚生サービスなどがこれに該当する。",
    ),
    QuizItem(
      question: '企業間で文書やデータを電子的に交換するシステムは何か？',
      ans: 'EDI',
      choices: ["BtoE", "EDI", "EFT", "キャッシュレス決済"],
      comment:
          "EDI（Electronic Data Interchange）は、注文書や請求書などの文書を企業間で電子的に交換することで、取引の効率化を図るシステム。",
    ),
    QuizItem(
      question: '金融機関間で資金の電子的な移動を行うシステムを何というか？',
      ans: 'EFT',
      choices: ["EDI", "EFT", "キャッシュレス決済", "フィンテック"],
      comment:
          "EFT（Electronic Funds Transfer）は、銀行口座間で資金を電子的に移動させるシステム。オンラインバンキングや自動振込機などで利用される。",
    ),
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 311 + 1000);
  });
}
