import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///業務分析・データ利活用
List<QuizItem> get category1_2 {
  final quizItems = [
    QuizItem(
      question: '実際の現場を訪れて、直接情報やデータを収集する調査方法を何というか？',
      ans: 'フィールドワーク',
      choices: ["デスクリサーチ", "フィールドワーク", "ケーススタディ", "リモートリサーチ"],
      comment: "フィールドワークは、研究者や調査者が直接現地に赴き、観察やインタビューなどを通じてデータを収集する調査方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '重要な少数と不重要な多数を区別して表示するグラフを何というか？',
      ans: 'パレート図',
      choices: ["ヒストグラム", "パレート図", "レーダチャート", "散布図"],
      comment: "パレート図は、問題の原因を重要度順に並べ、重要な少数（原因）が全体の大部分の結果を生んでいることを示すグラフ。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '品目を重要度に応じてA、B、Cの3つのカテゴリーに分類する分析方法を何というか？',
      ans: 'ABC分析',
      choices: ["ABC分析", "SWOT分析", "PEST分析", "ポートフォリオ分析"],
      comment: "ABC分析は、在庫管理や売上分析などで品目を重要度に応じてA、B、Cの3つのグループに分けて分析する方法。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '問題の原因と結果の関係を図式化したものを何というか？',
      ans: '特性要因図',
      choices: ["フローチャート", "ガントチャート", "特性要因図", "コンセプトマップ"],
      comment: "特性要因図は、問題の原因と結果の関係を魚の骨の形に図式化したもので、原因分析に用いられる。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'プロセスが統制されているかを監視するために使用されるグラフを何というか？',
      ans: '管理図',
      choices: ["管理図", "プロセスマップ", "ワークフローチャート", "オペレーションチャート"],
      comment: "管理図は、製造やビジネスプロセスなどの品質管理で、プロセスが統制状態にあるかどうかを監視するために使用されるグラフ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '情報や概念を階層的に整理し表示する図を何というか？',
      ans: '系統図',
      choices: ["系統図", "フローチャート", "マインドマップ", "ネットワーク図"],
      comment: "系統図は、生物の分類学や情報の階層構造を示すために使用される、枝分かれする構造を持つ図。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データの傾向を直線で近似する方法で、誤差の二乗和が最小になるように線を引く方法を何というか？',
      ans: '最小二乗法',
      choices: ["最小二乗法", "モンテカルロ法", "ニュートン法", "勾配降下法"],
      comment: "最小二乗法は、観測データに最もよく適合する直線（または曲線）を見つけるために、誤差の二乗和が最小になるように計算する方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '変数間の関係性をモデル化し、一方の変数が他方にどのように影響を与えるかを分析する手法を何というか？',
      ans: '回帰分析',
      choices: ["回帰分析", "相関分析", "因子分析", "クラスタ分析"],
      comment: "回帰分析は、一つ以上の独立変数と従属変数との間の関係をモデル化し、予測や因果関係の推定に用いる統計的手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '二つの変数が関連しているように見えるが、実際には別の変数によって引き起こされている関係を何というか？',
      ans: '擬似相関',
      choices: ["直接相関", "擬似相関", "部分相関", "重相関"],
      comment:
          "擬似相関は、二つの変数間に見られる相関関係が、実際には他の一つまたは複数の変数によって引き起こされることによるもので、直接的な因果関係がない場合の関係。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数の変数間の相関関係を一覧表示するために使用されるグラフの集合を何というか？',
      ans: '散布図',
      choices: ["散布図", "パレート図", "レーダチャート", "ヒートマップ"],
      comment: "散布図マトリックスは、複数の変数間の相関関係を一目で理解できるように、散布図をマトリックス形式で並べて表示したもの。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '複数の基準や要素間の関連を可視化するために用いられる図は何か？',
      ans: 'マトリックス図',
      choices: ["マトリックス図", "パレート図", "ガントチャート", "ヒートマップ"],
      comment:
          "マトリックス図は、複数の基準や要素間の関係性を二次元的に整理し、それらの関連を可視化するために用いられるツール。プロジェクト管理や品質管理でよく使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データの分布を箱とひげで表現したグラフを何というか？',
      ans: '箱ひげ図',
      choices: ["箱ひげ図", "レーダチャート", "ヒストグラム", "折れ線グラフ"],
      comment: "箱ひげ図は、データの中央値、四分位数、外れ値などを視覚的に表現するために用いられるグラフ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データの密度や分布を色の濃淡で表現する図を何というか？',
      ans: 'ヒートマップ',
      choices: ["ヒートマップ", "散布図", "コンターマップ", "バブルチャート"],
      comment: "ヒートマップは、値の大きさを色の濃淡で表現し、データのパターンや相関関係を視覚的に示す図。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数の項目を同時に比較するために使用される多軸グラフを何というか？',
      ans: 'レーダチャート',
      choices: ["レーダチャート", "パイチャート", "バーチャート", "スパイダーチャート"],
      comment:
          "レーダチャートは、複数の項目を同時に比較し、各項目の値を軸にプロットして星形につなげることで、データのパターンを視覚化するグラフ。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'データの分布を表現するために隣接する長方形のバーを使用するグラフを何というか？',
      ans: 'ヒストグラム',
      choices: ["ヒストグラム", "バーチャート", "折れ線グラフ", "パレート図"],
      comment: "ヒストグラムは、データセットをいくつかの区間に分け、各区間に属するデータの数（頻度）を長方形のバーで表したグラフ。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'カテゴリー別のデータを色分けしたタイルで表現する図を何というか？',
      ans: 'モザイク図',
      choices: ["モザイク図", "トレリス図", "ヒートマップ", "タイルマップ"],
      comment: "モザイク図は、カテゴリー別のデータの割合を色分けした四角形のタイルで表現し、データのパターンを視覚的に示す図。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '二つのカテゴリー変数の関係性を分析するために使われる表を何というか？',
      ans: 'クロス集計表',
      choices: ["クロス集計表", "相関表", "頻度分布表", "データマトリックス"],
      comment:
          "クロス集計表は、二つのカテゴリー変数間の関係性を示すために、一方の変数を行、もう一方を列にして、それぞれのカテゴリーの組み合わせに対する頻度や数値を配置した表。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データを分析する際に、特定の変数間の関係性を明らかにするために使用される表を何というか？',
      ans: '分割表',
      choices: ["分割表", "関連表", "ピボットテーブル", "コンティンジェンシーテーブル"],
      comment:
          "分割表は、特定のカテゴリー変数間の関連性や相関を調べるために、それぞれのカテゴリーに属するデータの頻度や数値を整理して表示した表。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '問題解決やアイデア生成の過程で、要素やアイデアを論理的に展開していく図を何というか？',
      ans: 'ロジックツリー',
      choices: ["ロジックツリー", "マインドマップ", "フローチャート", "コンセプトマップ"],
      comment:
          "ロジックツリーは、問題解決の過程で、主要な問題点からサブ問題点へと論理的に展開していくことで、問題の構造を明確にするために使用される図。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '概念やアイデア間の関係を図式化したものを何というか？',
      ans: 'コンセプトマップ',
      choices: ["コンセプトマップ", "思考マップ", "アイデアマップ", "ナレッジマップ"],
      comment: "コンセプトマップは、概念やアイデア間の関係をノードとリンクで表現し、複雑な情報や知識の構造を視覚化するために用いられる図。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'テキストデータを表形式で保存するために用いられるファイル形式を何というか？',
      ans: 'CSV',
      choices: ["CSV", "XML", "JSON", "XLS"],
      comment: "CSVは、データをコンマで区切って表形式で保存するシンプルなテキストファイル形式。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '地理情報システム（GIS）で使用される、地理的なデータを含むファイル形式を何というか？',
      ans: 'シェープファイル',
      choices: ["シェープファイル", "KMLファイル", "GeoJSONファイル", "TopoJSONファイル"],
      comment: "シェープファイルは、地理情報システム（GIS）で使用される、地理的な形状と属性情報を含むファイル形式。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'テキストデータにおいて、一緒に出現する頻度が高いキーワードを分析することを何というか？',
      ans: '共起キーワード',
      choices: ["共起キーワード", "キーワード密度", "メタキーワード", "キーワード最適化"],
      comment:
          "共起キーワードは、テキストデータ分析において、特定の単語やフレーズが文書内で一緒に出現する頻度を分析することで、関連性や文脈を理解するための手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'グラフやチャートにおいて、情報の理解を妨げる不要な装飾や要素を何というか？',
      ans: 'チャートジャンク',
      choices: ["チャートジャンク", "ビジュアルノイズ", "グラフィッククラッター", "デザインオーバーロード"],
      comment: "チャートジャンクは、グラフやチャートにおいて情報の伝達や理解を妨げる、装飾的で不要な要素や視覚的な雑音を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '地理的なデータや位置情報を含むデータセットを何というか？',
      ans: 'GISデータ',
      choices: ["GISデータ", "ビッグデータ", "メタデータ", "トランザクションデータ"],
      comment: "GISデータは、地理情報システム（GIS）で使用される、位置情報や地理的なデータを含むデータセット。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '異なる時点での同じ種類のデータを比較するためのデータを何というか？',
      ans: 'クロスセクションデータ',
      choices: ["クロスセクションデータ", "タイムシリーズデータ", "パネルデータ", "ロングチューディナルデータ"],
      comment: "クロスセクションデータは、異なる時点や場所で同じ種類のデータを収集し、それらを横断的に比較・分析するためのデータ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '統計学で、調査や実験の対象となる全体の集団を何というか？',
      ans: '母集団',
      choices: ["母集団", "標本抽出", "ランダムサンプリング", "クラスターサンプリング"],
      comment: "母集団は、統計学において調査や実験の対象となる全体の集団を指し、この中から一部を選んで標本とする。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '統計的な調査において、母集団から一部のデータを選び出す過程を何というか？',
      ans: '標本抽出',
      choices: ["標本抽出", "母集団", "分散分析", "無作為抽出"],
      comment: "標本抽出は、統計的な調査や研究において、全体の集団（母集団）から代表的なデータの一部（標本）を選び出す過程。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ある仮説が正しいかどうかを統計的に評価する手続きを何というか？',
      ans: '仮説検定',
      choices: ["仮説検定", "データ検証", "因子分析", "変数分析"],
      comment: "仮説検定は、統計学において設定された仮説がデータによってどの程度支持されるか、または棄却されるかを評価する手続き。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '統計的な試験で、帰無仮説を棄却する誤りの確率の上限を何というか？',
      ans: '有意水準',
      choices: ["有意水準", "信頼区間", "p値", "効果量"],
      comment: "有意水準は、統計的仮説検定において、帰無仮説を誤って棄却する確率の上限を設定する値で、通常は5%や1%などが用いられる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '帰無仮説が真のときに、それを誤って棄却する誤りを何というか？',
      ans: '第1種の誤り',
      choices: ["第1種の誤り", "第2種の誤り", "過剰適合", "選択バイアス"],
      comment: "第1種の誤りは、統計的仮説検定において、実際には真である帰無仮説を誤って棄却することによって生じる誤り。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '帰無仮説が偽のときに、それを誤って受容する誤りを何というか？',
      ans: '第2種の誤り',
      choices: ["第1種の誤り", "第2種の誤り", "サンプリングエラー", "測定誤差"],
      comment: "第2種の誤りは、統計的仮説検定において、実際には偽である帰無仮説を誤って受容することによって生じる誤り。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '2つのバリエーションを同時に実施して比較するテストを何というか？',
      ans: 'A/Bテスト',
      choices: ["A/Bテスト", "多変量テスト", "コントロールテスト", "ブラインドテスト"],
      comment:
          "A/Bテストは、ウェブサイトのデザインやマーケティングメールなど、2つのバリエーションAとBを同時にテストし、どちらがより効果的であるかを比較・評価する手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '企業がデータを分析し、意思決定を支援するための技術やプロセスを何というか？',
      ans: 'BI',
      choices: ["BI", "AI", "CRM", "ERP"],
      comment: "BIは、企業が保有する大量のデータを分析し、ビジネス上の意思決定を支援するための技術やプロセス、ツールの総称。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '企業がビジネスの意思決定を支援するために集中的にデータを蓄積・管理するシステムを何というか？',
      ans: 'データウェアハウス',
      choices: ["データウェアハウス", "データマート", "データレイク", "データベース"],
      comment:
          "データウェアハウスは、企業がさまざまな情報源から収集したデータを統合し、分析やレポーティングのために一元的に管理・保存するシステム。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '大量のデータからパターンや関連性を発見するための分析プロセスを何というか？',
      ans: 'データマイニング',
      choices: ["データマイニング", "データスクレイピング", "データクレンジング", "データアーキテクチャ"],
      comment: "データマイニングは、大量のデータセットを分析し、統計的手法や機械学習などを用いて未知のパターンや関連性を発見するプロセス。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '非常に大量で複雑なデータセットを指し、従来のデータベースやデータ処理アプリケーションでは扱いにくいデータを何というか？',
      ans: 'ビッグデータ',
      choices: ["ビッグデータ", "メタデータ", "オープンデータ", "クラウドデータ"],
      comment:
          "ビッグデータは、その規模、速度、多様性によって従来のデータベース管理ツールでは処理や分析が困難な非常に大量かつ複雑なデータセット。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'テキストデータから有用な情報を抽出し、パターンを発見するための分析手法を何というか？',
      ans: 'テキストマイニング',
      choices: ["テキストマイニング", "コンテンツマイニング", "ウェブマイニング", "ソーシャルメディアマイニング"],
      comment:
          "テキストマイニングは、自然言語処理（NLP）や機械学習などの技術を用いて、テキストデータから情報を抽出し、構造化されていないデータの中からパターンや関連性を発見する分析手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データ分析やモデリングによって洞察を得るための技術や方法論を駆使する専門家を何というか？',
      ans: 'データサイエンティスト',
      choices: ["データサイエンティスト", "データアナリスト", "データエンジニア", "ビジネスアナリスト"],
      comment:
          "データサイエンティストは、数学や統計学、機械学習、データマイニングなどの専門知識を活用して、大量のデータから有益な情報を抽出し、ビジネスや研究に役立てる専門家。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データサイエンスプロジェクトにおける一連のプロセスを指す言葉は何か？',
      ans: 'データサイエンスのサイクル',
      choices: ["データサイエンスのサイクル", "アジャイル開発", "ウォーターフォールモデル", "データライフサイクル"],
      comment:
          "データサイエンスのサイクルは、問題の定義、データの収集と前処理、探索的データ分析、モデルの構築と評価、結果の解釈とコミュニケーションに至るまでの、データサイエンスプロジェクトにおける一連のステップ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '多くの人が自由にアイデアを出し合うことで、新しいアイデアや解決策を生み出す集団的な創造活動を何というか？',
      ans: 'ブレーンストーミング',
      choices: ["ブレーンストーミング", "マインドマッピング", "アイデアソン", "シンクタンク"],
      comment:
          "ブレーンストーミングは、参加者が自由にアイデアを出し合い、批判や評価を避けながら、新しいアイデアや創造的な解決策を引き出すためのグループ活動。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'アイデアを個別に書き出し、その後で共有・評価するブレーンストーミングのバリエーションを何というか？',
      ans: 'ブレーンライティング',
      choices: ["ブレーンライティング", "アイデアマラソン", "サイレントブレーンストーミング", "クリエイティブライティング"],
      comment:
          "ブレーンライティングは、アイデアを個々に静かに書き出し、その後で集めて共有・評価する、ブレーンストーミングのバリエーションで、より内向的な参加者も参加しやすい方法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '関連するアイデアや情報を視覚的にグルーピングして整理する手法を何というか？',
      ans: '親和図法',
      choices: ["親和図法", "SWOT分析", "マトリクス図法", "ペルソナ法"],
      comment:
          "親和図法は、ブレーンストーミングで生み出されたアイデアや情報を、類似性や関連性に基づいてグルーピングし、大きなテーマやカテゴリに整理していく手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データを分類するために使用される、分岐する木構造のモデルを何というか？',
      ans: 'デシジョンツリー',
      choices: ["デシジョンツリー", "ニューラルネットワーク", "ランダムフォレスト", "クラスタリング"],
      comment: "デシジョンツリーは、データを分類したり予測したりするために使用される、条件分岐によって構成される木構造のモデル。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '実際に実行する前にコンピュータを使って実験やテストを行うことを何というか？',
      ans: 'シミュレーション',
      choices: ["シミュレーション", "プロトタイピング", "ベンチマーキング", "デバッギング"],
      comment:
          "シミュレーションは、実世界のプロセスやシステムをモデル化し、コンピュータ上でその挙動を再現・分析することで、予測や理解を深める手法。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 201);
  });
}
