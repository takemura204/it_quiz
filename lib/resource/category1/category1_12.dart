import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_12 {
  final quizItems = [
    QuizItem(
      question: '親会社と子会社を合わせた財務諸表を何というか？',
      ans: '連結財務諸表',
      choices: ["連結財務諸表", "単体財務諸表", "合併財務諸表", "総合財務諸表"],
      comment: "連結財務諸表は、親会社とその子会社群を一つの経済単位とみなし、まとめて作成される財務諸表。",
    ),
    QuizItem(
      question: '流動資産と流動負債の比率を何というか？',
      ans: '流動比率',
      choices: ["流動比率", "固定比率", "自己資本比率", "総資本回転率"],
      comment: "流動比率は、企業の短期的な支払い能力を示す指標で、流動資産を流動負債で割った比率。",
    ),
    QuizItem(
      question: '企業の全ての勘定科目の取引を記録する帳簿を何というか？',
      ans: '総勘定元帳',
      choices: ["総勘定元帳", "日記帳", "補助簿", "仕訳帳"],
      comment: "総勘定元帳は、企業の全ての勘定科目に関する取引を体系的に記録する基本的な帳簿。",
    ),
    QuizItem(
      question: '企業の総資産に対する純利益の割合を示す指標を何というか？',
      ans: 'ROE',
      choices: ["ROE", "ROI", "ROA", "ROS"],
      comment: "ROEは、株主資本利益率とも呼ばれ、企業の自己資本に対する純利益の割合を示す指標。",
    ),
    QuizItem(
      question: '投資に対する利益の割合を示す指標を何というか？',
      ans: 'ROI',
      choices: ["ROI", "ROE", "ROA", "ROS"],
      comment: "ROIは、投資利益率とも呼ばれ、投資に対する利益の割合を示す指標。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 111);
  });
}
