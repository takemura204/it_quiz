import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_14 {
  final quizItems = [
    QuizItem(
      word: 'ユーザビリティ',
      question: '製品やサービスが利用者にとって使いやすいかどうかを測るための品質の側面は何か？',
      ans: 'ユーザビリティ',
      choices: ["ユーザビリティ", "アクセシビリティ", "ジェスチャーインタフェース", "VUI"],
      comment: "ユーザビリティは、製品やサービスが利用者にとってどれだけ使いやすいか、効率的か、満足度が高いかという品質の側面を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'アクセシビリティ',
      question: 'Webアクセシビリティの説明として，適切なものはどれか。',
      ans: '年齢や身体的条件にかかわらず，誰もがWebを利用して，情報を受発信できる度合いである。',
      choices: [
        "Webサイトを活用したマーケティング手法である。",
        "Webページのデザインを統一して管理することを目的とした仕組みである。",
        "年齢や身体的条件にかかわらず，誰もがWebを利用して，情報を受発信できる度合いである。",
        "利用者がWebページに入力した情報に基づいて， Webサーバがプログラムを起動して動的に表示内容を生成する仕組みである。"
      ],
      comment:
          "年齢や身体的制約・利用環境などにかかわらず、さまざまな製品や建物やサービスなどを支障なく利用できるかどうかを表す概念のことで、Webサイトを利用する際に、誰もがWebサイトにアクセスでき、かつ、サイト内を不自由なく利用できるかどうかの度合いのことをWebアクセシビリティという。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ジェスチャーインタフェース',
      question: 'ユーザーが手や指の動きでコマンドを実行できるインタフェースのことを何というか？',
      ans: 'ジェスチャーインタフェース',
      choices: ["ジェスチャーインタフェース", "VUI", "GUI", "人間中心設計"],
      comment: "ジェスチャーインタフェースは、ユーザーが手や指の動きでコマンドを実行できるように設計されたインタフェースのこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'VUI（Voice User Interface）',
      question: '音声認識と音声合成を用いてユーザーとコンピュータがやりとりするインタフェースは何か？',
      ans: 'VUI',
      choices: ["VUI", "ジェスチャーインタフェース", "GUI", "アクセシビリティ"],
      comment:
          "VUI（Voice User Interface）は、音声認識と音声合成を用いてユーザーとコンピュータがやりとりするインタフェース。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'GUI（Graphical User Interface）',
      question: 'グラフィカルな要素を用いてユーザーとコンピュータがやりとりするインタフェースは何か？',
      ans: 'GUI',
      choices: ["GUI", "VUI", "ジェスチャーインタフェース", "アクセシビリティ"],
      comment:
          "GUI（Graphical User Interface）は、グラフィカルな要素を用いてユーザーとコンピュータがやりとりするインタフェース。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ラジオボタン',
      question: '一度に一つの選択肢のみを選択できるGUIの要素は何か？',
      ans: 'ラジオボタン',
      choices: ["ラジオボタン", "チェックボックス", "リストボックス", "プルダウンメニュー"],
      comment: "ラジオボタンは、一度に一つの選択肢のみを選択できるGUIの要素で、複数の選択肢の中から一つを選ぶ際に使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'チェックボックス',
      question: '複数の選択肢から複数を選択できるGUIの要素は何か？',
      ans: 'チェックボックス',
      choices: ["チェックボックス", "ラジオボタン", "リストボックス", "プルダウンメニュー"],
      comment: "チェックボックスは、複数の選択肢から複数を選択できるGUIの要素で、オプションの有効化・無効化に使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'リストボックス',
      question: 'リスト形式で表示され、ユーザーが一つまたは複数の選択肢を選択できるGUIの要素は何か？',
      ans: 'リストボックス',
      choices: ["リストボックス", "チェックボックス", "ラジオボタン", "プルダウンメニュー"],
      comment: "リストボックスは、リスト形式で表示され、ユーザーが一つまたは複数の選択肢を選択できるGUIの要素。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'プルダウンメニュー',
      question: 'PCの操作画面で使用されているプルダウンメニューに関する記述として，適切なものはどれか。',
      ans: 'タイトル部分をクリックすることで選択項目の一覧が表示され，その中からーつ選ぶ。',
      choices: [
        "エラーメッセージを表示したり，少量のデータを入力するために用いる。",
        "画面に表示されている複数の選択項目から，必要なものを全て選ぶ。",
        "キーボード入力の際，過去の入力履歴を基に次の入力内容を予想し表示する。",
        "タイトル部分をクリックすることで選択項目の一覧が表示され，その中からーつ選ぶ。"
      ],
      comment:
          "プルダウンメニューは、アプリケーションウィンドウの上部にあるメニュー項目をクリックすると、そのメニューに属する詳細な操作がすだれのように下に表示される形式をもつ操作部品。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ポップアップメニュー',
      question: 'ユーザーの特定のアクションに応じて一時的に表示されるメニューは何か？',
      ans: 'ポップアップメニュー',
      choices: ["ポップアップメニュー", "プルダウンメニュー", "リストボックス", "チェックボックス"],
      comment: "ポップアップメニューは、ユーザーの特定のアクションに応じて一時的に表示されるメニューで、コンテキストメニューとも呼ばれる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'サムネイル',
      question: '小さな画像で、より大きな画像や情報のプレビューとして機能するものは何か？',
      ans: 'サムネイル',
      choices: ["サムネイル", "アイコン", "ピクトグラム", "インフォグラフィックス"],
      comment:
          "サムネイルは、小さな画像で、より大きな画像や情報のプレビューとして機能するもの。ウェブページやデジタルアルバムでよく使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CSS（Cascading Style Sheets）',
      question:
          'Webページの作成・編集において，Webサイト全体の色調やデザインに統一性をもたせたい場合，HTMLと組み合わせて利用すると効果的なものはどれか。',
      ans: 'CSS(Cascading Style Sheets)',
      choices: [
        "CSS(Cascading Style Sheets)",
        "SNS(Social Networking Service)",
        "SQL(Structured Query Language)",
        "XML(Extensible Markup Language)"
      ],
      comment:
          "CSS(Cascading Style Sheets)は、HTMLの要素をどのように修飾して表示させるかを定義するテキスト形式の文書で、構造とデザインを別の文書に分離させるために提唱されたスタイルシート言語。",
      source: '平成25年秋期 問80',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'モバイルファースト',
      question: 'デザインや開発のプロセスにおいて、モバイルデバイスでの使用を最優先に考えるアプローチは何か？',
      ans: 'モバイルファースト',
      choices: ["モバイルファースト", "レスポンシブデザイン", "アダプティブデザイン", "クロスプラットフォーム"],
      comment:
          "モバイルファーストは、デザインや開発のプロセスにおいてモバイルデバイスでの使用を最優先に考え、それに基づいて設計するアプローチ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '人間中心設計',
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
