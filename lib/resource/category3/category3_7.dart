import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_7 {
  final quizItems = [
    QuizItem(
      word: 'RFID(Radio Frequency IDentification)',
      question: '電車の定期券などとして利用される非接触型ICカードに用いられている技術はどれか。',
      ans: 'RFID',
      choices: ["IrDA", "RFID", "バーコード", "無線LAN"],
      comment:
          "RFID(Radio Frequency IDentification)は、ID情報を埋め込んだRFタグ(ICタグ)から電磁界や電波を用い通信可能距離は数cm～数mで無線通信をし情報をやりとりする技術。",
      source: '平成22年春期 問78',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'USB（Universal Serial Bus）',
      question: 'USBは，PCにハードディスク，プリンターなどの様々な周辺機器を接続できるインタフェースである。USB2.0に関する記述のうち，適切なものはどれか',
      ans: '電力消費が少ない周辺機器は，電源に接続することなしにUSB接続するだけで電源供給を得ることができる。',
      choices: [
        "PC，USBハブ及び周辺機器側のコネクタ形状は1種類に統一されている。",
        "PCと周辺機器の間の転送速度は，幾つかのモードからPC利用者自らが設定できる。",
        "電力消費が少ない周辺機器は，電源に接続することなしにUSB接続するだけで電源供給を得ることができる。",
        "パラレルインタフェースであるので，複数の周辺機器を接続しても，周辺機器ごとのデータ転送速度は遅くならない。"
      ],
      comment:
          "USB（Universal Serial Bus）は、シリアルバス規格のひとつであり、主な特徴として、ハブを使うことで最大127台まで接続可能、ホットプラグ・プラグアンドプレイが可能、バスパワー方式に対応しており小電力のデバイスならコードを介して電源供給が可能なことなどが挙げられる。",
      source: '平成22年秋期 問70',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'IEEE1394（別名FireWireやi.LINK）',
      question: '高速なシリアル通信を提供する規格で、特にデジタルビデオカメラなどのデータ転送に用いられるものは何か？',
      ans: 'IEEE1394',
      choices: ["IEEE1394", "USB", "HDMI", "DisplayPort"],
      comment: "IEEE1394（別名FireWireやi.LINK）は、高速なシリアル通信を提供する規格で、特にデジタルビデオカメラなどでのデータ転送に用いられる。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'PCMCIA',
      question: 'ノートパソコンの拡張カード用の国際標準規格で、かつては周辺機器を接続するために広く用いられたものは何か？',
      ans: 'PCMCIA',
      choices: ["PCMCIA", "USB", "PCI Express", "SDカード"],
      comment:
          "PCMCIA（Personal Computer Memory Card International Association）は、ノートパソコンの拡張カード用の国際標準規格で、かつて周辺機器の接続に広く用いられた。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'HDMI(High-Definition Multimedia Interface)',
      question: 'HDMIの説明として，適切なものはどれか。',
      ans: '映像，音声及び制御信号を1本のケーブルで入出力するAV機器向けのインタフェースである。',
      choices: [
        "映像，音声及び制御信号を1本のケーブルで入出力するAV機器向けのインタフェースである。",
        "携帯電話間での情報交換などで使用される赤外線を用いたインタフェースである。",
        "外付けハードディスクなどをケーブルで接続するシリアルインタフェースである。",
        "多少の遮蔽物があっても通信可能な，電波を利用した無線インタフェースである。"
      ],
      comment:
          "HDMI(High-Definition Multimedia Interface)は、PCとディスプレイの接続標準規格であるDVIを基に音声伝送機能や著作権保護機能、色差伝送機能を加えるなどAV家電向けに改良したデジタル家電向けのインタフェース。",
      source: '平成26年春期 問73',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'DisplayPort',
      question: 'デジタルディスプレイへの高解像度ビデオとオーディオの転送に使用されるインターフェース規格は何か？',
      ans: 'DisplayPort',
      choices: ["DisplayPort", "HDMI", "DVI", "VGA"],
      comment: "DisplayPortは、デジタルディスプレイへの高解像度ビデオとオーディオの転送に使用されるインターフェース規格。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'DVI（Digital Visual Interface）',
      question: 'デジタルディスプレイにビデオ信号を転送するために使用されるインターフェース規格で、アナログVGAの後継とされるものは何か？',
      ans: 'DVI',
      choices: ["DVI", "HDMI", "DisplayPort", "VGA"],
      comment:
          "DVI（Digital Visual Interface）は、デジタルディスプレイにビデオ信号を転送するために使用されるインターフェース規格で、アナログVGAの後継とされる。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'Bluetooth',
      question: '携帯電話機や家電などで用いられる無線通信の標準化規格であるBluetoothの活用事例はどれか。',
      ans: '1台の家庭用ゲーム機に，2個のコントローラーを無線で接続する。',
      choices: [
        "1台の家庭用ゲーム機に，2個のコントローラーを無線で接続する。",
        "カーナビゲーションシステムで人工衛星からの信号を受信する。",
        "携帯電話機でQRコードを読み取る。",
        "自動改札機にかざされたIC乗車カードの情報を読み取る。"
      ],
      comment:
          "Bluetoothは、免許申請や使用登録の不要な2.4GHz帯の電波を用いて、数mから100m程度の距離の情報機器間で、電波を使い最大24Mbpsの無線通信を行い。パソコンと周辺機器の接続などの用途で幅広く普及している。",
      source: '平成25年秋期 問21',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'IrDA（Infrared Data Association）',
      question: '赤外線通信を利用して、機器間でのデータ転送を行う技術は何か？',
      ans: 'IrDA',
      choices: ["IrDA", "Bluetooth", "Wi-Fi", "NFC"],
      comment: "IrDA（Infrared Data Association）は、赤外線通信を利用して機器間でのデータ転送を行う技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'NFC（Near Field Communication）',
      question: '次のうち，通信可能な最大距離が最も短いものはどれか。',
      ans: 'NFC',
      choices: ["Bluetooth", "IrDA", "NFC", "Wi-Fi"],
      comment:
          "NFC（Near Field Communication）は、近距離無線通信と呼ばれ、非接触型ICカードの技術に基づいて開発されたもので、数センチ～20cm以内の極近距離で通信を行うことできる。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'アクチュエータ',
      question: '機械的な動作を電気信号によって制御する装置は何か？',
      ans: 'アクチュエータ',
      choices: ["アクチュエータ", "センサー", "トランスデューサ", "リレー"],
      comment: "アクチュエータは、電気信号を受けて機械的な動作を行う装置で、ロボットの動きや自動ドアの開閉などに用いられる。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'デバイスドライバ',
      question: 'デバイスドライバの説明として，適切なものはどれか。',
      ans: 'PCに接続されている周辺機器を制御，操作するためのソフトウェア',
      choices: [
        "PCに接続されている周辺機器を制御，操作するためのソフトウェア",
        "PCの電源投入直後に起動され，OSが動作する前に，ハードディスクやキーボードなどに対する基本的な入出力ができるようにするソフトウェア",
        "動画を含むページを表示するために，Webブラウザに組み込むソフトウェア",
        "複数のファイルを一つのファイルにまとめたり，まとめたファイルを元に戻したりするソフトウェア"
      ],
      comment:
          "デバイスドライバ(Device Driver)は、コンピュータに接続された周辺機器を管理・制御するための抽象化したインタフェースを、他のアプリケーションソフトウェアに対して提供するためのソフトウェア／プログラム。",
      source: '平成30年春期 問83',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'プラグアンドプレイ',
      question: 'プラグアンドプレイに関する記述として，適切なものはどれか。',
      ans: 'PCに周辺機器を接続すると，デバイスドライバの組込みや設定を自動的に行う。',
      choices: [
        "PCに周辺機器を接続すると，デバイスドライバの組込みや設定を自動的に行う。",
        "アプリケーションソフトウェアの機能を強化するソフトウェアを後から組み込む。",
        "周辺機器との接続ケーブルを介して，PCから周辺機器に電力を供給する。",
        "特定のプログラムを実行して，処理に掛かる時間でシステムの性能を評価する。"
      ],
      comment: "プラグアンドプレイ(Plug and Play)は、周辺機器を接続するのと同時に、自動的にPCが認識しデバイスドライバのインストールと設定を行う機能。",
      source: '平成27年春期 問82',
      importance: ImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 701);
  });
}
