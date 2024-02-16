import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_31 {
  final quizItems = [
    QuizItem(
      question: '移動中のモバイルデバイスが異なるネットワーク間で通信を維持するプロセスは何か？',
      ans: 'ハンドオーバ',
      choices: ["ハンドオーバ", "ローミング", "MIMO", "キャリアアグリゲーション"],
      comment: "ハンドオーバ（またはハンドオフ）は、移動中のモバイルデバイスが異なるネットワーク間で通信を維持するためのプロセス。",
    ),
    QuizItem(
      question: 'ユーザーが移動しても異なるネットワークエリアで通信サービスを継続できる機能は何か？',
      ans: 'ローミング',
      choices: ["ローミング", "ハンドオーバ", "MIMO", "キャリアアグリゲーション"],
      comment: "ローミングは、ユーザーが移動しても異なるネットワークエリアで通信サービスを継続できる機能。",
    ),
    QuizItem(
      question: '複数の送受信アンテナを用いてデータ伝送の効率を向上させる技術は何か？',
      ans: 'MIMO',
      choices: ["MIMO", "ローミング", "ハンドオーバ", "キャリアアグリゲーション"],
      comment:
          "MIMO（Multiple Input Multiple Output）は、複数の送受信アンテナを用いてデータ伝送の効率を向上させる技術。",
    ),
    QuizItem(
      question: '複数のキャリア周波数を組み合わせて通信速度を向上させる技術は何か？',
      ans: 'キャリアアグリゲーション',
      choices: ["キャリアアグリゲーション", "MIMO", "ローミング", "ハンドオーバ"],
      comment: "キャリアアグリゲーションは、複数のキャリア周波数を組み合わせて通信速度を向上させる技術。",
    ),
    QuizItem(
      question: 'モバイルデバイスを無線LANルーターのように機能させ、他のデバイスにインターネット接続を共有する機能は何か？',
      ans: 'テザリング',
      choices: ["テザリング", "SIMカード", "eSIM", "テレマティクス"],
      comment: "テザリングは、モバイルデバイスを無線LANルーターのように機能させ、他のデバイスにインターネット接続を共有する機能。",
    ),
    QuizItem(
      question: 'モバイルデバイスがモバイルネットワークに接続するために使用される物理的なカードは何か？',
      ans: 'SIMカード',
      choices: ["SIMカード", "eSIM", "テザリング", "MIMO"],
      comment:
          "SIMカード（Subscriber Identity Module Card）は、モバイルデバイスがモバイルネットワークに接続するために使用される物理的なカード。",
    ),
    QuizItem(
      question: '物理的なカードではなく、デバイス内部に組み込まれたデジタルSIMのことを何というか？',
      ans: 'eSIM',
      choices: ["eSIM", "SIMカード", "テザリング", "MIMO"],
      comment: "eSIM（embedded SIM）は、物理的なカードではなく、デバイス内部に組み込まれたデジタルSIMのこと。",
    ),
    QuizItem(
      question: '自動車などの車両に搭載された通信機器を用いてサービスを提供する技術は何か？',
      ans: 'テレマティクス',
      choices: ["テレマティクス", "eSIM", "SIMカード", "テザリング"],
      comment:
          "テレマティクスは、自動車などの車両に搭載された通信機器を用いて、ナビゲーション、緊急通報、車両診断などのサービスを提供する技術。",
    ),
    QuizItem(
      question: '電話線を使用して高速インターネット接続を提供する技術は何か？',
      ans: 'ADSL',
      choices: ["ADSL", "FTTH", "LTE", "5G"],
      comment:
          "ADSL（Asymmetric Digital Subscriber Line）は、電話線を使用して高速インターネット接続を提供する技術で、上りと下りの速度が非対称である。",
    ),
    QuizItem(
      question: '光ファイバーを利用して家庭やオフィスまで直接高速インターネット接続を提供する技術は何か？',
      ans: 'FTTH',
      choices: ["FTTH", "ADSL", "LTE", "5G"],
      comment:
          "FTTH（Fiber To The Home）は、光ファイバーを利用して家庭やオフィスまで直接高速インターネット接続を提供する技術。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 301 + 3000);
  });
}
