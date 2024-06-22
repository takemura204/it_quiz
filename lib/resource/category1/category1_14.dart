import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category1_14 {
  final quizItems = [
    QuizItem(
      word: 'POS（Point of Sale）',
      question: '販売時点情報管理を実現するシステムは何か？',
      ans: 'POS',
      choices: ["POS", "GPS", "RFID", "SFA"],
      comment: "POS（Point of Sale）は、販売時点の情報管理を行うシステムで、販売データの収集や在庫管理などに利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'GPS（Global Positioning System）',
      question: '地球上の任意の位置を特定するために用いられるシステムは何か？',
      ans: 'GPS',
      choices: ["GIS", "GPS", "ETC", "RFID"],
      comment:
          "GPS（Global Positioning System）は、地球上の任意の位置を特定するためのシステムで、衛星を利用して位置情報を提供する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'GIS（Geographic Information System）',
      question: '地理情報を管理・分析するためのシステムは何か？',
      ans: 'GIS',
      choices: ["GPS", "GIS", "ITS", "ETC"],
      comment:
          "GIS（Geographic Information System）は、地理情報を管理・分析するシステムで、空間データの可視化や解析が可能。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ITS（Intelligent Transport Systems）',
      question: '交通システムの効率化を目指して技術を統合したシステムは何か？',
      ans: 'ITS',
      choices: ["GIS", "GPS", "ITS", "ETC"],
      comment:
          "ITS（Intelligent Transport Systems）は、さまざまな交通関連技術を統合して交通システム全体の効率化を目指すシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ETC（Electronic Toll Collection）',
      question: '自動車の通行料金を非接触で自動的に課金するシステムは何か？',
      ans: 'ETC',
      choices: ["ETC", "ITS", "GPS", "RFID"],
      comment: "ETC（Electronic Toll Collection）は、自動車の通行料金を非接触で自動的に課金するシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'RFID(Radio Frequency IDentification)',
      question: '電車の定期券などとして利用される非接触型ICカードに用いられている技術はどれか。',
      ans: 'RFID',
      choices: ["IrDA", "RFID", "バーコード", "無線LAN"],
      comment:
          "RFID(Radio Frequency IDentification)は、ID情報を埋め込んだICタグから電磁界や電波を用い通信可能距離は数cm～数mで無線通信をし情報をやりとりする技術。",
      source: '平成22年春期 問78',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'セルフレジ',
      question: '顧客自身が商品のスキャンから決済までを行うレジシステムは何か？',
      ans: 'セルフレジ',
      choices: ["セルフレジ", "SFA", "ETC", "CTI"],
      comment: "セルフレジは、顧客が自ら商品のバーコードをスキャンし、支払いを行う自動化レジシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'SFA(Sales Force Automation)',
      question: 'SFAの目的に関する記述として，適切なものはどれか。',
      ans: '蓄積された知識やノウハウを組織全体で共有し，営業活動の効率と管理水準の向上を図る。',
      choices: [
        "営業活動で入手した市場ニーズに対応して，製品の改良を図る。",
        "他の優れた企業の業績や組織の分析を通じて，自社の営業組織の見直しを図る。",
        "蓄積された知識やノウハウを組織全体で共有し，営業活動の効率と管理水準の向上を図る。",
        "販売情報を基に，資材の調達から生産，流通，販売までの一連のプロセスを改善して全体の在庫の最適化を図る。"
      ],
      comment:
          "SFA(Sales Force Automation)は、営業支援システムとも呼ばれ、営業活動にモバイル技術やインターネット技術といったITを活用して、営業の質と効率を高め売上や利益の増加につなげようとする仕組み、またはそのシステム。",
      source: '平成27年春期 問13',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'CTI（Computer Telephony Integration）',
      question: '電話システムとコンピュータシステムを統合して運用する技術は何か？',
      ans: 'CTI',
      choices: ["SFA", "CTI", "GPS", "ETC"],
      comment:
          "CTI（Computer Telephony Integration）は、電話システムとコンピュータシステムを統合し、効率的な通信を実現する技術。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'トレーサビリティ',
      question: 'トレーサビリティに該当する事例として，適切なものはどれか。',
      ans: '肉や魚に貼ってあるラベルをよりどころに生産から販売までの履歴を確認できる。',
      choices: [
        "インターネットやWebの技術を利用して，コンピュータを教育に応用する。",
        "開発部門を自社内に抱えずに，開発業務を全て外部の専門企業に任せる。",
        "個人の知識や情報を組織全体で共有し，有効に活用して業績を上げる。",
        "肉や魚に貼ってあるラベルをよりどころに生産から販売までの履歴を確認できる。"
      ],
      comment: "トレーサビリティ(Traceability)は、日本語では追跡可能性といい、追跡できる能力のこと。",
      source: '平成26年春期 問5',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'スマートグリッド',
      question: '電力供給と需要の効率を最適化するための電力ネットワークは何か？',
      ans: 'スマートグリッド',
      choices: ["スマートグリッド", "GIS", "ITS", "GPS"],
      comment: "スマートグリッドは、情報技術を利用して電力供給と需要の効率を最適化するための先進的な電力ネットワーク。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CDN（Content Delivery Network）',
      question: 'コンテンツ配信ネットワークを短縮して何というか？',
      ans: 'CDN',
      choices: ["CDN", "DTP", "GIS", "CTI"],
      comment:
          "CDN（Content Delivery Network）は、地理的に分散されたサーバーネットワークを通じてコンテンツを迅速に配信するためのシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'デジタルツイン',
      question: '物理的な資産とそのデジタル複製を統合し、データを同期させるシステムは何か？',
      ans: 'デジタルツイン',
      choices: ["デジタルツイン", "スマートグリッド", "SFA", "CTI"],
      comment:
          "デジタルツインは、実世界のオブジェクトやプロセスのデジタル的な複製を作り、それをリアルタイムで更新することで物理とデジタルの間の連携を強化するシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'サイバーフィジカルシステム',
      question: '物理的なプロセスとサイバー空間の技術を融合したシステムは何というか？',
      ans: 'サイバーフィジカルシステム',
      choices: ["デジタルツイン", "サイバーフィジカルシステム", "RFID", "GIS"],
      comment: "サイバーフィジカルシステムは、物理的なプロセスと計算プロセスが密接に統合されたシステムで、物理的な環境の監視と制御が可能。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '住民基本台帳ネットワークシステム',
      question: '住民の情報を一元管理する日本のシステムは何か？',
      ans: '住民基本台帳ネットワークシステム',
      choices: ["マイナンバーカード", "住民基本台帳ネットワークシステム", "マイナポータル", "Jアラート"],
      comment: "住民基本台帳ネットワークシステムは、住民の情報をデジタル化し、一元管理するための日本のシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'マイナンバー',
      question: '日本の個人識別番号システムは何というか？',
      ans: 'マイナンバー',
      choices: ["マイナンバーカード", "マイナポータル", "マイナンバー", "住民基本台帳ネットワークシステム"],
      comment: "マイナンバーは、日本の全ての住民に割り当てられる個人識別番号で、公的および一部の私的手続きに使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'マイナンバーカード',
      question: '個人識別番号を証明するためのカードは何か？',
      ans: 'マイナンバーカード',
      choices: ["マイナンバーカード", "マイナポータル", "住民基本台帳ネットワークシステム", "マイナンバー"],
      comment: "マイナンバーカードは、個人のマイナンバーを証明するための公的身分証明書であり、様々なサービスで利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'マイナポータル',
      question: 'マイナンバーを利用して公的手続きをオンラインで行うためのウェブサイトは何か？',
      ans: 'マイナポータル',
      choices: ["マイナポータル", "マイナンバーカード", "Jアラート", "住民基本台帳ネットワークシステム"],
      comment: "マイナポータルは、マイナンバーを利用して様々な公的手続きをオンラインで行うことができるウェブサイト。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '緊急速報',
      question: '国民の安全を確保するため、政府が緊急時に使用する警報システムは何か？',
      ans: '緊急速報',
      choices: ["緊急速報", "Jアラート", "マイナポータル", "AIアシスタント"],
      comment: "緊急速報は、自然災害などの緊急事態が発生した際に、国や自治体が迅速に国民に警報を発するシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'Jアラート',
      question: '日本の防災と危機管理のために導入された全国瞬時警報システムは何というか？',
      ans: 'Jアラート',
      choices: ["緊急速報", "Jアラート", "マイナポータル", "AIアシスタント"],
      comment: "Jアラート（全国瞬時警報システム）は、ミサイル発射などの直接的な脅威が迫った際に、国民に即座に警報を提供するシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'DTP（Desktop Publishing）',
      question: 'デジタルデータやメディアを編集するためのプロセスを何というか？',
      ans: 'DTP',
      choices: ["DTP", "CDN", "SFA", "CTI"],
      comment:
          "DTP（Desktop Publishing）は、パーソナルコンピュータと専用ソフトウェアを使用して、印刷物などのデジタルデータを作成・編集するプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'AI',
      question: '人工知能技術を指す一般的な略称は何か？',
      ans: 'AI',
      choices: ["AI", "DTP", "CTI", "RFID"],
      comment:
          "AI（Artificial Intelligence）は、人間の学習や推論、自己修正などの能力を模倣し、自動的に行動やタスクを実行する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '人間中心のAI社会原則',
      question: '人間の倫理観や利益を中心に考慮したAI開発の指針を何というか？',
      ans: '人間中心のAI社会原則',
      choices: ["人間中心のAI社会原則", "AI利活用ガイドライン", "特化型AI", "汎用AI"],
      comment: "人間中心のAI社会原則は、AI技術が人間の倫理観や利益を尊重し、人間と共存する形で発展することを目指す指針。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'AI利活用ガイドライン',
      question: 'AIの適切な使用を促進するための日本のガイドラインは何か？',
      ans: 'AI利活用ガイドライン',
      choices: ["AI利活用ガイドライン", "人間中心のAI社会原則", "特化型AI", "汎用AI"],
      comment: "AI利活用ガイドラインは、AIの健全な発展と社会への適切な導入を目的として、利用の基本的な枠組みを定める日本のガイドライン。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '特化型AI',
      question: '特定のタスクに特化して設計されたAIは何と呼ばれるか？',
      ans: '特化型AI',
      choices: ["特化型AI", "汎用AI", "AIアシスタント", "データのバイアス"],
      comment: "特化型AIは、特定のタスクや機能に特化して設計された人工知能で、その分野では高いパフォーマンスを発揮する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '汎用AI',
      question: '広範囲のタスクを自立的に学習し、実行できるAIは何と呼ばれるか？',
      ans: '汎用AI',
      choices: ["特化型AI", "汎用AI", "AIアシスタント", "データのバイアス"],
      comment: "汎用AIは、さまざまなタスクを自立的に学習し、実行できる能力を持つAIで、未来のAI技術の究極の形態とされる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'AIアシスタント',
      question: 'ユーザーの操作を支援するために設計されたAIベースのシステムは何か？',
      ans: 'AIアシスタント',
      choices: ["AIアシスタント", "特化型AI", "汎用AI", "データのバイアス"],
      comment: "AIアシスタントは、音声認識やテキスト入力を通じてユーザーの日常的なタスクをサポートするAIベースのシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'データのバイアス',
      question: 'データセットに偏りがあることによるAIの判断の偏りは何と呼ばれるか？',
      ans: 'データのバイアス',
      choices: ["データのバイアス", "アルゴリズムのバイアス", "特化型AI", "汎用AI"],
      comment: "データのバイアスは、入力データに偏りが存在することでAIの判断に偏りが生じる現象。適切なデータ処理が求められる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'アルゴリズムのバイアス',
      question: '処理ロジックの偏りにより、AIが不公平な判断を下す現象は何か？',
      ans: 'アルゴリズムのバイアス',
      choices: ["データのバイアス", "アルゴリズムのバイアス", "特化型AI", "汎用AI"],
      comment: "アルゴリズムのバイアスは、AIが使用するアルゴリズム自体の設計に偏りがあるために、不公平や不正確な判断が生じる現象。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'トロッコ問題',
      question: '倫理的ジレンマを解決するための思考実験の一つで、ある人を犠牲にして多くの人を救うかどうかを問うシナリオは何と呼ばれるか？',
      ans: 'トロッコ問題',
      choices: ["トロッコ問題", "ギフトエコノミー", "パレート効率", "ユーティリタリアニズム"],
      comment: "トロッコ問題は、一人を犠牲にして多数を救うことが倫理的に許されるかを問う思考実験。倫理学の議論でよく使用される。",
      importance: QuizImportanceType.low,
    )
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1401);
  });
}
