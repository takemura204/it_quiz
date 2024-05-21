import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_14 {
  final quizItems = [
    QuizItem(
      question: '製品やサービスが利用者にとって使いやすいかどうかを測るための品質の側面は何か？',
      ans: 'ユーザビリティ',
      choices: ["ユーザビリティ", "アクセシビリティ", "ジェスチャーインタフェース", "VUI"],
      comment: "ユーザビリティは、製品やサービスが利用者にとってどれだけ使いやすいか、効率的か、満足度が高いかという品質の側面を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ユーザーが手や指の動きでコマンドを実行できるインタフェースのことを何というか？',
      ans: 'ジェスチャーインタフェース',
      choices: ["ジェスチャーインタフェース", "VUI", "GUI", "人間中心設計"],
      comment: "ジェスチャーインタフェースは、ユーザーが手や指の動きでコマンドを実行できるように設計されたインタフェースのこと。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '音声認識と音声合成を用いてユーザーとコンピュータがやりとりするインタフェースは何か？',
      ans: 'VUI',
      choices: ["VUI", "ジェスチャーインタフェース", "GUI", "アクセシビリティ"],
      comment:
          "VUI（Voice User Interface）は、音声認識と音声合成を用いてユーザーとコンピュータがやりとりするインタフェース。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'グラフィカルな要素を用いてユーザーとコンピュータがやりとりするインタフェースは何か？',
      ans: 'GUI',
      choices: ["GUI", "VUI", "ジェスチャーインタフェース", "アクセシビリティ"],
      comment:
          "GUI（Graphical User Interface）は、グラフィカルな要素を用いてユーザーとコンピュータがやりとりするインタフェース。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '一度に一つの選択肢のみを選択できるGUIの要素は何か？',
      ans: 'ラジオボタン',
      choices: ["ラジオボタン", "チェックボックス", "リストボックス", "プルダウンメニュー"],
      comment: "ラジオボタンは、一度に一つの選択肢のみを選択できるGUIの要素で、複数の選択肢の中から一つを選ぶ際に使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数の選択肢から複数を選択できるGUIの要素は何か？',
      ans: 'チェックボックス',
      choices: ["チェックボックス", "ラジオボタン", "リストボックス", "プルダウンメニュー"],
      comment: "チェックボックスは、複数の選択肢から複数を選択できるGUIの要素で、オプションの有効化・無効化に使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'リスト形式で表示され、ユーザーが一つまたは複数の選択肢を選択できるGUIの要素は何か？',
      ans: 'リストボックス',
      choices: ["リストボックス", "チェックボックス", "ラジオボタン", "プルダウンメニュー"],
      comment: "リストボックスは、リスト形式で表示され、ユーザーが一つまたは複数の選択肢を選択できるGUIの要素。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '選択肢が表示されるまで通常は非表示で、ユーザーが操作すると展開するGUIの要素は何か？',
      ans: 'プルダウンメニュー',
      choices: ["プルダウンメニュー", "リストボックス", "チェックボックス", "ポップアップメニュー"],
      comment: "プルダウンメニューは、選択肢が表示されるまで通常は非表示で、ユーザーが操作すると展開するGUIの要素。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'ユーザーの特定のアクションに応じて一時的に表示されるメニューは何か？',
      ans: 'ポップアップメニュー',
      choices: ["ポップアップメニュー", "プルダウンメニュー", "リストボックス", "チェックボックス"],
      comment: "ポップアップメニューは、ユーザーの特定のアクションに応じて一時的に表示されるメニューで、コンテキストメニューとも呼ばれる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '障害を持つ人を含むすべての人が製品やサービスを利用しやすいようにするための設計のことは何か？',
      ans: 'アクセシビリティ',
      choices: ["アクセシビリティ", "ユーザビリティ", "人間中心設計", "モバイルファースト"],
      comment: "アクセシビリティは、障害を持つ人を含むすべての人が製品やサービスを利用しやすいようにするための設計を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '小さな画像で、より大きな画像や情報のプレビューとして機能するものは何か？',
      ans: 'サムネイル',
      choices: ["サムネイル", "アイコン", "ピクトグラム", "インフォグラフィックス"],
      comment:
          "サムネイルは、小さな画像で、より大きな画像や情報のプレビューとして機能するもの。ウェブページやデジタルアルバムでよく使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ウェブページのスタイルやレイアウトを定義するために使用されるスタイルシート言語は何か？',
      ans: 'CSS',
      choices: ["CSS", "HTML", "JavaScript", "XML"],
      comment:
          "CSS（Cascading Style Sheets）は、ウェブページのスタイルやレイアウトを定義するために使用されるスタイルシート言語。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'デザインや開発のプロセスにおいて、モバイルデバイスでの使用を最優先に考えるアプローチは何か？',
      ans: 'モバイルファースト',
      choices: ["モバイルファースト", "レスポンシブデザイン", "アダプティブデザイン", "クロスプラットフォーム"],
      comment:
          "モバイルファーストは、デザインや開発のプロセスにおいてモバイルデバイスでの使用を最優先に考え、それに基づいて設計するアプローチ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '製品やサービスの設計において、最終的なユーザーのニーズや体験を中心に考慮する設計思想は何か？',
      ans: '人間中心設計',
      choices: ["人間中心設計", "UXデザイン", "ユーザビリティ", "アクセシビリティ"],
      comment: "人間中心設計は、製品やサービスの設計において、最終的なユーザーのニーズや体験を中心に考慮する設計思想。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 1401);
  });
}
