import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_13 {
  final quizItems = [
    QuizItem(
      word: 'デザインの原則',
      question: '製品やサービスのデザインにおいて、機能性、美しさ、使いやすさなどを考慮して設計する際の基本的な考え方やルールは何か？',
      ans: 'デザインの原則',
      choices: ["デザインの原則", "シグニファイア構造化", "シナリオ法", "ユニバーサルデザイン"],
      comment: "デザインの原則は、製品やサービスのデザインにおいて、機能性、美しさ、使いやすさなどをバランス良く考慮して設計する際の基本的な考え方やルール。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'シグニファイア構造化',
      question: '情報や機能を明確に伝えるための視覚的手がかりをデザインに取り入れることを何というか？',
      ans: 'シグニファイア構造化',
      choices: ["シグニファイア構造化", "デザインの原則", "UXデザイン", "ピクトグラム"],
      comment: "シグニファイア構造化は、情報や機能を利用者に明確に伝えるための視覚的手がかり（シグニファイア）をデザインに取り入れ、直感的な理解を促す方法。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'シナリオ法',
      question: 'ユーザーが製品やサービスを使用する際の一連の行動や体験を物語形式で表現し、デザインの検討材料とする手法は何か？',
      ans: 'シナリオ法',
      choices: ["シナリオ法", "シグニファイア構造化", "UXデザイン", "ユニバーサルデザイン"],
      comment: "シナリオ法は、ユーザーが製品やサービスを使用する際の一連の行動や体験を物語形式で表現し、デザインプロセスの検討材料とする手法。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'UXデザイン',
      question: 'ユーザーの体験を重視したデザイン手法で、製品やサービスの使い勝手や満足度を向上させることを目的とするものは何か？',
      ans: 'UXデザイン',
      choices: ["UXデザイン", "シグニファイア構造化", "シナリオ法", "ピクトグラム"],
      comment:
          "UXデザイン（User Experience Design）は、ユーザーの体験を重視したデザイン手法で、製品やサービスの使い勝手や満足度を向上させることを目的とする。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ユニバーサルデザイン(Universal Design)',
      question: '文化，言語，年齢及び性別の違いや，障害の有無や能力の違いなどにかかわらず，できる限り多くの人が快適に利用できることを目指した設計を何というか。',
      ans: 'ユニバーサルデザイン',
      choices: ["バリアフリーデザイン", "フェールセーフ", "フールプルーフ", "ユニバーサルデザイン"],
      comment:
          "ユニバーサルデザイン(Universal Design)は、文化・言語・国籍の違い、老若男女といった差異、障害・能力の違いに関係なく利用することができる施設・製品・情報の設計デザイン。",
      source: '平成27年秋期 問61',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'ピクトグラム',
      question: '情報や指示を簡潔に伝えるために用いられる視覚的記号やイラストは何と呼ばれるか？',
      ans: 'ピクトグラム',
      choices: ["ピクトグラム", "インフォグラフィックス", "シグニファイア", "アイコン"],
      comment: "ピクトグラムは、公共の場所や製品などで情報や指示を簡潔に伝えるために用いられる視覚的記号やイラスト。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'インフォグラフィックス',
      question: 'データや情報を視覚的に表現し、理解や伝達を助けるためのグラフィックデザインは何と呼ばれるか？',
      ans: 'インフォグラフィックス',
      choices: ["インフォグラフィックス", "ピクトグラム", "UXデザイン", "シナリオ法"],
      comment: "インフォグラフィックスは、複雑なデータや情報を視覚的に表現し、理解や伝達を助けるためのグラフィックデザイン。",
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 1301);
  });
}
