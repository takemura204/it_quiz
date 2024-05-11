import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_7 {
  final quizItems = [
    QuizItem(
      question: '物体の識別やデータのやり取りに無線信号を用いる技術で、タグやリーダーを使って情報を読み取るシステムは何か？',
      ans: 'RFID',
      choices: ["RFID", "Bluetooth", "NFC", "IrDA"],
      comment:
          "RFID（Radio Frequency Identification）は、無線信号を用いて物体を識別したりデータをやり取りする技術で、タグやリーダーを使用して情報を読み取る。",
    ),
    QuizItem(
      question: 'パソコンや周辺機器間のデータ転送に広く用いられる、シリアル通信インターフェースの規格は何か？',
      ans: 'USB',
      choices: ["USB", "IEEE1394", "PCMCIA", "HDMI"],
      comment:
          "USB（Universal Serial Bus）は、パソコンや周辺機器間でのデータ転送に広く用いられるシリアル通信インターフェースの規格。",
    ),
    QuizItem(
      question: '高速なシリアル通信を提供する規格で、特にデジタルビデオカメラなどのデータ転送に用いられるものは何か？',
      ans: 'IEEE1394',
      choices: ["IEEE1394", "USB", "HDMI", "DisplayPort"],
      comment:
          "IEEE1394（別名FireWireやi.LINK）は、高速なシリアル通信を提供する規格で、特にデジタルビデオカメラなどでのデータ転送に用いられる。",
    ),
    QuizItem(
      question: 'ノートパソコンの拡張カード用の国際標準規格で、かつては周辺機器を接続するために広く用いられたものは何か？',
      ans: 'PCMCIA',
      choices: ["PCMCIA", "USB", "PCI Express", "SDカード"],
      comment:
          "PCMCIA（Personal Computer Memory Card International Association）は、ノートパソコンの拡張カード用の国際標準規格で、かつて周辺機器の接続に広く用いられた。",
    ),
    QuizItem(
      question: '高品質なデジタルオーディオおよびビデオを転送するためのインターフェース規格は何か？',
      ans: 'HDMI',
      choices: ["HDMI", "DVI", "DisplayPort", "VGA"],
      comment:
          "HDMI（High-Definition Multimedia Interface）は、高品質なデジタルオーディオおよびビデオを転送するためのインターフェース規格。",
    ),
    QuizItem(
      question: 'デジタルディスプレイへの高解像度ビデオとオーディオの転送に使用されるインターフェース規格は何か？',
      ans: 'DisplayPort',
      choices: ["DisplayPort", "HDMI", "DVI", "VGA"],
      comment: "DisplayPortは、デジタルディスプレイへの高解像度ビデオとオーディオの転送に使用されるインターフェース規格。",
    ),
    QuizItem(
      question: 'デジタルディスプレイにビデオ信号を転送するために使用されるインターフェース規格で、アナログVGAの後継とされるものは何か？',
      ans: 'DVI',
      choices: ["DVI", "HDMI", "DisplayPort", "VGA"],
      comment:
          "DVI（Digital Visual Interface）は、デジタルディスプレイにビデオ信号を転送するために使用されるインターフェース規格で、アナログVGAの後継とされる。",
    ),
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
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 701);
  });
}
