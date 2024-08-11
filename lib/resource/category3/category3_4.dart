import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_4 {
  final quizItems = [
    QuizItem(
      word: 'フローチャート',
      question: 'プログラムの処理手順を図式を用いて視覚的に表したものはどれか。',
      ans: 'フローチャート',
      choices: ["ガントチャート", "データフローダイアグラム", "フローチャート", "レーダーチャート"],
      comment:
          "フローチャートは、プログラムの処理手順を記述する代表的な図で、処理やプロセスを四角い箱、分岐判断をひし形で表し、それらの間を実践や矢印でつないでアルゴリズムや処理の流れを表現する。",
      source: '平成27年春期 問59',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '線形探索法',
      question: 'リストや配列の各要素を順番に調べて目的の値を探し出す探索法は何か？',
      ans: '線形探索法',
      choices: ["線形探索法", "2分探索法", "ハッシュ法", "深さ優先探索"],
      comment: "線形探索法は、リストや配列の先頭から順に目的の値を探し出す最も基本的な探索方法。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '2分探索法',
      question: 'ソート済みのリストや配列の中間点から探索を開始し、目的の値を効率的に探し出す方法は何か？',
      ans: '2分探索法',
      choices: ["2分探索法", "線形探索法", "ハッシュ法", "幅優先探索"],
      comment: "2分探索法は、ソート済みのデータに対して中間点の値と目的の値を比較しながら、探索範囲を半分に絞りながら探索を行う方法。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '選択ソート',
      question: '未ソートのリストから最小値（または最大値）を選んで、それをリストの先頭に移動させることを繰り返すソートアルゴリズムは何か？',
      ans: '選択ソート',
      choices: ["選択ソート", "バブルソート", "クイックソート", "マージソート"],
      comment: "選択ソートは、未ソートの部分から最小値（または最大値）を選んで先頭に移動させることを繰り返し、全体をソートするアルゴリズム。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'バブルソート',
      question: '隣接する要素を比較して、順序が逆の場合に交換することを繰り返すことでリスト全体をソートするアルゴリズムは何か？',
      ans: 'バブルソート',
      choices: ["バブルソート", "選択ソート", "クイックソート", "挿入ソート"],
      comment: "バブルソートは、隣接する要素を比較して順序が逆の場合に交換することを繰り返し、リスト全体をソートするアルゴリズム。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'クイックソート',
      question: 'ピボットと呼ばれる基準値を選び、それを中心にリストを分割し、各部分を再帰的にソートしていくアルゴリズムは何か？',
      ans: 'クイックソート',
      choices: ["クイックソート", "バブルソート", "選択ソート", "ヒープソート"],
      comment: "クイックソートは、ピボット（基準値）を選び、それを中心にリストを分割し、各部分を再帰的にソートしていく高速なソートアルゴリズム。",
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 401);
  });
}
