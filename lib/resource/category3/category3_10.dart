import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_10 {
  final quizItems = [
    QuizItem(
      question: '短距離の無線通信技術で、携帯電話やコンピュータなどの機器間でデータを交換するために用いられるものは何か？',
      ans: 'Bluetooth',
      choices: ["Bluetooth", "Wi-Fi", "NFC", "IrDA"],
      comment: "Bluetoothは、短距離の無線通信技術で、携帯電話やコンピュータなどの機器間でデータ交換するために用いられる。",
    ),
    QuizItem(
      question: '赤外線通信を利用して、機器間でのデータ転送を行う技術は何か？',
      ans: 'IrDA',
      choices: ["IrDA", "Bluetooth", "Wi-Fi", "NFC"],
      comment: "IrDA（Infrared Data Association）は、赤外線通信を利用して機器間でのデータ転送を行う技術。",
    ),
    QuizItem(
      question: '非接触でのデータ通信を行うための無線通信技術で、スマートフォンの決済などに用いられるものは何か？',
      ans: 'NFC',
      choices: ["NFC", "Bluetooth", "Wi-Fi", "IrDA"],
      comment:
          "NFC（Near Field Communication）は、非接触でのデータ通信を行うための無線通信技術で、スマートフォンの決済などに用いられる。",
    ),
    QuizItem(
      question: '機械的な動作を電気信号によって制御する装置は何か？',
      ans: 'アクチュエータ',
      choices: ["アクチュエータ", "センサー", "トランスデューサ", "リレー"],
      comment: "アクチュエータは、電気信号を受けて機械的な動作を行う装置で、ロボットの動きや自動ドアの開閉などに用いられる。",
    ),
    QuizItem(
      question: 'ハードウェアデバイスをオペレーティングシステムが認識し、利用できるようにするためのソフトウェアは何か？',
      ans: 'デバイスドライバ',
      choices: ["デバイスドライバ", "ファームウェア", "オペレーティングシステム", "アプリケーションソフトウェア"],
      comment: "デバイスドライバは、ハードウェアデバイスをオペレーティングシステムが認識し、利用できるようにするためのソフトウェア。",
    ),
    QuizItem(
      question: 'ユーザーが手動で設定することなく、コンピュータが周辺機器を自動的に認識して適切に設定する機能は何か？',
      ans: 'プラグアンドプレイ',
      choices: ["プラグアンドプレイ", "オートコンフィグ", "デバイスマネジメント", "オートインストール"],
      comment: "プラグアンドプレイは、ユーザーの手動設定なしにコンピュータが周辺機器を自動的に認識し、適切に設定する機能。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 91 + 3000);
  });
}
