import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_19 {
  final quizItems = [
    QuizItem(
      word: 'LAN(Local Area Network)',
      question: '建物の中など，限定された範囲内を対象に構築する通信ネットワークはどれか。',
      ans: 'LAN',
      choices: ["IP-VPN", "LAN", "WAN", "広域イーサネット"],
      comment: "LAN(Local Area Network)は、同じ建物の中など、比較的狭い範囲(広くても同じ施設内程度の規模)のコンピュータ間で通信を実現するネットワーク。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'WAN(Wide Area Network)',
      question: '広範囲にわたる地理的なエリアをカバーするネットワークのことを何というか？',
      ans: '通信事業者のネットワークサービスを利用して，本社－支店間など地理的に離れたLAN同士を結ぶ。',
      choices: [
        "ADSL，光ファイバなど，データ通信に使う周波数帯域が広く，高速通信が可能である。",
        "あらゆる情報端末や機器が，有線や無線の多様なネットワークによって接続され，いつでもどこからでも様々なサービスが利用できる。",
        "ケーブルの代わりに電波を利用して構築する。",
        "通信事業者のネットワークサービスを利用して，本社－支店間など地理的に離れたLAN同士を結ぶ。"
      ],
      comment:
          "WAN(Wide Area Network)は、本店と支店のLANを結ぶなど離れた場所にあるネットワーク同士を通信事業者が提供する専用通信回線、またはパケット交換を用いてケーブルや無線アクセス等で接続したネットワーク。",
      source: '平成25年秋期 問71',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'ネットワークインターフェイスカード(NIC)',
      question: 'ネットワークインタフェースカードの役割として，適切なものはどれか。',
      ans: 'PCやプリンターなどをLANに接続し，通信を行う。',
      choices: [
        "PCやアナログ電話など，そのままではISDNに接続できない通信機器をISDNに接続するための信号変換を行う。",
        "PCやプリンターなどをLANに接続し，通信を行う。",
        "屋内の電力線を使ってLANを構築するときに，電力と通信用信号の重ね合わせや分離を行う。",
        "ホスト名をIPアドレスに変換する。"
      ],
      comment: "ネットワークインターフェイスカード(NIC)は、コンピュータやプリンターなどにネットワーク機能を追加するための拡張カードの一種。",
      source: '平成23年秋期 問58',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'ハブ',
      question: '複数のネットワークデバイスを物理的に接続するための装置は何か？',
      ans: 'ハブ',
      choices: ["インターネット", "スプリッタ", "ハブ", "モデム"],
      comment: "ハブ(Hb)は、複数のポート(接続口)を装備し、コンピュータの接続台数を増やすことができる装置。",
      source: '平成23年秋期 問68',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'ルータ',
      question: 'ルータの説明として，適切なものはどれか。',
      ans: 'LANやWANを相互接続する機器で，受信データのIPアドレスを解析して適切なネットワークに転送する。',
      choices: [
        "LANと電話回線を相互接続する機器で，データの変調と復調を行う。",
        "LANの端末を相互接続する機器で，受信データのMACアドレスを解析して宛先の端末に転送する。",
        "LANの端末を相互接続する機器で，受信データを全ての端末に転送する。",
        "LANやWANを相互接続する機器で，受信データのIPアドレスを解析して適切なネットワークに転送する。"
      ],
      comment: "ルータは、異なるネットワーク間でデータパケットを転送し、最適な経路を選択するための装置。",
      source: '平成24年春期 問65',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'スイッチ',
      question: 'ネットワーク内でデータパケットを特定の送信先アドレスに基づいて転送する装置は何か？',
      ans: 'スイッチ',
      choices: ["スイッチ", "ルータ", "ハブ", "ネットワークインターフェイスカード"],
      comment: "スイッチは、ネットワーク内でデータパケットを特定の送信先アドレスに基づいて転送し、ネットワークの効率を向上させる装置。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '無線LAN',
      question: '無線LANに関する記述のうち，適切なものはどれか。',
      ans: 'アクセスポイントが無くても1対1でなら通信できる動作モードがある。',
      choices: [
        "PC以外では使用することができない。",
        "アクセスポイントが無くても1対1でなら通信できる動作モードがある。",
        "暗号化の規格は1種類に統一されている。",
        "障害物が無ければ距離に関係なく通信できる。"
      ],
      comment: "無線LAN（Wireless LAN）は、ケーブルを使用せずに無線信号を利用してコンピュータやデバイスをネットワークに接続する技術。",
      source: '平成26年春期 問81',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'VLAN（Virtual LAN）',
      question: '一つの物理的なLAN内で複数の論理的なネットワークを作成する技術は何か？',
      ans: 'VLAN',
      choices: ["VLAN", "LAN", "無線LAN", "WAN"],
      comment: "VLAN（Virtual LAN）は、一つの物理的なLAN内で複数の論理的なネットワークを分割・管理するための技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'Wi-Fi',
      question: '無線LAN技術に基づく標準規格の一つで、ワイヤレスネットワークを構築するために広く使用される技術は何か？',
      ans: 'Wi-Fi',
      choices: ["Wi-Fi", "VLAN", "無線LAN", "LTE"],
      comment: "Wi-Fiは、無線LAN技術に基づく標準規格の一つで、家庭、オフィス、公共の場所でワイヤレスネットワークを構築するために広く使用される。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'Wi-Fi Direct',
      question: 'Wi-Fi技術を用いて、デバイス間で直接、ワイヤレス接続を行う技術は何か？',
      ans: 'Wi-Fi Direct',
      choices: ["Wi-Fi Direct", "Wi-Fi", "VLAN", "無線LAN"],
      comment: "Wi-Fi Directは、Wi-Fi技術を用いて、アクセスポイントを介さずにデバイス間で直接、ワイヤレス接続を行う技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'メッシュWi-Fi',
      question: 'Wi-Fiネットワークのカバー範囲を広げ、信号の強度を向上させるために使用されるシステムは何か？',
      ans: 'メッシュWi-Fi',
      choices: ["メッシュWi-Fi", "Wi-Fi", "Wi-Fi Direct", "LTE"],
      comment: "メッシュWi-Fiは、複数のWi-Fiアクセスポイントを使用してネットワークのカバー範囲を広げ、信号の強度を向上させるシステム。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'WPS（Wi-Fi Protected Setup）',
      question: 'Wi-Fiネットワークにデバイスを簡単に接続するための標準化されたセットアッププロセスは何か？',
      ans: 'WPS',
      choices: ["WPS", "Wi-Fi", "Wi-Fi Direct", "メッシュWi-Fi"],
      comment: "WPS（Wi-Fi Protected Setup）は、Wi-Fiネットワークにデバイスを簡単に接続するための標準化されたセットアッププロセス。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ゲートウェイ',
      question:
          '携帯電話の電子メールをインターネットの電子メールとしてPCで受け取れるようにプロトコル変換する場合などに用いられ，互いに直接通信できないネットワーク同士の通信を可能にする機器はどれか。',
      ans: 'ゲートウェイ',
      choices: ["LANスイッチ", "ゲートウェイ", "ハブ", "リピータ"],
      comment: "ゲートウェイは、OSI基本参照モデルの7層すべてを認識するが、主にトランスポート層以上で通信プロトコルの異なるネットワーク同士を接続する役割を持つ通信装置や機能。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'デフォルトゲートウェイ',
      question: 'オフィスや家庭内のネットワークからインターネットなどの他のネットワークへアクセスするときに，他のネットワークへの出入り口の役割を果たすものはどれか。',
      ans: 'デフォルトゲートウェイ',
      choices: ["スプリッタ", "デフォルトゲートウェイ", "ハブ", "リピータ"],
      comment: "デフォルトゲートウェイは、プライベートネットワークに存在しない機器と通信を行うときに、外部ネットワークとの接続点となる機器のこと。",
      source: '平成28年秋期 問64',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'プロキシ',
      question: 'ネットワーク上でのデータの流れを中継し、フィルタリングやキャッシングを行うサーバは何か？',
      ans: 'プロキシ',
      choices: ["プロキシ", "ゲートウェイ", "デフォルトゲートウェイ", "ルータ"],
      comment: "プロキシサーバは、ネットワーク上でのデータの流れを中継し、フィルタリングやキャッシングを行うことで、セキュリティ向上やアクセス速度の改善を図るサーバ。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'MACアドレス',
      question: 'MACアドレスに関する記述のうち，適切なものはどれか。',
      ans: '同じアドレスをもつ機器は世界中で一つしか存在しないように割り当てられる。',
      choices: [
        "同じアドレスをもつ機器は世界中で一つしか存在しないように割り当てられる。",
        "国別情報が含まれており，同じアドレスをもつ機器は各国に一つしか存在しないように割り当てられる。",
        "ネットワーク管理者によって割り当てられる。",
        "プ口バイダ(ISP)によって割り当てられる。"
      ],
      comment:
          "MACアドレスは、ネットワーク上の機器を識別するために、各機器に一意に割り当てられた6バイト(48ビット)の番号のことで、同じアドレスをもつ機器は世界中で一つしか存在しないように割り当てられる。",
      source: '平成28年春期 問68',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'ESSID(Extended Service Set Identifier)',
      question: '無線LANの環境において，アクセスポイン卜と端末に設定するESSIDに関する記述として，適切なものはどれか。',
      ans: '無線LANのネットワークを識別する文字列',
      choices: ["暗号通信の鍵になる文字列", "暗号方式の種類", "無線LANで使用する電波のチャネル番号", "無線LANのネットワークを識別する文字列"],
      comment:
          "ESSID(Extended Service Set Identifier)は、無線LANの規格であるIEEE802.11シリーズにおいて「混信」を避けるためにアクセスポイントと端末に設定する識別子であるSSIDを、複数のアクセスポイントが設置されている状況に対応するため、ネットワーク識別子として拡張したもの。",
      source: '平成24年秋期 問64',
      importance: ImportanceType.high,
    ),
    QuizItem(
      word: 'イントラネット',
      question: 'イントラネットの説明として，適切なものはどれか。',
      ans: 'インターネットの技術を利用して構築された組織内ネットワーク',
      choices: [
        "インターネットの技術を利用して構築された組織内ネットワーク",
        "社外の誰もが自由に接続可能な社内ネットワーク",
        "複数の企業間で電子商取引を行うために構築されたネットワーク",
        "無線を使わずに有線だけで構成されたネットワーク"
      ],
      comment:
          "イントラネット(Intranet)は、インターネット用に開発された技術や機器を用いて構築された組織内ネットワークで、インターネットの技術にデータベースやグループウェアおよびWebブラウザを組み合わせて作られる。",
      source: '平成24年秋期 問64',
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'モデム',
      question: 'インターネットなどのネットワークにアクセスするために、電話線やケーブルを通してデータを送受信する装置は何か？',
      ans: 'モデム',
      choices: ["モデム", "ルータ", "スイッチ", "アダプタ"],
      comment:
          "モデム（Modulator-Demodulator）は、インターネットなどのネットワークにアクセスするために、電話線やケーブルを通してデータをデジタル信号とアナログ信号間で変換し送受信する装置。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'ターミナル',
      question: 'コンピュータと外部デバイスを接続するために使用される端末や装置は何か？',
      ans: 'ターミナル',
      choices: ["ターミナル", "モデム", "アダプタ", "モジュラージャック"],
      comment:
          "ターミナルは、コンピュータと外部デバイスを物理的または論理的に接続するために使用される端末や装置を指すことがある。また、特定のシステムへのアクセスポイントとして機能するデバイスのことも指す。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'アダプタ',
      question: 'ネットワークデバイスやコンピュータ間の接続を可能にするために使用されるデバイスは何か？',
      ans: 'アダプタ',
      choices: ["アダプタ", "モデム", "ターミナル", "ルータ"],
      comment: "アダプタは、ネットワークデバイスやコンピュータ間の接続を可能にするために使用されるデバイスで、物理的な接続やプロトコル変換などの機能を提供する。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'モジュラージャック',
      question: '電話線やネットワークケーブルを接続するための標準化された端子は何か？',
      ans: 'モジュラージャック',
      choices: ["モジュラージャック", "アダプタ", "モデム", "ターミナル"],
      comment: "モジュラージャックは、電話線やネットワークケーブルを接続するための標準化された端子で、RJ-11やRJ-45などの規格がある。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'LTE（Long Term Evolution）',
      question: '長距離の高速モバイル通信を実現するための通信規格は何か？',
      ans: 'LTE',
      choices: ["LTE", "5G", "Wi-Fi", "NAT"],
      comment: "LTE（Long Term Evolution）は、長距離の高速モバイル通信を実現するための通信規格で、第4世代（4G）モバイル通信技術の一つ。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '5G',
      question: '高速で大容量のデータ通信を可能にする次世代モバイル通信技術は何か？',
      ans: '5G',
      choices: ["5G", "LTE", "Wi-Fi", "SDN"],
      comment: "5Gは、高速で大容量のデータ通信を可能にする次世代モバイル通信技術で、第5世代モバイル通信システムを指す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'SDN',
      question: 'ネットワークの設定や管理をソフトウェアで制御する技術は何か？',
      ans: 'SDN',
      choices: ["SDN", "LTE", "5G", "NAT"],
      comment: "SDN（Software Defined Networking）は、ネットワークの設定や管理をソフトウェアで制御し、柔軟性と効率性を高める技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ビーコン',
      question: '特定の位置情報を提供するために使用される小型の無線送信機は何か？',
      ans: 'ビーコン',
      choices: ["ビーコン", "SDN", "LTE", "BLE"],
      comment: "ビーコンは、特定の位置情報を提供するために使用される小型の無線送信機で、Bluetooth Low Energy（BLE）などの技術を使用して情報を発信する。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'LPWA（Low Power Wide Area）',
      question: '低消費電力で広範囲をカバーするワイヤレス通信技術は何か？',
      ans: 'LPWA',
      choices: ["LPWA", "LTE", "Wi-Fi", "BLE"],
      comment: "LPWA（Low Power Wide Area）は、低消費電力で広範囲をカバーするワイヤレス通信技術で、IoTデバイスなどの接続に適している。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'エッジコンピューティング',
      question: 'データ処理をネットワークの端に近い場所で行うことでレイテンシを低減する技術は何か？',
      ans: 'エッジコンピューティング',
      choices: ["エッジコンピューティング", "SDN", "LPWA", "BLE"],
      comment: "エッジコンピューティングは、データ処理をネットワークの端に近い場所で行うことでレイテンシを低減し、効率性を高める技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'BLE',
      question: '低エネルギーで短距離通信を実現するワイヤレス技術は何か？',
      ans: 'BLE',
      choices: ["BLE", "Wi-Fi", "LTE", "LPWA"],
      comment: "BLE（Bluetooth Low Energy）は、低エネルギーで短距離通信を実現するワイヤレス技術で、ビーコンや健康機器などに使用される。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'IoTエリアネットワーク',
      question: 'IoTデバイスが相互に通信するためのネットワークは何と呼ばれるか？',
      ans: 'IoTエリアネットワーク',
      choices: ["IoTエリアネットワーク", "LAN", "WAN", "VLAN"],
      comment: "IoTエリアネットワークは、IoTデバイスが相互に通信するために構築される特定のエリアをカバーするネットワーク。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'NAT(Network Address Translation)',
      question: 'NAT(Network Address Translation)がもつ機能として，適切なものはどれか。',
      ans: 'プライベートIPアドレスをグローバルIPアドレスに対応付ける。',
      choices: [
        "IPアドレスをコンピュータのMACアドレスに対応付ける。",
        "IPアドレスをコンピュータのホスト名に変換する。",
        "コンピュータのホスト名をIPアドレスに変換する。",
        "プライベートIPアドレスをグローバルIPアドレスに対応付ける。"
      ],
      comment:
          "NAT(Network Address Translation)は、企業や組織のネットワーク内で割り当てられているプライベートIPアドレスとインターネット上でのアドレスであるグローバルIPアドレスを1対1で相互に変換する技術",
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 1901);
  });
}
