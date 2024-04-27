import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_19 {
  final quizItems = [
    QuizItem(
      question: '近距離のコンピュータを接続してデータをやり取りするためのネットワークのことを何というか？',
      ans: 'LAN',
      choices: ["LAN", "WAN", "VLAN", "無線LAN"],
      comment:
          "LAN（Local Area Network）は、一定の範囲内、例えば家庭やオフィス内の近距離のコンピュータを接続してデータをやり取りするためのネットワーク。",
    ),
    QuizItem(
      question: '広範囲にわたる地理的なエリアをカバーするネットワークのことを何というか？',
      ans: 'WAN',
      choices: ["WAN", "LAN", "VLAN", "無線LAN"],
      comment: "WAN（Wide Area Network）は、広範囲にわたる地理的なエリア、例えば都市や国を跨いで構築されるネットワーク。",
    ),
    QuizItem(
      question: '複数のネットワークデバイスを物理的に接続するための装置は何か？',
      ans: 'ハブ',
      choices: ["ハブ", "ルータ", "スイッチ", "ネットワークインターフェイスカード"],
      comment: "ハブは、複数のネットワークデバイスを物理的に接続し、データを中継するための装置。",
    ),
    QuizItem(
      question: '異なるネットワーク間でデータパケットを転送するための装置は何か？',
      ans: 'ルータ',
      choices: ["ルータ", "ハブ", "スイッチ", "ネットワークインターフェイスカード"],
      comment: "ルータは、異なるネットワーク間でデータパケットを転送し、最適な経路を選択するための装置。",
    ),
    QuizItem(
      question: 'ネットワーク内でデータパケットを特定の送信先アドレスに基づいて転送する装置は何か？',
      ans: 'スイッチ',
      choices: ["スイッチ", "ルータ", "ハブ", "ネットワークインターフェイスカード"],
      comment: "スイッチは、ネットワーク内でデータパケットを特定の送信先アドレスに基づいて転送し、ネットワークの効率を向上させる装置。",
    ),
    QuizItem(
      question: 'コンピュータをネットワークに接続するために必要なハードウェアのことを何というか？',
      ans: 'ネットワークインターフェイスカード',
      choices: ["ネットワークインターフェイスカード", "ハブ", "ルータ", "スイッチ"],
      comment:
          "ネットワークインターフェイスカード（NIC）は、コンピュータを有線または無線のネットワークに接続するために必要なハードウェア。",
    ),
    QuizItem(
      question: 'ケーブルを使用せずにネットワーク接続を行う技術は何か？',
      ans: '無線LAN',
      choices: ["無線LAN", "LAN", "WAN", "VLAN"],
      comment:
          "無線LAN（Wireless LAN）は、ケーブルを使用せずに無線信号を利用してコンピュータやデバイスをネットワークに接続する技術。",
    ),
    QuizItem(
      question: '一つの物理的なLAN内で複数の論理的なネットワークを作成する技術は何か？',
      ans: 'VLAN',
      choices: ["VLAN", "LAN", "無線LAN", "WAN"],
      comment: "VLAN（Virtual LAN）は、一つの物理的なLAN内で複数の論理的なネットワークを分割・管理するための技術。",
    ),
    QuizItem(
      question: '異なるネットワーク間でデータを転送する際に使用されるノードやデバイスは何か？',
      ans: 'ゲートウェイ',
      choices: ["ゲートウェイ", "ルータ", "スイッチ", "ハブ"],
      comment:
          "ゲートウェイは、異なるネットワーク間でデータを転送する際に使用されるノードやデバイスで、プロトコル間の変換を行うことができる。",
    ),
    QuizItem(
      question: 'ネットワーク内のデバイスがインターネットなどの外部ネットワークにデータを送信する際の初期送信地点となる装置は何か？',
      ans: 'デフォルトゲートウェイ',
      choices: ["デフォルトゲートウェイ", "ゲートウェイ", "ルータ", "プロキシ"],
      comment:
          "デフォルトゲートウェイは、ネットワーク内のデバイスがインターネットなどの外部ネットワークにアクセスする際の初期送信地点となる装置。",
    ),
    QuizItem(
      question: '無線LAN技術に基づく標準規格の一つで、ワイヤレスネットワークを構築するために広く使用される技術は何か？',
      ans: 'Wi-Fi',
      choices: ["Wi-Fi", "VLAN", "無線LAN", "LTE"],
      comment:
          "Wi-Fiは、無線LAN技術に基づく標準規格の一つで、家庭、オフィス、公共の場所でワイヤレスネットワークを構築するために広く使用される。",
    ),
    QuizItem(
      question: 'Wi-Fi技術を用いて、デバイス間で直接、ワイヤレス接続を行う技術は何か？',
      ans: 'Wi-Fi Direct',
      choices: ["Wi-Fi Direct", "Wi-Fi", "VLAN", "無線LAN"],
      comment: "Wi-Fi Directは、Wi-Fi技術を用いて、アクセスポイントを介さずにデバイス間で直接、ワイヤレス接続を行う技術。",
    ),
    QuizItem(
      question: 'Wi-Fiネットワークのカバー範囲を広げ、信号の強度を向上させるために使用されるシステムは何か？',
      ans: 'メッシュWi-Fi',
      choices: ["メッシュWi-Fi", "Wi-Fi", "Wi-Fi Direct", "LTE"],
      comment:
          "メッシュWi-Fiは、複数のWi-Fiアクセスポイントを使用してネットワークのカバー範囲を広げ、信号の強度を向上させるシステム。",
    ),
    QuizItem(
      question: 'Wi-Fiネットワークにデバイスを簡単に接続するための標準化されたセットアッププロセスは何か？',
      ans: 'WPS',
      choices: ["WPS", "Wi-Fi", "Wi-Fi Direct", "メッシュWi-Fi"],
      comment:
          "WPS（Wi-Fi Protected Setup）は、Wi-Fiネットワークにデバイスを簡単に接続するための標準化されたセットアッププロセス。",
    ),
    QuizItem(
      question: 'ネットワーク上でのデータの流れを中継し、フィルタリングやキャッシングを行うサーバは何か？',
      ans: 'プロキシ',
      choices: ["プロキシ", "ゲートウェイ", "デフォルトゲートウェイ", "ルータ"],
      comment:
          "プロキシサーバは、ネットワーク上でのデータの流れを中継し、フィルタリングやキャッシングを行うことで、セキュリティ向上やアクセス速度の改善を図るサーバ。",
    ),
    QuizItem(
      question: 'ネットワークデバイスの物理的なアドレスを示す一意の識別子は何か？',
      ans: 'MACアドレス',
      choices: ["MACアドレス", "IPアドレス", "ESSID", "SSID"],
      comment:
          "MACアドレス（Media Access Control Address）は、ネットワークデバイスのハードウェアに割り当てられた物理的なアドレスで、デバイスを一意に識別する。",
    ),
    QuizItem(
      question: '無線LANネットワークの名前を示す識別子は何か？',
      ans: 'ESSID',
      choices: ["ESSID", "SSID", "MACアドレス", "IPアドレス"],
      comment:
          "ESSID（Extended Service Set Identifier）またはSSID（Service Set Identifier）は、無線LANネットワークの名前を示す識別子。",
    ),
    QuizItem(
      question: '企業や組織内部で利用されるプライベートなネットワークは何と呼ばれるか？',
      ans: 'イントラネット',
      choices: ["イントラネット", "インターネット", "エクストラネット", "VLAN"],
      comment: "イントラネットは、企業や組織内部で利用されるプライベートなネットワークで、内部情報の共有や内部通信に使用される。",
    ),
    QuizItem(
      question: 'インターネットなどのネットワークにアクセスするために、電話線やケーブルを通してデータを送受信する装置は何か？',
      ans: 'モデム',
      choices: ["モデム", "ルータ", "スイッチ", "アダプタ"],
      comment:
          "モデム（Modulator-Demodulator）は、インターネットなどのネットワークにアクセスするために、電話線やケーブルを通してデータをデジタル信号とアナログ信号間で変換し送受信する装置。",
    ),
    QuizItem(
      question: 'コンピュータと外部デバイスを接続するために使用される端末や装置は何か？',
      ans: 'ターミナル',
      choices: ["ターミナル", "モデム", "アダプタ", "モジュラージャック"],
      comment:
          "ターミナルは、コンピュータと外部デバイスを物理的または論理的に接続するために使用される端末や装置を指すことがある。また、特定のシステムへのアクセスポイントとして機能するデバイスのことも指す。",
    ),
    QuizItem(
      question: 'ネットワークデバイスやコンピュータ間の接続を可能にするために使用されるデバイスは何か？',
      ans: 'アダプタ',
      choices: ["アダプタ", "モデム", "ターミナル", "ルータ"],
      comment:
          "アダプタは、ネットワークデバイスやコンピュータ間の接続を可能にするために使用されるデバイスで、物理的な接続やプロトコル変換などの機能を提供する。",
    ),
    QuizItem(
      question: '電話線やネットワークケーブルを接続するための標準化された端子は何か？',
      ans: 'モジュラージャック',
      choices: ["モジュラージャック", "アダプタ", "モデム", "ターミナル"],
      comment:
          "モジュラージャックは、電話線やネットワークケーブルを接続するための標準化された端子で、RJ-11やRJ-45などの規格がある。",
    ),
    QuizItem(
      question: '長距離の高速モバイル通信を実現するための通信規格は何か？',
      ans: 'LTE',
      choices: ["LTE", "5G", "Wi-Fi", "NAT"],
      comment:
          "LTE（Long Term Evolution）は、長距離の高速モバイル通信を実現するための通信規格で、第4世代（4G）モバイル通信技術の一つ。",
    ),
    QuizItem(
      question: '高速で大容量のデータ通信を可能にする次世代モバイル通信技術は何か？',
      ans: '5G',
      choices: ["5G", "LTE", "Wi-Fi", "SDN"],
      comment: "5Gは、高速で大容量のデータ通信を可能にする次世代モバイル通信技術で、第5世代モバイル通信システムを指す。",
    ),
    QuizItem(
      question: 'ネットワークの設定や管理をソフトウェアで制御する技術は何か？',
      ans: 'SDN',
      choices: ["SDN", "LTE", "5G", "NAT"],
      comment:
          "SDN（Software Defined Networking）は、ネットワークの設定や管理をソフトウェアで制御し、柔軟性と効率性を高める技術。",
    ),
    QuizItem(
      question: '特定の位置情報を提供するために使用される小型の無線送信機は何か？',
      ans: 'ビーコン',
      choices: ["ビーコン", "SDN", "LTE", "BLE"],
      comment:
          "ビーコンは、特定の位置情報を提供するために使用される小型の無線送信機で、Bluetooth Low Energy（BLE）などの技術を使用して情報を発信する。",
    ),
    QuizItem(
      question: '低消費電力で広範囲をカバーするワイヤレス通信技術は何か？',
      ans: 'LPWA',
      choices: ["LPWA", "LTE", "Wi-Fi", "BLE"],
      comment:
          "LPWA（Low Power Wide Area）は、低消費電力で広範囲をカバーするワイヤレス通信技術で、IoTデバイスなどの接続に適している。",
    ),
    QuizItem(
      question: 'データ処理をネットワークの端に近い場所で行うことでレイテンシを低減する技術は何か？',
      ans: 'エッジコンピューティング',
      choices: ["エッジコンピューティング", "SDN", "LPWA", "BLE"],
      comment: "エッジコンピューティングは、データ処理をネットワークの端に近い場所で行うことでレイテンシを低減し、効率性を高める技術。",
    ),
    QuizItem(
      question: '低エネルギーで短距離通信を実現するワイヤレス技術は何か？',
      ans: 'BLE',
      choices: ["BLE", "Wi-Fi", "LTE", "LPWA"],
      comment:
          "BLE（Bluetooth Low Energy）は、低エネルギーで短距離通信を実現するワイヤレス技術で、ビーコンや健康機器などに使用される。",
    ),
    QuizItem(
      question: 'IoTデバイスが相互に通信するためのネットワークは何と呼ばれるか？',
      ans: 'IoTエリアネットワーク',
      choices: ["IoTエリアネットワーク", "LAN", "WAN", "VLAN"],
      comment: "IoTエリアネットワークは、IoTデバイスが相互に通信するために構築される特定のエリアをカバーするネットワーク。",
    ),
    QuizItem(
      question: 'プライベートIPアドレスをインターネット上のパブリックIPアドレスに変換する技術は何か？',
      ans: 'NAT',
      choices: ["NAT", "SDN", "LPWA", "BLE"],
      comment:
          "NAT（Network Address Translation）は、プライベートIPアドレスをインターネット上のパブリックIPアドレスに変換し、インターネット接続を可能にする技術。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 1901);
  });
}
