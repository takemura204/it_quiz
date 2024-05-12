import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category1_17 {
  final quizItems = [
    QuizItem(
      question: '様々なデバイスがインターネットに接続され、相互に通信することで情報を共有し、新たな価値を生み出す技術の総称は何か？',
      ans: 'IoT',
      choices: ["IoT", "クラウドソーシング", "コネクテッドカー", "マルチデバイス"],
      comment:
          "IoT（Internet of Things）は、様々な物理的なデバイスがインターネットに接続され、相互に通信することで情報を共有し、新たなサービスや価値を生み出す技術の総称。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '遠隔操作や自律飛行が可能な小型の無人航空機を何というか？',
      ans: 'ドローン',
      choices: ["ジャイロマスター", "ドローン", "コネクテッドカー", "自動運転"],
      comment: "ドローンは、遠隔操作やプログラムによる自律飛行が可能な小型の無人航空機。観測、撮影、物資輸送など様々な用途で利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'インターネットや通信ネットワークに接続され、情報の共有や遠隔制御が可能な自動車を何というか？',
      ans: 'コネクテッドカー',
      choices: ["シェアリングカー", "コネクテッドカー", "自動運転", "CASE"],
      comment:
          "コネクテッドカーは、インターネットや他の通信ネットワークに接続されることで、情報の共有や遠隔制御、他の車両やインフラとの通信が可能な自動車。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '運転者の操作なしで目的地まで移動できる自動車の技術を何というか？',
      ans: '自動運転',
      choices: ["先進運転支援システム", "自動運転", "CASE", "ADSモジュール"],
      comment:
          "自動運転は、センサーやカメラ、人工知能などを用いて、運転者の操作なしに自動車が目的地まで移動する技術。安全性の向上や運転負担の軽減が期待される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'コネクテッド、自動運転、シェアリング、電動化を指す自動車産業の新たなトレンドを何というか？',
      ans: 'CASE',
      choices: ["自動運転", "CASE", "MaaS", "ワイヤレス給電"],
      comment:
          "CASEは、Connected（コネクテッド）、Autonomous（自動運転）、Shared & Services（シェアリングとサービス）、Electric（電動化）の各頭文字を取った言葉で、自動車産業の新たなトレンドを指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '様々な交通手段を統合的に利用し、最適な移動サービスを提供するコンセプトは何か？',
      ans: 'MaaS',
      choices: ["CASE", "MaaS", "ワイヤレス給電", "公共交通計画"],
      comment:
          "MaaS（Mobility as a Service）は、様々な交通手段（公共交通、自転車シェアリング、カーシェアリングなど）を統合的に利用し、利用者に最適な移動サービスを提供するコンセプト。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ケーブルやプラグを使用せずに電力を供給する技術は何か？',
      ans: 'ワイヤレス給電',
      choices: ["ケーブルレス供給", "ワイヤレス給電", "クラウドサービス", "スマートファクトリー"],
      comment:
          "ワイヤレス給電（Wireless Power Transfer）は、電磁誘導や電磁共振などの原理を利用して、ケーブルやプラグを使用せずに電力を供給する技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'インターネットを利用して提供される、サーバーやストレージなどのITリソースを何というか？',
      ans: 'クラウドサービス',
      choices: ["ワイヤレス給電", "クラウドサービス", "スマートファクトリー", "スマート農業"],
      comment:
          "クラウドサービスは、インターネットを介して遠隔地のサーバーやストレージなどのITリソースを提供するサービス。利用者は必要に応じてリソースを利用し、使用量に応じて料金を支払う。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '高度な情報技術を導入し、製造プロセスの自動化と最適化を図る現代的な工場を何というか？',
      ans: 'スマートファクトリー',
      choices: ["クラウドサービス", "スマートファクトリー", "スマート農業", "マシンビジョン"],
      comment:
          "スマートファクトリーは、IoT、ビッグデータ、AIなどの高度な情報技術を製造業に導入し、製造プロセスの自動化や最適化を図ることで、生産性の向上や品質の安定を目指す現代的な工場。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '情報技術を農業に導入し、生産性の向上や持続可能な農業を実現する取り組みを何というか？',
      ans: 'スマート農業',
      choices: ["スマートファクトリー", "スマート農業", "マシンビジョン", "HEMS"],
      comment:
          "スマート農業は、センサーやドローン、ビッグデータ分析などの情報技術を農業に導入し、精密な作物管理や生産性の向上、資源の効率的な利用を図る取り組み。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '画像処理技術を用いて、機械が視覚情報を解析するシステムを何というか？',
      ans: 'マシンビジョン',
      choices: ["スマート農業", "マシンビジョン", "HEMS", "インダストリー4.0"],
      comment:
          "マシンビジョンは、カメラやセンサーを用いて取得した画像データをコンピュータが解析し、物体の検出、識別、測定などを行う技術。製造業の品質管理や自動化に広く利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '家庭内のエネルギー消費を管理し、省エネルギーを実現するシステムを何というか？',
      ans: 'HEMS',
      choices: ["マシンビジョン", "HEMS", "インダストリー4.0", "組込みシステム"],
      comment:
          "HEMS（Home Energy Management System）は、家庭内の電力消費をモニタリングし、エネルギーの効率的な使用や省エネルギーを実現するためのシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question:
          '第4次産業革命とも称され、IoTやAI、ビッグデータなどの技術を製造業に統合することで、新たな産業構造を生み出す動きを何というか？',
      ans: 'インダストリー4.0',
      choices: ["HEMS", "インダストリー4.0", "組込みシステム", "ロボティクス"],
      comment:
          "インダストリー4.0は、第4次産業革命とも称され、IoT、AI、ビッグデータ、ロボティクスなどの先進技術を製造業に統合することで、高度に自動化されたスマートファクトリーの実現や新たな産業構造の創出を目指す動き。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特定の機能を持つソフトウェアがハードウェアに組み込まれて動作するシステムを何というか？',
      ans: '組込みシステム',
      choices: ["組込みシステム", "HEMS", "マシンビジョン", "インダストリー4.0"],
      comment:
          "組込みシステムは、特定の機能を持つソフトウェアがハードウェアに組み込まれ、特定のタスクを実行するために最適化されたシステム。家電製品や自動車など日常生活の様々な場面で利用されている。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '自動化技術や機械技術に関連する分野で、人間の代わりに作業を行う機械やシステムを何というか？',
      ans: 'ロボティクス',
      choices: ["組込みシステム", "ロボティクス", "クラウドサービス", "スマートファクトリー"],
      comment:
          "ロボティクスは、自動化技術や機械技術に関連する分野で、人間の代わりに物理的な作業を行う機械やシステム。製造業から医療、サービス業まで幅広く応用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ハードウェアに組み込まれるソフトウェアのことを指す用語は何か？',
      ans: 'ファームウェア',
      choices: ["ロボティクス", "ファームウェア", "組込みシステム", "HEMS"],
      comment:
          "ファームウェアは、ハードウェアに組み込まれるソフトウェアのことで、ハードウェアを制御するための基本的な命令やプログラムが含まれる。デバイスや機器の基本的な動作を管理する。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1701);
  });
}
