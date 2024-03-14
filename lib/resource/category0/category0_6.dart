import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category0_6 {
  final quizItems = [
    QuizItem(
      question: 'ウェブページの構造を記述するために使用されるマークアップ言語は何か？',
      ans: 'HTML',
      choices: ["HTML", "CSS", "JavaScript", "XML"],
      comment:
          "HTML（HyperText Markup Language）は、ウェブページの構造を記述するために使用される標準的なマークアップ言語。",
    ),
    QuizItem(
      question: '電源が切れてもデータを保持し、USBメモリやSSDなどに利用される非揮発性の記憶媒体は何か？',
      ans: 'フラッシュメモリ',
      choices: ["フラッシュメモリ", "SRAM", "DRAM", "ROM"],
      comment: "フラッシュメモリは、電源が切れてもデータを保持する非揮発性の記憶媒体で、USBメモリやSSDなどに利用される。",
    ),
    QuizItem(
      question: 'CPUがよくアクセスするデータや命令を一時的に保存し、アクセス速度の向上を図るメモリは何か？',
      ans: 'キャッシュメモリ',
      choices: ["キャッシュメモリ", "SRAM", "DRAM", "ROM"],
      comment: "キャッシュメモリは、CPUが頻繁にアクセスするデータや命令を一時的に保存し、データアクセス速度の向上を図るための高速メモリ。",
    ),
    QuizItem(
      question: 'ハードウェアデバイスをオペレーティングシステムが認識し、利用できるようにするためのソフトウェアは何か？',
      ans: 'デバイスドライバ',
      choices: ["デバイスドライバ", "ファームウェア", "オペレーティングシステム", "アプリケーションソフトウェア"],
      comment: "デバイスドライバは、ハードウェアデバイスをオペレーティングシステムが認識し、利用できるようにするためのソフトウェア。",
    ),
    QuizItem(
      question: '2つのシステムが互いにバックアップを取り合い、一方が故障した場合に他方が処理を引き継ぐシステム構成は何か？',
      ans: 'デュアルシステム',
      choices: ["デュアルシステム", "デュプレックスシステム", "クラスタシステム", "ホットスタンバイ"],
      comment: "デュアルシステムは、2つのシステムが互いにバックアップを取り合うシステム構成で、一方が故障した際に他方が処理を引き継ぐ。",
    ),
    QuizItem(
      question: 'サーバ側でほとんどの処理を行い、クライアント側の機能を最小限に抑えたコンピュータシステムは何か？',
      ans: 'シンクライアント',
      choices: ["シンクライアント", "ファットクライアント", "デュアルシステム", "クラスタシステム"],
      comment: "シンクライアントは、サーバ側でほとんどの処理を行い、クライアント側の機能を最小限に抑えたコンピュータシステムを指す。",
    ),
    QuizItem(
      question: '複数のディスクドライブを組み合わせてデータの冗長性や性能を向上させる技術は何か？',
      ans: 'RAID',
      choices: ["RAID", "NAS", "SSD", "HDD"],
      comment:
          "RAID（Redundant Array of Independent Disks）は、複数のディスクドライブを組み合わせてデータの冗長性や性能を向上させる技術。",
    ),
    QuizItem(
      question: 'システムや製品が平均して故障するまでの時間は何と呼ばれるか？',
      ans: 'MTBF',
      choices: ["MTBF", "MTTR", "稼働率", "寿命"],
      comment:
          "MTBF（Mean Time Between Failures）は、システムや製品が平均して故障するまでの時間を指し、信頼性や耐久性を示す指標。",
    ),
    QuizItem(
      question: 'システムや製品が故障から復旧するまでの平均時間は何と呼ばれるか？',
      ans: 'MTTR',
      choices: ["MTTR", "MTBF", "稼働率", "復旧時間"],
      comment:
          "MTTR（Mean Time To Repair）は、システムや製品が故障から復旧するまでの平均時間を指し、メンテナンスの効率性や迅速性を示す指標。",
    ),
    QuizItem(
      question: 'システムが故障なしに稼働し続けることができる確率、または稼働時間の割合は何と呼ばれるか？',
      ans: '稼働率',
      choices: ["稼働率", "可用性", "信頼性", "継続性"],
      comment: "稼働率は、システムが故障なしに稼働し続けることができる確率、または稼働時間の割合を指し、システムの可用性を示す指標。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 51, isPremium: false);
  });
}
