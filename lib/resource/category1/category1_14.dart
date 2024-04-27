import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_14 {
  final quizItems = [
    QuizItem(
      question: '販売時点情報管理を実現するシステムは何か？',
      ans: 'POS',
      choices: ["POS", "GPS", "RFID", "SFA"],
      comment: "POS（Point of Sale）は、販売時点の情報管理を行うシステムで、販売データの収集や在庫管理などに利用される。",
    ),
    QuizItem(
      question: '地球上の任意の位置を特定するために用いられるシステムは何か？',
      ans: 'GPS',
      choices: ["GIS", "GPS", "ETC", "RFID"],
      comment:
          "GPS（Global Positioning System）は、地球上の任意の位置を特定するためのシステムで、衛星を利用して位置情報を提供する。",
    ),
    QuizItem(
      question: '地理情報を管理・分析するためのシステムは何か？',
      ans: 'GIS',
      choices: ["GPS", "GIS", "ITS", "ETC"],
      comment:
          "GIS（Geographic Information System）は、地理情報を管理・分析するシステムで、空間データの可視化や解析が可能。",
    ),
    QuizItem(
      question: '交通システムの効率化を目指して技術を統合したシステムは何か？',
      ans: 'ITS',
      choices: ["GIS", "GPS", "ITS", "ETC"],
      comment:
          "ITS（Intelligent Transport Systems）は、さまざまな交通関連技術を統合して交通システム全体の効率化を目指すシステム。",
    ),
    QuizItem(
      question: '自動車の通行料金を非接触で自動的に課金するシステムは何か？',
      ans: 'ETC',
      choices: ["ETC", "ITS", "GPS", "RFID"],
      comment: "ETC（Electronic Toll Collection）は、自動車の通行料金を非接触で自動的に課金するシステム。",
    ),
    QuizItem(
      question: '商品や情報を自動的に識別するために利用される技術は何か？',
      ans: 'RFID',
      choices: ["RFID", "POS", "SFA", "GPS"],
      comment: "RFID（Radio Frequency Identification）は、電波を用いて商品や情報を自動的に識別する技術。",
    ),
    QuizItem(
      question: '顧客自身が商品のスキャンから決済までを行うレジシステムは何か？',
      ans: 'セルフレジ',
      choices: ["セルフレジ", "SFA", "ETC", "CTI"],
      comment: "セルフレジは、顧客が自ら商品のバーコードをスキャンし、支払いを行う自動化レジシステム。",
    ),
    QuizItem(
      question: '営業支援を目的とした情報システムは何か？',
      ans: 'SFA',
      choices: ["CTI", "SFA", "POS", "GIS"],
      comment: "SFA（Sales Force Automation）は、営業活動の効率化をサポートするための情報システム。",
    ),
    QuizItem(
      question: '電話システムとコンピュータシステムを統合して運用する技術は何か？',
      ans: 'CTI',
      choices: ["SFA", "CTI", "GPS", "ETC"],
      comment:
          "CTI（Computer Telephony Integration）は、電話システムとコンピュータシステムを統合し、効率的な通信を実現する技術。",
    ),
    QuizItem(
      question: '製品の製造から消費に至るまでの流通履歴を追跡可能にすることは何か？',
      ans: 'トレーサビリティ',
      choices: ["トレーサビリティ", "RFID", "CTI", "SFA"],
      comment: "トレーサビリティは、製品の製造から消費に至るまでの流通履歴を追跡し、情報の透明性を高めるための概念。",
    ),
    QuizItem(
      question: '電力供給と需要の効率を最適化するための電力ネットワークは何か？',
      ans: 'スマートグリッド',
      choices: ["スマートグリッド", "GIS", "ITS", "GPS"],
      comment: "スマートグリッドは、情報技術を利用して電力供給と需要の効率を最適化するための先進的な電力ネットワーク。",
    ),
    QuizItem(
      question: 'コンテンツ配信ネットワークを短縮して何というか？',
      ans: 'CDN',
      choices: ["CDN", "DTP", "GIS", "CTI"],
      comment:
          "CDN（Content Delivery Network）は、地理的に分散されたサーバーネットワークを通じてコンテンツを迅速に配信するためのシステム。",
    ),
    QuizItem(
      question: '物理的な資産とそのデジタル複製を統合し、データを同期させるシステムは何か？',
      ans: 'デジタルツイン',
      choices: ["デジタルツイン", "スマートグリッド", "SFA", "CTI"],
      comment:
          "デジタルツインは、実世界のオブジェクトやプロセスのデジタル的な複製を作り、それをリアルタイムで更新することで物理とデジタルの間の連携を強化するシステム。",
    ),
    QuizItem(
      question: '物理的なプロセスとサイバー空間の技術を融合したシステムは何というか？',
      ans: 'サイバーフィジカルシステム',
      choices: ["デジタルツイン", "サイバーフィジカルシステム", "RFID", "GIS"],
      comment: "サイバーフィジカルシステムは、物理的なプロセスと計算プロセスが密接に統合されたシステムで、物理的な環境の監視と制御が可能。",
    ),
    QuizItem(
      question: '住民の情報を一元管理する日本のシステムは何か？',
      ans: '住民基本台帳ネットワークシステム',
      choices: ["マイナンバーカード", "住民基本台帳ネットワークシステム", "マイナポータル", "Jアラート"],
      comment: "住民基本台帳ネットワークシステムは、住民の情報をデジタル化し、一元管理するための日本のシステム。",
    ),
    QuizItem(
      question: '日本の個人識別番号システムは何というか？',
      ans: 'マイナンバー',
      choices: ["マイナンバーカード", "マイナポータル", "マイナンバー", "住民基本台帳ネットワークシステム"],
      comment: "マイナンバーは、日本の全ての住民に割り当てられる個人識別番号で、公的および一部の私的手続きに使用される。",
    ),
    QuizItem(
      question: '個人識別番号を証明するためのカードは何か？',
      ans: 'マイナンバーカード',
      choices: ["マイナンバーカード", "マイナポータル", "住民基本台帳ネットワークシステム", "マイナンバー"],
      comment: "マイナンバーカードは、個人のマイナンバーを証明するための公的身分証明書であり、様々なサービスで利用される。",
    ),
    QuizItem(
      question: 'マイナンバーを利用して公的手続きをオンラインで行うためのウェブサイトは何か？',
      ans: 'マイナポータル',
      choices: ["マイナポータル", "マイナンバーカード", "Jアラート", "住民基本台帳ネットワークシステム"],
      comment: "マイナポータルは、マイナンバーを利用して様々な公的手続きをオンラインで行うことができるウェブサイト。",
    ),
    QuizItem(
      question: '国民の安全を確保するため、政府が緊急時に使用する警報システムは何か？',
      ans: '緊急速報',
      choices: ["緊急速報", "Jアラート", "マイナポータル", "AIアシスタント"],
      comment: "緊急速報は、自然災害などの緊急事態が発生した際に、国や自治体が迅速に国民に警報を発するシステム。",
    ),
    QuizItem(
      question: '日本の防災と危機管理のために導入された全国瞬時警報システムは何というか？',
      ans: 'Jアラート',
      choices: ["緊急速報", "Jアラート", "マイナポータル", "AIアシスタント"],
      comment: "Jアラート（全国瞬時警報システム）は、ミサイル発射などの直接的な脅威が迫った際に、国民に即座に警報を提供するシステム。",
    ),
    QuizItem(
      question: 'デジタルデータやメディアを編集するためのプロセスを何というか？',
      ans: 'DTP',
      choices: ["DTP", "CDN", "SFA", "CTI"],
      comment:
          "DTP（Desktop Publishing）は、パーソナルコンピュータと専用ソフトウェアを使用して、印刷物などのデジタルデータを作成・編集するプロセス。",
    ),
    QuizItem(
      question: '人工知能技術を指す一般的な略称は何か？',
      ans: 'AI',
      choices: ["AI", "DTP", "CTI", "RFID"],
      comment:
          "AI（Artificial Intelligence）は、人間の学習や推論、自己修正などの能力を模倣し、自動的に行動やタスクを実行する技術。",
    ),
    QuizItem(
      question: '人間の倫理観や利益を中心に考慮したAI開発の指針を何というか？',
      ans: '人間中心のAI社会原則',
      choices: ["人間中心のAI社会原則", "AI利活用ガイドライン", "特化型AI", "汎用AI"],
      comment: "人間中心のAI社会原則は、AI技術が人間の倫理観や利益を尊重し、人間と共存する形で発展することを目指す指針。",
    ),
    QuizItem(
      question: 'AIの適切な使用を促進するための日本のガイドラインは何か？',
      ans: 'AI利活用ガイドライン',
      choices: ["AI利活用ガイドライン", "人間中心のAI社会原則", "特化型AI", "汎用AI"],
      comment: "AI利活用ガイドラインは、AIの健全な発展と社会への適切な導入を目的として、利用の基本的な枠組みを定める日本のガイドライン。",
    ),
    QuizItem(
      question: '特定のタスクに特化して設計されたAIは何と呼ばれるか？',
      ans: '特化型AI',
      choices: ["特化型AI", "汎用AI", "AIアシスタント", "データのバイアス"],
      comment: "特化型AIは、特定のタスクや機能に特化して設計された人工知能で、その分野では高いパフォーマンスを発揮する。",
    ),
    QuizItem(
      question: '広範囲のタスクを自立的に学習し、実行できるAIは何と呼ばれるか？',
      ans: '汎用AI',
      choices: ["特化型AI", "汎用AI", "AIアシスタント", "データのバイアス"],
      comment: "汎用AIは、さまざまなタスクを自立的に学習し、実行できる能力を持つAIで、未来のAI技術の究極の形態とされる。",
    ),
    QuizItem(
      question: 'ユーザーの操作を支援するために設計されたAIベースのシステムは何か？',
      ans: 'AIアシスタント',
      choices: ["AIアシスタント", "特化型AI", "汎用AI", "データのバイアス"],
      comment: "AIアシスタントは、音声認識やテキスト入力を通じてユーザーの日常的なタスクをサポートするAIベースのシステム。",
    ),
    QuizItem(
      question: 'データセットに偏りがあることによるAIの判断の偏りは何と呼ばれるか？',
      ans: 'データのバイアス',
      choices: ["データのバイアス", "アルゴリズムのバイアス", "特化型AI", "汎用AI"],
      comment: "データのバイアスは、入力データに偏りが存在することでAIの判断に偏りが生じる現象。適切なデータ処理が求められる。",
    ),
    QuizItem(
      question: '処理ロジックの偏りにより、AIが不公平な判断を下す現象は何か？',
      ans: 'アルゴリズムのバイアス',
      choices: ["データのバイアス", "アルゴリズムのバイアス", "特化型AI", "汎用AI"],
      comment: "アルゴリズムのバイアスは、AIが使用するアルゴリズム自体の設計に偏りがあるために、不公平や不正確な判断が生じる現象。",
    ),
    QuizItem(
      question: '倫理的ジレンマを解決するための思考実験の一つで、ある人を犠牲にして多くの人を救うかどうかを問うシナリオは何と呼ばれるか？',
      ans: 'トロッコ問題',
      choices: ["トロッコ問題", "ギフトエコノミー", "パレート効率", "ユーティリタリアニズム"],
      comment: "トロッコ問題は、一人を犠牲にして多数を救うことが倫理的に許されるかを問う思考実験。倫理学の議論でよく使用される。",
    )
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1401);
  });
}
