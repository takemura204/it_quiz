import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_1 {
  final quizItems = [
    QuizItem(
      question: '統計モデルや機械学習モデルにおいて、予測または説明を目的として結果を表す変数を何というか？',
      ans: '目的変数',
      choices: ["目的変数", "説明変数", "独立変数", "従属変数"],
      comment: "目的変数は、統計モデルや機械学習モデルにおいて、予測または説明の目的で出力される結果を表す変数。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '統計モデルや機械学習モデルにおいて、目的変数の値を予測するために用いられる変数を何というか？',
      ans: '説明変数',
      choices: ["説明変数", "目的変数", "独立変数", "従属変数"],
      comment: "説明変数は、統計モデルや機械学習モデルにおいて、目的変数の値を予測または説明するために用いられる変数。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '一つまたは複数の説明変数と目的変数との関係をモデリングする統計学的手法は何か？',
      ans: '回帰分析',
      choices: ["回帰分析", "相関分析", "因子分析", "クラスタ分析"],
      comment: "回帰分析は、一つまたは複数の説明変数と目的変数との関係をモデリングし、その関係性の強さや方向を解析する統計学的手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '二つの変数間の関連の強さや方向を調べる統計学的手法は何か？',
      ans: '相関分析',
      choices: ["相関分析", "回帰分析", "分散分析", "共分散分析"],
      comment: "相関分析は、二つの変数間の関連の強さや方向を調べる統計学的手法で、相関係数を用いて分析を行う。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データを測定する際に用いられる、その特性を数値またはカテゴリーに割り当てる基準を何というか？',
      ans: '尺度',
      choices: ["尺度", "パラメータ", "インデックス", "スケール"],
      comment: "尺度は、データの測定に用いられる基準で、名義尺度、順序尺度、間隔尺度、比率尺度などがある。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ノード（頂点）とエッジ（辺）から構成される数学的構造を研究する理論は何か？',
      ans: 'グラフ理論',
      choices: ["グラフ理論", "集合理論", "確率理論", "代数学"],
      comment:
          "グラフ理論は、ノード（頂点）とエッジ（辺）から構成されるグラフと呼ばれる数学的構造を研究する理論で、ネットワーク分析などに応用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ある制約条件の下で、目的関数を最大化または最小化する値を見つけ出す問題を何というか？',
      ans: '最適化問題',
      choices: ["最適化問題", "決定問題", "探索問題", "組み合わせ問題"],
      comment:
          "最適化問題は、ある制約条件のもとで目的関数の最大値または最小値を求める問題で、数学や工学、経済学など多岐にわたる分野で応用される。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 101);
  });
}
