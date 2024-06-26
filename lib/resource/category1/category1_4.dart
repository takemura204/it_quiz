import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category1_4 {
  final quizItems = [
    QuizItem(
      question: '著作者の作品に対する権利を保護する法律は何か？',
      ans: '著作権法',
      choices: ["著作権法", "特許法", "実用新案法", "意匠法"],
      comment: "著作権法は、文学、音楽、美術などの創作物に対して著作者に与えられる権利を保護する法律。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '発明を保護するための法律は何か？',
      ans: '特許法',
      choices: ["商標法", "著作権法", "特許法", "実用新案法"],
      comment: "特許法は、新規性、進歩性、産業上の利用可能性を有する発明に対して一定期間独占的な権利を与える法律。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'ビジネスの方法やシステムに関する特許を何というか？',
      ans: 'ビジネスモデル特許',
      choices: ["ビジネスモデル特許", "実用新案権", "意匠権", "著作権"],
      comment: "ビジネスモデル特許は、特定のビジネス方法やシステムに関する新規性や独自性を保護する特許。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '形状や構造などの改良に関する保護を目的とした法律は何か？',
      ans: '実用新案法',
      choices: ["特許法", "実用新案法", "商標法", "著作権法"],
      comment: "実用新案法は、機械や器具の形状、構造、または組み合わせに関する新規で実用的なアイデアを保護する法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '製品の形状やデザインを保護する法律は何か？',
      ans: '意匠法',
      choices: ["実用新案法", "意匠法", "著作権法", "特許法"],
      comment: "意匠法は、製品の外観の形状、模様、色彩などのデザインを保護する法律。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '企業のブランド名やロゴなどを保護する法律は何か？',
      ans: '商標法',
      choices: ["意匠法", "商標法", "著作権法", "特許法"],
      comment: "商標法は、商品やサービスを識別するためのブランド名、ロゴ、マークなどを保護する法律。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '商品やサービスを識別するために用いられる記号やロゴを何というか？',
      ans: 'トレードマーク',
      choices: ["トレードマーク", "サービスマーク", "ブランドマーク", "ロゴタイプ"],
      comment: "トレードマークは、商品を識別するために企業が使用する記号やロゴで、商標として保護される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'サービスを提供する事業者を識別するための記号や名称を何というか？',
      ans: 'サービスマーク',
      choices: ["トレードマーク", "サービスマーク", "ブランドネーム", "ロゴ"],
      comment: "サービスマークは、商品ではなくサービスを識別するために使用されるマークや名称で、商標として保護される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '他社の商品やサービスを模倣することを防止する法律は何か？',
      ans: '不正競争防止法',
      choices: ["商標法", "著作権法", "不正競争防止法", "意匠法"],
      comment:
          "不正競争防止法は、他者の商品やサービス、商標、宣伝方法などを模倣することによる不正競争を防止し、公正な競争を保持するための法律。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '企業が秘密として管理する技術や営業情報を何というか？',
      ans: '営業秘密',
      choices: ["営業秘密", "著作権情報", "特許情報", "実用新案情報"],
      comment: "営業秘密は、企業が秘密として管理し、競争上の優位性を保つための技術や営業情報で、不正な方法での取得や使用を禁じられている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特定のデータを限られた相手にのみ提供することを許諾するデータの使用形態を何というか？',
      ans: '限定提供データ',
      choices: ["オープンデータ", "限定提供データ", "プライベートデータ", "シェアデータ"],
      comment: "限定提供データは、契約に基づき、特定の条件下でのみ第三者に提供・利用が許可されるデータ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数のユーザーがソフトウェアを利用できるようにするライセンス形態は何か？',
      ans: 'ボリュームライセンス契約',
      choices: [
        "ボリュームライセンス契約",
        "シングルライセンス契約",
        "パーソナルライセンス契約",
        "エンタープライズライセンス契約"
      ],
      comment: "ボリュームライセンス契約は、企業や組織が多数のユーザーに対してソフトウェアを提供できるようにするライセンス形態。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特定のサイトや施設内で無制限にソフトウェアを利用できるライセンス形態を何というか？',
      ans: 'サイトライセンス契約',
      choices: ["サイトライセンス契約", "ユーザーライセンス契約", "デバイスライセンス契約", "グローバルライセンス契約"],
      comment: "サイトライセンス契約は、特定の場所や施設内で、ソフトウェアを無制限に利用できるライセンス形態。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'クライアントアクセスライセンスの略で、サーバーへのアクセス権を与えるライセンスを何というか？',
      ans: 'CAL',
      choices: ["CAL", "SAL", "FAL", "DAL"],
      comment:
          "CAL（Client Access License）は、ユーザーやデバイスがサーバーのサービスにアクセスするための権利を与えるライセンス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '料金を支払うことなく自由に使用できるソフトウェアを何というか？',
      ans: 'フリーソフトウェア',
      choices: ["フリーソフトウェア", "シェアウェア", "コマーシャルソフトウェア", "オープンソースソフトウェア"],
      comment: "フリーソフトウェアは、利用者が無料で使用、コピー、配布することができるソフトウェア。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '試用期間中は無料で利用でき、その後は料金を支払って正式に利用するソフトウェアを何というか？',
      ans: 'シェアウェア',
      choices: ["シェアウェア", "フリーソフトウェア", "オープンソースソフトウェア", "デモソフトウェア"],
      comment: "シェアウェアは、初期の試用期間は無料で利用できるが、その後は利用を継続するために料金を支払う必要があるソフトウェア。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: '著作権者が全ての権利を放棄し、誰でも自由に利用できるようにしたソフトウェアを何というか？',
      ans: 'パブリックドメインソフトウェア',
      choices: ["パブリックドメインソフトウェア", "フリーソフトウェア", "シェアウェア", "オープンソースソフトウェア"],
      comment: "パブリックドメインソフトウェアは、著作権者が著作権を放棄し、誰もが制限なく利用できるようにしたソフトウェア。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ソフトウェアを使用するために、製品の正規性を確認するプロセスを何というか？',
      ans: 'アクティベーション',
      choices: ["アクティベーション", "レジストレーション", "認証", "検証"],
      comment: "アクティベーションは、ソフトウェアの正規性を確認し、ライセンスに基づいて製品を使用する権利を得るためのプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '定期的な支払いによってソフトウェアを利用する契約形態を何というか？',
      ans: 'サブスクリプション',
      choices: ["サブスクリプション", "ワンタイムパーチェス", "ライフタイムライセンス", "リース"],
      comment: "サブスクリプションは、定期的な支払いを行うことでソフトウェアを利用できる契約形態。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '二つ以上の企業が互いに特許などの知的財産権を使用することを許諾し合う契約を何というか？',
      ans: 'クロスライセンス',
      choices: ["クロスライセンス", "シェアライセンス", "マルチライセンス", "ジョイントライセンス"],
      comment: "クロスライセンスは、複数の企業が互いに自社の特許や技術などの知的財産を使用することを許可し合う契約。",
      importance: QuizImportanceType.high,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 401);
  });
}
