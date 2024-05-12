import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///マーケティング
List<QuizItem> get category1_10 {
  final quizItems = [
    QuizItem(
      question: 'ユーザーが製品やサービスを使用する際の経験全般を指す言葉は何か？',
      ans: 'UX',
      choices: ["UX", "4P", "4C", "RFM分析"],
      comment:
          "UX（User Experience）は、ユーザーが製品やサービスを使用する際の経験全般を指し、使いやすさや満足度などが含まれる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'マーケティングの基本的なフレームワークで、製品、価格、流通、プロモーションの4つの要素を何というか？',
      ans: '4P',
      choices: ["UX", "4P", "4C", "RFM分析"],
      comment:
          "4Pは、マーケティング戦略を立てる際の基本的なフレームワークで、Product（製品）、Price（価格）、Place（流通）、Promotion（プロモーション）の4つの要素を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '顧客の視点からマーケティングの4つの要素を捉え直したもので、顧客価値、コスト、利便性、コミュニケーションを指す言葉は何か？',
      ans: '4C',
      choices: ["4P", "4C", "RFM分析", "アンゾフの成長マトリクス"],
      comment:
          "4Cは、顧客中心のマーケティング戦略を立てるためのフレームワークで、Customer value（顧客価値）、Cost（コスト）、Convenience（利便性）、Communication（コミュニケーション）の4つの要素を指す。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: '顧客の過去の購買行動を最近性、頻度、金額の3つの観点から分析する手法は何か？',
      ans: 'RFM分析',
      choices: ["4C", "RFM分析", "アンゾフの成長マトリクス", "オピニオンリーダー"],
      comment:
          "RFM分析は、顧客の購買行動をRecency（最近性）、Frequency（頻度）、Monetary（金額）の3つの観点から分析し、顧客の価値を評価する手法。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '市場の拡大と製品の開発に焦点を当てた成長戦略を体系的に示したマトリクスを何というか？',
      ans: 'アンゾフの成長マトリクス',
      choices: ["RFM分析", "アンゾフの成長マトリクス", "オピニオンリーダー", "オムニチャネル"],
      comment:
          "アンゾフの成長マトリクスは、市場浸透、市場開発、製品開発、多角化の4つの戦略を用いて、企業の成長戦略を体系的に示したマトリクス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特定の製品やブランドに影響力を持ち、他人に意見を与える人を何というか？',
      ans: 'オピニオンリーダー',
      choices: ["アンゾフの成長マトリクス", "オピニオンリーダー", "オムニチャネル", "ブランド戦略"],
      comment: "オピニオンリーダーは、特定の製品やブランドに対して影響力を持ち、他人の意見形成に影響を与える人のこと。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'オンラインとオフラインの複数の販売チャネルを一元的に管理し、顧客にシームレスな購買体験を提供する戦略は何か？',
      ans: 'オムニチャネル',
      choices: ["オピニオンリーダー", "オムニチャネル", "ブランド戦略", "プロダクトライフサイクル"],
      comment: "オムニチャネルは、オンラインとオフラインを含む複数の販売チャネルを統合し、顧客に一貫したショッピング体験を提供する戦略。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '企業が長期的に構築し、維持していく自社製品のイメージや価値観を何というか？',
      ans: 'ブランド戦略',
      choices: ["オムニチャネル", "ブランド戦略", "プロダクトライフサイクル", "セグメントマーケティング"],
      comment: "ブランド戦略は、企業が自社の製品やサービスに関連付けるイメージや価値観を構築し、長期的に維持、発展させていくための戦略。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '企業が製品やサービスを市場に投入してから撤退するまでの各段階を示すモデルを何というか？',
      ans: 'プロダクトライフサイクル',
      choices: ["オムニチャネル", "ブランド戦略", "プロダクトライフサイクル", "ポジショニング"],
      comment:
          "プロダクトライフサイクルは、製品やサービスが市場導入、成長、成熟、衰退という各段階を経ていく過程を示すモデル。各段階でのマーケティング戦略が異なる。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '市場内での製品やブランドの位置づけを戦略的に決定することを何というか？',
      ans: 'ポジショニング',
      choices: ["セグメントマーケティング", "ダイレクトマーケティング", "ポジショニング", "クロスメディアマーケティング"],
      comment:
          "ポジショニングは、製品やブランドを市場内でどのように位置づけ、消費者の心にどのようなイメージを植え付けるかを戦略的に決定するプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '市場を細分化し、特定のセグメントに焦点を当ててマーケティング活動を行うことを何というか？',
      ans: 'セグメントマーケティング',
      choices: ["ポジショニング", "セグメントマーケティング", "インバウンドマーケティング", "ソーシャルマーケティング"],
      comment:
          "セグメントマーケティングは、市場を細分化し、特定のニーズ、特徴、行動パターンを持つ顧客セグメントに焦点を当ててマーケティング活動を行うアプローチ。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '顧客から直接注文を受けて商品やサービスを提供するマーケティング手法を何というか？',
      ans: 'ダイレクトマーケティング',
      choices: [
        "セグメントマーケティング",
        "ダイレクトマーケティング",
        "クロスメディアマーケティング",
        "インバウンドマーケティング"
      ],
      comment:
          "ダイレクトマーケティングは、広告やプロモーションを通じて直接顧客にアプローチし、郵便、電話、インターネットなどを使って直接注文を受け、商品やサービスを提供する手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数のメディアを組み合わせて一貫したメッセージを伝えるマーケティング手法を何というか？',
      ans: 'クロスメディアマーケティング',
      choices: [
        "ダイレクトマーケティング",
        "クロスメディアマーケティング",
        "インバウンドマーケティング",
        "ソーシャルマーケティング"
      ],
      comment:
          "クロスメディアマーケティングは、テレビ、ラジオ、インターネット、印刷物など複数のメディアを組み合わせて、一貫したメッセージを顧客に伝えるマーケティング手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '顧客が自発的に企業のコンテンツや製品に関心を持ち、接触してくるマーケティング手法を何というか？',
      ans: 'インバウンドマーケティング',
      choices: [
        "クロスメディアマーケティング",
        "インバウンドマーケティング",
        "ソーシャルマーケティング",
        "ワントゥワンマーケティング"
      ],
      comment:
          "インバウンドマーケティングは、有益なコンテンツを提供し、顧客が自発的に企業のウェブサイトやブログなどに関心を持ち、接触してくるマーケティング手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '社会的な課題の解決を目的として行われるマーケティング手法を何というか？',
      ans: 'ソーシャルマーケティング',
      choices: ["インバウンドマーケティング", "ソーシャルマーケティング", "ワントゥワンマーケティング", "プッシュ戦略"],
      comment: "ソーシャルマーケティングは、公衆衛生の向上、環境保護など社会的な課題の解決を目的として行われるマーケティング手法。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: '一人ひとりの顧客に合わせたカスタマイズされたマーケティング手法を何というか？',
      ans: 'ワントゥワンマーケティング',
      choices: ["ソーシャルマーケティング", "ワントゥワンマーケティング", "プッシュ戦略", "プル戦略"],
      comment:
          "ワントゥワンマーケティングは、顧客一人ひとりの特性やニーズを把握し、個別に最適化された製品やサービス、情報を提供するマーケティング手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '企業が積極的に製品やサービスを顧客に提案し、販売を促進するマーケティング手法を何というか？',
      ans: 'プッシュ戦略',
      choices: ["ワントゥワンマーケティング", "プッシュ戦略", "プル戦略", "Webマーケティング"],
      comment:
          "プッシュ戦略は、流通業者や小売業者を通じて製品を積極的に市場に押し出し（プッシュ）、顧客に製品を購入してもらうマーケティング手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '顧客が自発的に製品やサービスを求めるように促すマーケティング手法を何というか？',
      ans: 'プル戦略',
      choices: ["プッシュ戦略", "プル戦略", "Webマーケティング", "インターネット広告"],
      comment: "プル戦略は、広告やプロモーションを通じて顧客の関心を引き、顧客が自発的に製品やサービスを求めるように促すマーケティング手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'インターネットを利用したマーケティング手法全般を何というか？',
      ans: 'Webマーケティング',
      choices: ["プル戦略", "Webマーケティング", "インターネット広告", "オプトインメール広告"],
      comment: "Webマーケティングは、ウェブサイトやSNS、電子メールなどインターネットを利用したマーケティング活動全般を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'メール受信者がメールリストに自ら登録するプロセスを何というか？',
      ans: 'オプトインメール広告',
      choices: ["オプトインメール広告", "バナー広告", "リスティング広告", "ダイレクトマーケティング"],
      comment: "オプトインメール広告は、受信者が自らメールリストへの登録を行い、その後マーケティングメールを受け取るシステム。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ウェブサイト上の特定の位置に掲載される視覚的な広告形式を何というか？',
      ans: 'バナー広告',
      choices: ["リスティング広告", "バナー広告", "オプトインメール広告", "クロスセリング"],
      comment: "バナー広告は、ウェブサイトの特定の場所に表示される画像やアニメーションを含む広告形式で、視覚的に訴求する。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '検索エンジンの検索結果に関連した広告を表示することを何というか？',
      ans: 'リスティング広告',
      choices: ["リスティング広告", "SEO", "バナー広告", "ディジタルサイネージ"],
      comment: "リスティング広告は、検索エンジンの検索結果ページに、ユーザーの検索クエリに基づいて関連する広告を表示するシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '1対1の関係を重視し、個々の顧客に合わせた製品やサービスを提供するマーケティング手法を何というか？',
      ans: 'ワントゥワンマーケティング',
      choices: ["ワントゥワンマーケティング", "クロスセリング", "プル戦略", "ダイナミックプライシング"],
      comment:
          "ワントゥワンマーケティングは、顧客一人ひとりの特性やニーズを把握し、個別に最適化された製品やサービスを提供するマーケティング手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '企業や商品の認知度向上のために、インターネットを使用した広告全般を何というか？',
      ans: 'インターネット広告',
      choices: ["ウェブマーケティング", "インターネット広告", "オプトインメール広告", "リスティング広告"],
      comment: "インターネット広告は、ウェブサイト、ソーシャルメディア、その他オンラインプラットフォームを通じて行われる広告活動全般。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブサイトを検索エンジンで上位に表示させるための技術や手法を何というか？',
      ans: 'SEO',
      choices: ["リスティング広告", "SEO", "アフィリエイト", "レコメンデーション"],
      comment:
          "SEO（Search Engine Optimization）は、検索エンジン最適化のことで、ウェブサイトを検索エンジンで上位に表示させるための技術や手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '他者のウェブサイトに自社の広告を設置し、成果に応じて報酬を支払う広告手法を何というか？',
      ans: 'アフィリエイト',
      choices: ["SEO", "アフィリエイト", "レコメンデーション", "ディジタルサイネージ"],
      comment: "アフィリエイトは、他者のウェブサイトに自社の広告を設置し、成果に応じて報酬を支払うインターネット広告の手法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ウェブサイトやアプリがユーザーの行動や嗜好に基づいて個別の製品やコンテンツを推薦する機能を何というか？',
      ans: 'レコメンデーション',
      choices: ["アフィリエイト", "レコメンデーション", "ディジタルサイネージ", "スキミングプライシング"],
      comment:
          "レコメンデーションは、過去の購買履歴や閲覧履歴などユーザーの行動データに基づいて、個別に最適化された製品やコンテンツを推薦する機能。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '公共の場所でデジタル技術を用いて情報や広告を表示するシステムを何というか？',
      ans: 'ディジタルサイネージ',
      choices: ["レコメンデーション", "ディジタルサイネージ", "スキミングプライシング", "ペネトレーションプライシング"],
      comment: "ディジタルサイネージは、ショッピングモールや空港など公共の場所で、デジタル技術を用いて情報や広告を表示するシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '新製品を高価格で販売し、その後徐々に価格を下げる価格設定戦略を何というか？',
      ans: 'スキミングプライシング',
      choices: ["ディジタルサイネージ", "スキミングプライシング", "ペネトレーションプライシング", "ダイナミックプライシング"],
      comment: "スキミングプライシングは、新製品を市場に導入する際に初期に高価格で販売し、徐々に価格を下げていく価格設定戦略。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '新製品を低価格で販売し、迅速に市場を拡大する価格設定戦略を何というか？',
      ans: 'ペネトレーションプライシング',
      choices: ["スキミングプライシング", "ペネトレーションプライシング", "ダイナミックプライシング", "リテールサポート"],
      comment:
          "ペネトレーションプライシングは、新製品を市場に導入する際に低価格で販売し、迅速に市場シェアを拡大することを目指す価格設定戦略。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '需要や在庫状況に応じて価格をリアルタイムで変動させる価格設定戦略を何というか？',
      ans: 'ダイナミックプライシング',
      choices: ["ペネトレーションプライシング", "ダイナミックプライシング", "リテールサポート", "クロスセリング"],
      comment: "ダイナミックプライシングは、需要や在庫状況、競合他社の価格などの要因に応じて、価格をリアルタイムで変動させる価格設定戦略。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '小売店への販売促進活動やサポートを強化することで、製品の小売業者による取り扱いを増やす戦略を何というか？',
      ans: 'リテールサポート',
      choices: ["ダイナミックプライシング", "リテールサポート", "クロスセリング", "バスケット分析"],
      comment:
          "リテールサポートは、小売業者への販売促進活動やサポートを強化することにより、製品の小売業者による取り扱いを増やし、販売促進を図る戦略。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: '顧客がある製品を購入する際に、関連する別の製品も同時に購入することを促す販売戦略を何というか？',
      ans: 'クロスセリング',
      choices: ["リテールサポート", "クロスセリング", "バスケット分析", "ESG投資"],
      comment: "クロスセリングは、顧客がある製品を購入する際に、その製品と関連する別の製品も推薦し、同時に購入することを促す販売戦略。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '顧客の購買データを分析し、購入される製品間の関連性を明らかにする分析手法を何というか？',
      ans: 'バスケット分析',
      choices: ["クロスセリング", "バスケット分析", "ESG投資", "ファイブフォース分析"],
      comment:
          "バスケット分析は、顧客の購買データから、一緒に購入される傾向にある製品の組み合わせを分析し、製品間の関連性を明らかにする分析手法。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1001);
  });
}
