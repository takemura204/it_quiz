import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_27 {
  final quizItems = [
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
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 261 + 3000);
  });
}
