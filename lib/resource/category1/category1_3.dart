import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///会計・財務
List<QuizItem> get category1_3 {
  final quizItems = [
    QuizItem(
      word: '売上総利益',
      question: '売上から売上原価を引いた金額を何というか？',
      ans: '売上総利益',
      choices: ["売上高", "売上総利益", "営業利益", "純利益"],
      comment: "売上総利益は、売上から売上原価を引いた後の利益で、企業の商品やサービスの販売から得られる粗利益を示す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '営業利益',
      question: '損益計算書の営業利益の算出に関係する費用はどれか。',
      ans: '広告宣伝費',
      choices: ["広告宣伝費", "固定資産売却損", "支払利息", "法人税"],
      comment: "営業利益は、売上総利益から販売費及び一般管理費を引いた後の利益で、企業の本業から得られる利益を示す。",
      source: '平成23年秋期 問9',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '経常利益',
      question: '営業利益に営業外収益と営業外費用を加減した金額を何というか？',
      ans: '経常利益',
      choices: ["営業利益", "経常利益", "純利益", "売上総利益"],
      comment: "経常利益は、営業利益に営業外収益と営業外費用を加減した後の利益で、企業の通常の事業活動から得られる利益を示す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '損益分岐点',
      question: '製造・販売業A社の損益分岐点売上高を下げる施策として，最も適切なものはどれか。',
      ans: '人件費の抑制と，間接部門の合理化を進める。',
      choices: [
        "現状と同一の設備を追加し，生産量の増加を図る",
        "人件費の抑制と，間接部門の合理化を進める。",
        "販売価格は一定のまま，製品の販売数量増大を図る。",
        "販売数量は現状のまま，製品の販売価格を下げる。"
      ],
      comment:
          "損益分岐点は、損益分岐点売上高＝固定費÷(1－変動費率)の公式で、企業の利益がゼロになる売上高の点で、この点を超えると利益が発生し、損益分岐点売上高を下げるためには、固定費、または変動費率を下げることが必要。",
      source: '平成23年特別 問21',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: '変動費',
      question: '単価200円の商品を5万個販売したところ， 300万円の利益を得た。固定費が300万円のとき，商品1個当たりの変動費は何円か。',
      ans: '80',
      choices: ["60", "80", "100", "140"],
      comment: "変動費は、製造業における「材料費」や「運搬費」などのように、売上の増加に伴って増加していく性質を持つ費用。",
      source: '平成23年秋期 問6',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '固定費',
      question: '売上高の増減に関わらず一定の費用を何というか？',
      ans: '固定費',
      choices: ["固定費", "変動費", "可変費", "定額費"],
      comment: "固定費は、売上高の増減にかかわらず一定である費用で、家賃や人件費などが該当する。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '貸借対照表',
      question: '親会社が，子会社を含めた企業集団の決算日における資産と負債，純資産を対比して示すことによって，企業集団の財政状態を表す連結財務諸表はどれか。',
      ans: '連結貸借対照表',
      choices: ["連結株主資本等変動計算書", "連結キャッシュフロー計算書", "連結損益計算書", "連結貸借対照表"],
      comment:
          "貸借対照表は、大企業が決算書を作成するときに、株式を保有する子会社や関連会社などのグループ会社の業績を足し合わせて作成する財務諸表のことで、資産、負債、純資産の三つの部門に分けて示した会計報告書。",
      source: '平成22年春期 問10',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '損益計算書',
      question: '損益計算書を説明したものはどれか。',
      ans: '一会計期間における経営成績を表示したもの',
      choices: [
        "一会計期間における経営成績を表示したもの",
        "一会計期間における現金収支の状況を表示したもの",
        "企業の一定時点における財務状態を表示したもの",
        "純資産の部の変動額を計算し表示したもの"
      ],
      comment: "損益計算書は、企業が一定期間にわたって行った事業活動の結果として生じた収益と費用、及びその期間の利益または損失を示す報告書。",
      source: '平成25年秋期 問13',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'キャッシュフロー計算書',
      question: '商品の販売による収入は，キャッシュフロー計算書のどの部分に記載されるか。',
      ans: '営業活動によるキャッシュフロー',
      choices: ["営業活動によるキャッシュフロー", "財務活動によるキャッシュフロー", "投資活動によるキャッシュフロー", "キャッシュフロー計算書には記載されない。"],
      comment:
          "キャッシュフロー計算書は、企業会計について報告する財務諸表で、会計期間における資金（現金及び現金同等物）の増減、収入と支出（キャッシュ・フロー）を営業活動・投資活動・財務活動ごとに区分して表示する書類。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '株主資本等変動計算書',
      question: '一定期間の株主資本の増減を示す報告書を何というか？',
      ans: '株主資本等変動計算書',
      choices: ["株主資本等変動計算書", "貸借対照表", "損益計算書", "キャッシュフロー計算書"],
      comment: "株主資本等変動計算書は、報告期間における株主資本の増加または減少を、配当、自己株式取得、新株発行などの要因別に示した報告書。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '連結財務諸表',
      question: '親会社が，子会社を含めた企業集団の決算日における資産と負債，純資産を対比して示すことによって，企業集団の財政状態を表す連結財務諸表はどれか。',
      ans: '連結貸借対照表',
      choices: ["連結株主資本等変動計算書", "連結キャッシュフロー計算書", "連結損益計算書", "連結貸借対照表"],
      comment: "連結財務諸表は、大企業が決算書を作成するときに、株式を保有する子会社や関連会社などのグループ会社の業績を足し合わせて作成する財務諸表。",
      source: '平成22年春期 問10',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '流動比率',
      question: '流動資産と流動負債の比率を何というか？',
      ans: '流動比率',
      choices: ["流動比率", "固定比率", "自己資本比率", "総資本回転率"],
      comment: "流動比率は、企業の短期的な支払い能力を示す指標で、流動資産を流動負債で割った比率。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '総勘定元帳',
      question: '企業の全ての勘定科目の取引を記録する帳簿を何というか？',
      ans: '総勘定元帳',
      choices: ["総勘定元帳", "日記帳", "補助簿", "仕訳帳"],
      comment: "総勘定元帳は、企業の全ての勘定科目に関する取引を体系的に記録する基本的な帳簿。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ROE',
      question: 'ROE(Return On Equity)を説明したものはどれか。',
      ans: '自己資本に対して，どれだけの利益を生み出したかを表す指標',
      choices: [
        "株主だけでなく，債権者も含めた資金提供者の立場から，企業が所有している資産全体の収益性を表す指標",
        "株主の立場から，企業が，どれだけ資本コストを上回る利益を生み出したかを表す指標",
        "現在の株価が，前期実績又は今期予想の1株当たり利益の何倍かを表す指標",
        "自己資本に対して，どれだけの利益を生み出したかを表す指標"
      ],
      comment:
          "ROE(Return On Equity，自己資本利益率)は、自己資本（純資産）に対する当期純利益の割合を示す指標で、ある企業が、一会計期間の企業活動を通じて「株主の投資額に比してどれだけ効率的に利益を獲得したか」を判断する指標。",
      source: '平成25年秋期 問3',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'ROI(Return on Investment)',
      question: 'システム化計画において，情報システムの費用対効果を評価する。その評価指標として，適切なものはどれか。',
      ans: 'ROI',
      choices: ["PER", "ROI", "自己資本比率", "流動比率"],
      comment: "ROI(Return on Investment)は、効果金額を投資額で割ったもので、投資額に対してどの程度の利益が生み出されたかを測る指標。",
      importance: ImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category1Index + 301);
  });
}
