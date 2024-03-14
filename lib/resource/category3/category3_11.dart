import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_11 {
  final quizItems = [
    QuizItem(
      question: 'データや情報が正確に複製され、複数のシステムやデータベース間で同期されるプロセスは何か？',
      ans: 'レプリケーション',
      choices: ["レプリケーション", "クラスタリング", "ロードバランシング", "キャッシング"],
      comment: "レプリケーションは、データや情報が正確に複製され、複数のシステムやデータベース間で同期されるプロセスを指す。",
    ),
    QuizItem(
      question: 'ネットワークなどに接続されずに単独で動作するコンピュータシステムは何と呼ばれるか？',
      ans: 'スタンドアロン',
      choices: ["スタンドアロン", "デュアルシステム", "クライアントサーバシステム", "ピアツーピア"],
      comment: "スタンドアロンは、ネットワークなどに接続されずに単独で動作するコンピュータシステムを指す。",
    ),
    QuizItem(
      question: '2つのシステムが互いにバックアップを取り合い、一方が故障した場合に他方が処理を引き継ぐシステム構成は何か？',
      ans: 'デュアルシステム',
      choices: ["デュアルシステム", "デュプレックスシステム", "クラスタシステム", "ホットスタンバイ"],
      comment: "デュアルシステムは、2つのシステムが互いにバックアップを取り合うシステム構成で、一方が故障した際に他方が処理を引き継ぐ。",
    ),
    QuizItem(
      question: '2つのコンポーネントが同時に動作し、一方が故障した際にもう一方が即座に処理を引き継ぐシステム構成は何か？',
      ans: 'デュプレックスシステム',
      choices: ["デュプレックスシステム", "デュアルシステム", "クラスタシステム", "ホットスタンバイ"],
      comment:
          "デュプレックスシステムは、2つのコンポーネントが同時に動作し、一方が故障した際にもう一方が即座に処理を引き継ぐシステム構成を指す。",
    ),
    QuizItem(
      question: 'クライアントがサービスを要求し、サーバがそれに応答する形式のネットワークシステム構成は何か？',
      ans: 'クライアントサーバシステム',
      choices: ["クライアントサーバシステム", "ピアツーピア", "スタンドアロン", "クラスタシステム"],
      comment: "クライアントサーバシステムは、クライアントがサービスを要求し、サーバがそれに応答する形式のネットワークシステム構成を指す。",
    ),
    QuizItem(
      question: 'ネットワーク上のすべてのコンピュータが等価な立場でデータやリソースを共有するシステム構成は何か？',
      ans: 'ピアツーピア',
      choices: ["ピアツーピア", "クライアントサーバシステム", "スタンドアロン", "クラスタシステム"],
      comment: "ピアツーピア（P2P）は、ネットワーク上のすべてのコンピュータが等価な立場でデータやリソースを共有するシステム構成を指す。",
    ),
    QuizItem(
      question: '複数のサーバが連携して高可用性や負荷分散を実現するシステム構成は何か？',
      ans: 'クラスタシステム',
      choices: ["クラスタシステム", "デュアルシステム", "デュプレックスシステム", "ピアツーピア"],
      comment: "クラスタシステムは、複数のサーバが連携して高可用性や負荷分散を実現するシステム構成を指す。",
    ),
    QuizItem(
      question: 'サーバ側でほとんどの処理を行い、クライアント側の機能を最小限に抑えたコンピュータシステムは何か？',
      ans: 'シンクライアント',
      choices: ["シンクライアント", "ファットクライアント", "デュアルシステム", "クラスタシステム"],
      comment: "シンクライアントは、サーバ側でほとんどの処理を行い、クライアント側の機能を最小限に抑えたコンピュータシステムを指す。",
    ),
    QuizItem(
      question: 'ネットワークに接続された専用のファイルストレージデバイスは何か？',
      ans: 'NAS',
      choices: ["NAS", "SAN", "SSD", "HDD"],
      comment:
          "NAS（Network Attached Storage）は、ネットワークに直接接続される専用のファイルストレージデバイスを指す。",
    ),
    QuizItem(
      question: '複数のディスクドライブを組み合わせてデータの冗長性や性能を向上させる技術は何か？',
      ans: 'RAID',
      choices: ["RAID", "NAS", "SSD", "HDD"],
      comment:
          "RAID（Redundant Array of Independent Disks）は、複数のディスクドライブを組み合わせてデータの冗長性や性能を向上させる技術。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 101 + 3000);
  });
}