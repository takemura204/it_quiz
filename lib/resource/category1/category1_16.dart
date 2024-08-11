import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///e-ビジネス
List<QuizItem> get category1_16 {
  final quizItems = [
    QuizItem(
      word: 'ロングテール',
      question: 'インターネットショッピングのロングテール現象の説明として，適切なものはどれか。',
      ans: '販売に必要なコストが少ないので，売上高の小さな商品を数多く取り扱うことによって利益を上げられること',
      choices: [
        "売上高の大きな商品から得られる利益によって，売上高の小さな商品による損失をカバーすることができること",
        "商品を手にとって見ることができないので，店舗販売に比べて販売開始からヒット商品になるまでの時間が長く掛かるようになること",
        "販売に必要なコストが少ないので，売上高の小さな商品を数多く取り扱うことによって利益を上げられること",
        "ブログに書かれた評価などの影響によって，商品の発売直後から販売が好調で，時間が経過しても衰えないこと"
      ],
      comment:
          "ロングテールとは、「あまり売れない商品が、ネット店舗においては欠かせない収益源になる」とする考え方で、実店舗と異なり、売り場面積を考慮する必要のないオンライン販売市場では、膨大な商品点数を扱うことができる。",
      source: '平成26年春期 問18',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'フリーミアム',
      question: '基本機能を無料で提供しつつ、高度な機能やサービスを有料で提供するビジネスモデルを何というか？',
      ans: 'フリーミアム',
      choices: ["ロングテール", "フリーミアム", "無店舗販売", "EC"],
      comment: "フリーミアムは、基本的な機能やサービスを無料で提供し、追加機能や高度なサービスを有料オプションとして提供するビジネスモデル。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '無店舗販売',
      question: '実店舗を持たずに商品やサービスを販売するビジネススタイルを何というか？',
      ans: '無店舗販売',
      choices: ["フリーミアム", "無店舗販売", "EC", "O2O"],
      comment: "無店舗販売は、実際の店舗を持たずに、インターネットや通信販売などを通じて商品やサービスを提供するビジネススタイル。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'EC（Electronic Commerce）',
      question: 'インターネットを利用して商品やサービスを販売することを何というか？',
      ans: 'EC',
      choices: ["無店舗販売", "EC", "O2O", "BtoC"],
      comment:
          "EC（Electronic Commerce）は、インターネットを利用した商取引のことで、オンラインショップや電子マーケットプレイスなどで商品やサービスが販売される。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'O2O（Online to Offline）',
      question: 'オンラインの情報をオフラインの行動につなげるビジネスモデルを何というか？',
      ans: 'O2O',
      choices: ["EC", "O2O", "BtoC", "CtoC"],
      comment:
          "O2O（Online to Offline）は、オンラインでの情報やサービスを提供し、それをきっかけに消費者が実店舗を訪れるなどオフラインでの消費や行動につなげるビジネスモデル。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'BtoC（Business to Consumer）',
      question: '電子商取引に関するモデルのうち，B to Cモデルの例はどれか。',
      ans: 'インターネットを利用して，個人が株式を売買するオンライントレードシステム',
      choices: [
        "インターネットを利用して，企業間の受発注を行う電子調達システム",
        "インターネットを利用して，個人が株式を売買するオンライントレードシステム",
        "各種の社内手続や連絡，情報，福利厚生サービスなどを提供するシステム",
        "消費者同士が，Webサイト上でオークションを行うシステム"
      ],
      comment:
          "BtoC（Business to Consumer）は、企業が最終消費者である個人に直接商品やサービスを販売するビジネスモデルで、ネットショップでの取引やインターネットを介したサービスの提供などが含まれる。",
      source: '平成27年秋期 問17',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'CtoC（Consumer to Consumer）',
      question: '電子商取引のうち，オークションサイトでの取引など，消費者がメーカーや小売店以外の個人から商品を購入する形態はどれか。',
      ans: 'C to C',
      choices: ["B to B", "B to C", "B to G", "C to C"],
      comment:
          "CtoC（Consumer to Consumer）は、個人間で商品やサービスが売買される取引のことで、オンラインオークションやフリーマーケットアプリなどがこのモデルに該当する。",
      source: '平成24年春期 問23',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'BtoE（Business to Employee）',
      question: 'B to Eの取引に該当するものはどれか。',
      ans: '企業が自社の従業員に対し，インターネットを利用した社員向けの福利厚生，教育などのサービスを提供する。',
      choices: [
        "インターネット上で開催されるオークションで，参加者が他の参加者から商品を購入する。",
        "企業が自社の従業員に対し，インターネットを利用した社員向けの福利厚生，教育などのサービスを提供する。",
        "自動車メーカーがインターネットを利用し，世界中のベンダーから部品や材料を調達する。",
        "旅行会社がインターネットを利用し，消費者向けにキャンペーン案内やチケッ卜の予約販売を行う。"
      ],
      comment:
          "BtoE（Business to Employee）は、企業が従業員に対して直接商品やサービスを提供するビジネスモデル。インターネットを利用した従業員向けの福利厚生、教育などのサービスなどが該当する。",
      source: '平成25年春期 問17',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'EDI（Electronic Data Interchange）',
      question: '企業間で文書やデータを電子的に交換するシステムは何か？',
      ans: 'EDI',
      choices: ["BtoE", "EDI", "EFT", "キャッシュレス決済"],
      comment: "EDI（Electronic Data Interchange）は、注文書や請求書などの文書を企業間で電子的に交換することで、取引の効率化を図るシステム。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'EFT（Electronic Funds Transfer）',
      question: '金融機関間で資金の電子的な移動を行うシステムを何というか？',
      ans: 'EFT',
      choices: ["EDI", "EFT", "キャッシュレス決済", "フィンテック"],
      comment: "EFT（Electronic Funds Transfer）は、銀行口座間で資金を電子的に移動させるシステム。オンラインバンキングや自動振込機などで利用される。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'キャッシュレス決済',
      question: '現金を使用せずに決済を行う方法を総称して何というか？',
      ans: 'キャッシュレス決済',
      choices: ["キャッシュフロー決済", "キャッシュレス決済", "フィンテック", "クラウドファンディング"],
      comment: "キャッシュレス決済は、クレジットカード、電子マネー、QRコード決済など、現金を使用せずに行う決済方法の総称。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'フィンテック（FinTech）',
      question: '金融サービスに情報技術を組み合わせた新しいサービスやビジネスモデルを何というか？',
      ans: 'フィンテック',
      choices: ["ファイナンス", "フィンテック", "クラウドファンディング", "電子マーケットプレース"],
      comment:
          "フィンテック（FinTech）は、FinancialとTechnologyの合成語で、金融サービスに最新の情報技術を組み合わせて提供されるサービスやビジネスモデルを指す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'クラウドファンディング',
      question: '多数の個人から少額の資金を集めてプロジェクトやビジネスを資金調達する方法を何というか？',
      ans: 'クラウドファンディング',
      choices: ["フィンテック", "クラウドファンディング", "電子マーケットプレース", "オンラインモール"],
      comment: "クラウドファンディングは、インターネットを通じて多数の個人から少額の資金を募り、新しいプロジェクトやビジネスの資金調達を行う方法。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '電子マーケットプレース',
      question: 'インターネット上で商品やサービスの売買が行える仮想の市場を何というか？',
      ans: '電子マーケットプレース',
      choices: ["クラウドファンディング", "電子マーケットプレース", "オンラインモール", "電子オークション"],
      comment: "電子マーケットプレースは、インターネット上に設けられた仮想の市場で、様々な出品者が商品やサービスを提供し、購入者がそれを購入できるプラットフォーム。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'オンラインモール',
      question: '複数の店舗が集まるインターネット上のショッピングモールを何というか？',
      ans: 'オンラインモール',
      choices: ["電子マーケットプレース", "オンラインモール", "電子オークション", "インターネットバンキング"],
      comment: "オンラインモールは、インターネット上で複数の店舗が集まり、一つのプラットフォーム内で商品やサービスを提供するショッピングモールの形態。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '電子オークション',
      question: 'インターネットを利用して商品の競売を行うシステムを何というか？',
      ans: '電子オークション',
      choices: ["オンラインモール", "電子オークション", "インターネットバンキング", "電子マネー"],
      comment: "電子オークションは、インターネットを通じて行われる競売のことで、出品者が商品を登録し、購入希望者が価格を競り合うオンラインプラットフォーム。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'インターネットバンキング',
      question: 'インターネットを通じて銀行口座の管理や送金、支払いなどの金融取引を行うサービスを何というか？',
      ans: 'インターネットバンキング',
      choices: ["電子オークション", "インターネットバンキング", "電子マネー", "インターネットトレーディング"],
      comment: "インターネットバンキングは、インターネットを利用して銀行口座の管理や送金、支払いなどの金融取引を自宅や職場などから行えるサービス。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '電子マネー',
      question: 'プリペイド方式で利用されるキャッシュレス決済手段は何か？',
      ans: '電子マネー',
      choices: ["デビットカード", "クレジットカード", "電子マネー", "プリペイドカード"],
      comment:
          "電子マネーは、あらかじめチャージされた金額を基に使用されるプリペイド方式のキャッシュレス決済手段。利用者は事前に金額を決済端末に入金し、店舗などでスムーズに支払いができる。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'インターネットトレーディング',
      question: 'インターネットを通じて証券取引を行うサービスを何というか？',
      ans: 'インターネットトレーディング',
      choices: ["インターネットバンキング", "電子マネー", "インターネットトレーディング", "エスクローサービス"],
      comment: "インターネットトレーディングは、インターネットを利用して株式や投資信託などの証券取引を行うサービス。手軽に取引が行えることが特徴。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'エスクローサービス',
      question: '取引の信頼性を確保するために、第三者が資金の保管や商品の受け渡しを仲介するサービスを何というか？',
      ans: 'エスクローサービス',
      choices: ["インターネットトレーディング", "エスクローサービス", "クラウドソーシング", "暗号資産"],
      comment: "エスクローサービスは、オンライン取引において、資金の保管や商品の受け渡しを第三者が仲介することで取引の信頼性を確保するサービス。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'クラウドソーシング',
      question: 'インターネットを通じて不特定多数から仕事を募集し、外部の人材に業務を委託する手法を何というか？',
      ans: 'クラウドソーシング',
      choices: ["エスクローサービス", "クラウドソーシング", "暗号資産", "アカウントアグリゲーション"],
      comment: "クラウドソーシングは、インターネットを利用して不特定多数の個人や企業から仕事を募集し、外部の人材に業務を委託する手法。多様なスキルを持つ人材の活用が可能。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '暗号資産',
      question: 'デジタル資産または暗号通貨の一般的な呼び名は何か？',
      ans: '暗号資産',
      choices: ["デジタル証券", "ブロックチェーン", "暗号資産", "デジタルマネー"],
      comment: "暗号資産（旧称：仮想通貨）は、ブロックチェーン技術を利用して作られるデジタル形式の資産。代表的なものにビットコインがある。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'アカウントアグリゲーション',
      question: '複数の金融アカウント情報を一元管理するためのサービスは何か？',
      ans: 'アカウントアグリゲーション',
      choices: ["アカウントアグリゲーション", "エスクローサービス", "クラウドソーシング", "フィンテック"],
      comment: "アカウントアグリゲーションは、一つのインターフェースを通じて複数の金融機関の口座情報を一元管理できるサービス。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'eKYC（Electronic Know Your Customer）',
      question: '一度の認証で顧客の身元情報を確認し、金融サービスへのアクセスを提供するプロセスを何というか？',
      ans: 'eKYC',
      choices: ["eKYC", "AML", "KYC", "デジタルID"],
      comment: "eKYC（Electronic Know Your Customer）は、電子的手段を用いて顧客の身元を迅速に確認し、金融サービスへのアクセスを提供するプロセス。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'デビットカード',
      question: 'デビットカードに関する記述のうち，最も適切なものはどれか。',
      ans: '商品購入時に，代金が金融機関の預貯金口座から即時に引き落とされる方式',
      choices: [
        "あらかじめ利用可能金額がカードに記録されている使い切り型の前払い方式",
        "商品購入時に，代金が金融機関の預貯金口座から即時に引き落とされる方式",
        "商品購入やサービス利用時に提示することによって代金決済ができる後払い方式",
        "入金した金額に達するまで利用でき，繰り返し金額を補充できる前払い方式"
      ],
      comment: "デビットカードは、現在使用しているカードで、銀行口座からリアルタイムに代金を直接引き落として決済ができるキャッシュカードの一種。",
      source: '平成26年秋期 問12',
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category1Index + 1601);
  });
}
