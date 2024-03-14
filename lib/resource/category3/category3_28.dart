import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_28 {
  final quizItems = [
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
    return quizItems[index].copyWith(quizId: index + 271 + 3000);
  });
}
